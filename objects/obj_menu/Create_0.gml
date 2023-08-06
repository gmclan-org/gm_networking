

	menu_entries = [ $"Join game: {option_ip}:{option_port}", "Create Server"];
	hover = 0;
	
	// FOR TEST ONLY
	if (option_auto_create_serv_client) {
		hover = clamp(global.auto_select_menu, 0, 1);
	}
	
	create_server = function() {
		instance_create_layer(0, 0, layer, obj_server);
	}
	
	create_client = function() {
		instance_create_layer(irandom_range(100, room_width - 100), irandom_range(100, room_height - 100), layer, obj_client);
	}