

	draw_reset(c_black, 1, fnt_main, fa_center, fa_bottom);
	
	draw_text(room_width / 2, room_height - 5, "Arrow keys - move | Esc - disconnect");
	
	if (timeout > 30) {
		draw_reset(c_red,,, fa_left, fa_top);
		draw_text(5, 5, $"Timeout: {timeout}");
	}
	
	scr_dim_if_inactive();