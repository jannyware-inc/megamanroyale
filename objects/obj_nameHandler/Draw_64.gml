
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
scr_draw9slice(spr_9slice_mm2,186,7,373,160);
draw_set_halign(fa_center);	

//text
draw_set_font(fnt_megamanSmall);
draw_set_color(c_white);

draw_text(floor(camera_get_view_width(view_camera[0])/2),alignTop,textTop);


if(global.server == 0){
	draw_set_halign(fa_left);
	scr_draw9slice(spr_9slice_mm2,146,alignBottom-7,413,alignBottom+16);
	draw_set_color(c_red);
	draw_set_halign(fa_center);	
	if(blinkTimer <40)
		draw_text(floor(camera_get_view_width(view_camera[0])/2),alignBottom,"You are not connected to the server!");
} else if (global.server == 1){
	draw_set_halign(fa_left);
	scr_draw9slice(spr_9slice_mm2,155,alignBottom-7,405,alignBottom+16);
	draw_set_color(c_lime);
	draw_set_halign(fa_center);	
	if(blinkTimer < 40)
		draw_text(floor(camera_get_view_width(view_camera[0])/2),alignBottom,"You are connected to the server!");
}

draw_set_color(c_white);

if(global.server){
	draw_set_halign(fa_center);
	scr_draw9slice(spr_9slice_mm2,10,50,140,78);
	draw_text(75,56,"Current Lobby:\n" + string(global.lobbyCurrent) + "/" + string(global.lobbyTarget) + " players");
}