

	draw_reset( , 1, fnt_main, fa_center, fa_middle);
	
	var l = array_length(menu_entries);
	for(var i = 0; i < l; i++) {
		draw_set_color(i == hover ? c_blue : c_white);
		//draw_set_alpha(i == hover ? 1 : 0.4);
		draw_text(room_width / 2, 300 + i * 50, menu_entries[i]);
	}
	
	draw_reset(c_black, 1, , fa_center, fa_bottom);
	draw_text(room_width / 2, room_height - 5, "Arrow keys - Move around menu | Enter - Select");
	
	/*
		neat trick which coverts key presses to +1/-1
		and also ensures that modulo operation isn't negative
		(a + a + b) % c == (a + b) %c
	*/
	hover = (l + hover + keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)) % l;