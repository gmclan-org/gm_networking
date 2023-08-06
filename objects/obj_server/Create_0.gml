

	port = option_port;
	buff = buffer_create(0, buffer_grow, 1);
	
	// try creating server, max 20 players
	server = network_create_server(network_socket_tcp, port, 10);
	
	if (server == -1) {
		/* error creating server - usually port is alrady in use by another app,
		but this might also happen if our server crashed - port will be still taken for few seconds by OS */
		
		network_destroy(server); // to prevent blocking port
		show_error($"Can't create Server - port {port} in use", true);
		exit;
	}
	
	// create database of connections
	clients = ds_map_create(); // this is cleared in Clean Up event to avoid memory leak
	
	alarm[0] = 1; // send data about players
	