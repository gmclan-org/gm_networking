function scr_go_back_menu() {
	var _id = id;
	with (all) {
		if (id != _id) {
			instance_destroy(id, false);
		}
	}
	
	if (!instance_exists(obj_menu)) {
		instance_create_layer(0, 0, layer, obj_menu);
	}
}