function scr_dim_if_inactive() {
	if (! window_has_focus() ) {
		draw_set_color(c_black);
		draw_set_alpha(0.4);
		
		draw_rectangle(-1, -1, display_get_gui_width() + 1, display_get_gui_height() + 1, false);
	}
}