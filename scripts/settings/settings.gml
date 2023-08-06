#macro option_ip "127.0.0.1"
#macro option_port 14804
#macro option_player_speed 4
#macro option_sync_every_frames 5

#macro COMMAND_POSITION 1
#macro COMMAND_PLAYERS_POS 2
#macro COMMAND_FIRE 3
#macro COMMAND_PING 4

randomize();

#region debug
//// --- EASIER DEBUGGING code ---

// below code allows to autostart server and client(s),
// if using more than to 2 multiclient instances and "option_auto_move_window" is true
// it's good to have at least 2 monitors

#macro option_auto_create_serv_client false // skip showing menu when mc-window-number is set
#macro option_auto_move_window true // set windows positions when mc-window-number is set

global.auto_select_menu = -1;

var _auto_created_windows = 0;

var _game_number = 0;

show_debug_message("PARAMETERS");
for (var i = 0; i < parameter_count(); i++) {
	if (parameter_string(i) == "mc-window-number" and parameter_count() >= i+1) {
		_game_number = real(parameter_string(i+1));
	}
}

if (_game_number > 0) {
	if (_game_number == 1) {
		if (option_auto_create_serv_client) {
			global.auto_select_menu = 1; // SERVER
		}
		if (option_auto_move_window) {
			window_set_position(20, 200);
		}
	} else {
		// it is second or later window created
		if (option_auto_create_serv_client) {
			global.auto_select_menu = 0; // CLIENT
		}
		if (option_auto_move_window) {
			window_set_position(-800 + _game_number * 820, 200);
		}
	}
}
#endregion