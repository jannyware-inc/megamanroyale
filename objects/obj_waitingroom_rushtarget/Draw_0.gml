draw_sprite_ext(sprite_index, image_index, round(x), round(y),image_xscale,image_yscale,0,c_white,1);
draw_set_halign(fa_center);
if(global.rush == dat_rushcoil){
	draw_text_outlined(x,y-20,c_black,c_white,"Rush Coil");
} else if(global.rush == dat_rushjet) {
	draw_text_outlined(x,y-20,c_black,c_white,"Rush Jet");
}
draw_set_halign(fa_left);