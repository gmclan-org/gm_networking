

	draw_reset(c_purple, 1, fnt_main, fa_left, fa_top);
	
	draw_text(80, 10, string("Server is listening on port: {0} | Esc - quit.\nConnected players: {1}", option_port, ds_map_size(clients)));
	
	scr_dim_if_inactive();