/// @desc sync clients

	alarm[0] = option_sync_every_frames; // send data again in next X frames
	
	if (ds_map_size(clients) > 1) {
		// send only if there's more than one player
		
		var _players = ds_map_keys_to_array(clients);
		
		// foreach player
		for(var i = 0, isize = array_length(_players); i < isize; i++) {
			
			var _socket = _players[i]; // player which is processed now
			var _p = clients[? _socket];
			
			// clear buffer
			buffer_resize(buff, 0);
			buffer_seek(buff, buffer_seek_start, 0);
			// write data
			buffer_write(buff, buffer_u8, COMMAND_PLAYERS_POS);
			buffer_write(buff, buffer_u8, _socket);
			buffer_write(buff, buffer_u16, round(_p.destx));
			buffer_write(buff, buffer_u16, round(_p.desty));
			
			network_send_to_clients_except(_socket, buff);
		}
	} else {
		// ping this user, to reset his timeout
		// clear buffer
		buffer_resize(buff, 0);
		buffer_seek(buff, buffer_seek_start, 0);
			// write data
		buffer_write(buff, buffer_u8, COMMAND_PING);
		
		network_send_to_clients_except(-1, buff);
	}