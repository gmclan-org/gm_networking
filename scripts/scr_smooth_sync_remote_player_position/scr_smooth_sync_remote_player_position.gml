function scr_smooth_sync_remote_player_position() {
	var _d = point_distance(x, y, destx, desty);
	
	if (_d > 100) {
		x = destx;
		y = desty;
	} else {
		move_until_point_smooth(destx, desty, option_player_speed);
	}
}