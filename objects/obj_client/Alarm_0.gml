

	// clear buffer
	buffer_resize(buff, 0);
	buffer_seek(buff, buffer_seek_start, 0);
	// write data
	buffer_write(buff, buffer_u8, COMMAND_POSITION);
	buffer_write(buff, buffer_u16, round(x));
	buffer_write(buff, buffer_u16, round(y));
	
	network_send_packet(socket, buff, buffer_tell(buff));
	
	alarm[0] = option_sync_every_frames; // send this data every X frames