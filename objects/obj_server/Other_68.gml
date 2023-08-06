

	var _sock = async_load[? "id"]; // id of socket from which data comes
	
	if (_sock == server) {
		#region CLIENTS new/disconnect
		// if data incoming to our server (server socket)
		
		var _type = async_load[? "type"]; // GM internal event type
		var _incoming_socket = async_load[? "socket"]; // id of socket on which data came
		
		if (_type == network_type_connect) {
			// that's new connection, so new socket was just created - we need to save it
			// so whe later can differentiate clients
			show_debug_message($"S: + new client connected on socket {_incoming_socket}");
			
			clients[? _incoming_socket] = instance_create_layer(room_width/2, room_height/2, layer, obj_server_player);
			clients[? _incoming_socket].desc = $"Player: {_incoming_socket}";
			clients[? _incoming_socket].socket = _incoming_socket;
		} else if (_type == network_type_disconnect) {
			// player disconnected
			show_debug_message($"S: - client {_incoming_socket} disconnected");
			
			var _player = clients[? _incoming_socket];
			if (instance_exists(_player)) {
				instance_destroy(_player);
			}
			
			ds_map_delete(clients, _incoming_socket);
			network_destroy(_incoming_socket);
		}
		#endregion
	} else {
		// that's data received on another socket, which means it's someone connected
		
		if (!ds_map_find_value(clients, _sock) < 0) {
			show_debug_message($"S: There's incoming data, but seems that this player ({_sock}) doesn't exists anymore...");
			exit; // don't process
		}
		
		var _buff = async_load[? "buffer"]; // this is data we got
		
		buffer_seek(_buff, buffer_seek_start, 0); // rewind buffer to be sure we're reading from start
		var _command = buffer_read(_buff, buffer_u8); // get first byte, which marks our command
		var _p = clients[? _sock]; // get player instance
		
		#region commands
		switch(_command) {
			case COMMAND_POSITION:
				_p.destx = buffer_read(_buff, buffer_u16);		
				_p.desty = buffer_read(_buff, buffer_u16);
				break;
				
			case COMMAND_FIRE:
				var _dir = buffer_read(_buff, buffer_u16);
				var _x = buffer_read(_buff, buffer_u16);
				var _y = buffer_read(_buff, buffer_u16);
				
				instance_create_layer(_x, _y, layer, obj_bullet, {direction: _dir});
				
				// clear buffer
				buffer_resize(buff, 0);
				buffer_seek(buff, buffer_seek_start, 0);
				// write data
				buffer_write(buff, buffer_u8, COMMAND_FIRE);
				buffer_write(buff, buffer_u16, _dir);
				buffer_write(buff, buffer_u16, _x);
				buffer_write(buff, buffer_u16, _y);
				
				network_send_to_clients_except(_sock, buff);
			break;
				
			default:
				show_debug_message($"S: Got unknown command {_command} from player on socket {_sock}");
		}
		#endregion
	}