
	connect = -1;
	socket = network_create_socket(network_socket_tcp);
	buff = buffer_create(0, buffer_grow, 1);
	
	if (socket == -1) {
		show_message("C: ! Can't create socket.");
		instance_destroy();
		exit;
	}
	
	ip = option_ip;
	connect = network_connect(socket, ip, option_port);
	
	if (connect == -1) {
		show_message($"C: ! Can't connect to {ip}:{option_port}.");
		instance_destroy();
		exit;
	}
	
	show_debug_message($"C: + Connected to server. Connection id: {connect}, socket id: {socket}");
	alarm[0] = 1;
	timeout = 0;