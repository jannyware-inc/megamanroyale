display_set_gui_size(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
draw_set_font(fnt_megamanSmall);
draw_set_halign(fa_center);
if(timer%30 < 15){
	draw_text_outlined(camera_get_view_width(view_camera[0])/2,50,c_black,c_white,"Ready!");
}
draw_set_halign(fa_left);