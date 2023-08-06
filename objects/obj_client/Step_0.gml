/// @desc movement

	timeout++;
	if (timeout > 120) {
		instance_destroy();
	}

	x += (keyboard_check(vk_right) - keyboard_check(vk_left)) * 4;
	y += (keyboard_check(vk_down) - keyboard_check(vk_up)) * 4;