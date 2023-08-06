/// @desc move_to_point_smooth(x, y, sp) - moves instance smoothly returns true on arrival.
/// @param {Real} _x
/// @param {Real} _y
/// @param {Real} _speed
/// @return {Bool} whether arrived at target
function move_until_point_smooth(_x, _y, _speed = 1) {

		_x = round(_x);
		_y = round(_y);
		var _diff, _diffx, _diffy;
	
		_diffx = abs(x - _x);
		_diffy = abs(y - _y);
	
		var _steps = max(ceil(_diffx/_speed), ceil(_diffy/_speed));
	
		_diff = x - _x;
		x -= min(_diffx, _diffx/_steps) * sign(_diff);
	
		_diff = y - _y;
		y -= min(_diffy, _diffy/_steps) * sign(_diff);
	
		return (round(x) == _x and round(y) == _y) ? true : false;
}