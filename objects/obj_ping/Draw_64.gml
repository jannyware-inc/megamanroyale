
if(global.developerMode == 0){
	visible = false;
	return;
}

display_set_gui_size(window_get_width(),window_get_height());
draw_set_font(fnt_megamanSmall);
draw_set_halign(fa_right);
draw_text_outlined(window_get_width()-1,1,c_black,c_aqua,"Ping: " + string(framesSinceLastUpdate));
draw_set_halign(fa_left);
draw_set_font(fnt_5x5);
if(netmap!= noone){
	var k = ds_map_find_first(netmap),
	var maptext = "";
	while (!is_undefined(k)) {
		maptext += k + ": " + netmap[? k] + "#";
		k = ds_map_find_next(netmap, k);
	}
	draw_text(100, 10, maptext);
}