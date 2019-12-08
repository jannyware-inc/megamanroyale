display_set_gui_size(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
draw_set_halign(fa_left);
if(black1Draw){
	draw_set_alpha(1);
} else if (black2Draw){
	draw_set_alpha(.8);
} else if (black3Draw){
	draw_set_alpha(.4);
} else {
	draw_set_alpha(0);
}
draw_set_color(c_black);
draw_rectangle(0,0,camera_get_view_width(view_camera[0]),79,0);
draw_rectangle(0,camera_get_view_height(view_camera[0]),camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])-96,0);

draw_set_alpha(1);
draw_set_color(c_white);
//draw_text(2,2,dt);

draw_sprite(bossSprite, floor(bossIndex), bossX,bossY);
draw_set_font(fnt_megamanSmall);
draw_text(bossTextX,bossTextY,string_copy(bossName,1,bossNameIndex));

if(blackTimer >= blackFront){
	draw_set_color(c_black);
	draw_rectangle(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0);
}