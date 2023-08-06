/// @desc timeout; smooth move

	timeout++;
	
	if (timeout > 120) {
		// no data for 2 seconds
		instance_destroy();
	}

	scr_smooth_sync_remote_player_position();