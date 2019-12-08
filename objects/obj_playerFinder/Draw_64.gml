display_set_gui_size(window_get_width(),window_get_height());


if(global.connected == 1){
	draw_set_font(fnt_megamanSmall);
	index = 1;
	draw_set_color(c_red);
	draw_set_halign(fa_right);
	vw = window_get_width();
	var size, key, i;
	//draw_text(vw,2,"players:");
	size = ds_map_size(global.playerID);
	key = ds_map_find_first(global.playerID);
	if(size == 0){
		draw_text(vw-2,2,"There are no other players online.");
	} else {
		for (i = 0; i < size; i++;){
			if(instance_exists(global.playerID[? key]))
				draw_text(vw-2,12*i+2,global.playerID[? key].username + " is in " + scr_get_room_name(global.playerID[? key].curRoom));
			key = ds_map_find_next(global.playerID, key);
		}
	}
}
