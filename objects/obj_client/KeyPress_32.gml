

	var a = instance_create_layer(x, y, layer, obj_bullet);
	a.direction = irandom(360);
	
	// clear buffer
	buffer_resize(buff, 0);
	buffer_seek(buff, buffer_seek_start, 0);
	// write data
	buffer_write(buff, buffer_u8, COMMAND_FIRE);
	buffer_write(buff, buffer_u16, a.direction);
	buffer_write(buff, buffer_u16, a.x);
	buffer_write(buff, buffer_u16, a.y);
	
	network_send_packet(socket, buff, buffer_tell(buff));