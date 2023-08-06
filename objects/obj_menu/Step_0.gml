

	if (keyboard_check_pressed(vk_enter) or global.auto_select_menu != -1) {
		
		if (hover == 0) {
			// CLIENT
			create_client();
		} else {
			// SERVER
			create_server();
		}
		
		if (option_auto_create_serv_client) {
			global.auto_select_menu = -1; // reset, so it won't repeat on fail
		}
		
		instance_destroy();
	}