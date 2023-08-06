/// @desc clear data
	
	// cleanup event is performed also on deactivated objects
	
	var _players = ds_map_keys_to_array(clients);
	for(var i = 0, l = array_length(_players); i < l; i++) {
		network_destroy(_players[i]);
		instance_destroy(clients[? _players[i]]);
	}
	
	ds_map_destroy(clients);
	network_destroy(server);
	buffer_delete(buff);
	
	scr_go_back_menu();