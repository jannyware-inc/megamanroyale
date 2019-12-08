if(!global.lowgfx){
	draw_sprite_ext(sprite_index, image_index, round(x)+1, round(y)+1,image_xscale,image_yscale,0,c_black,.4*curAlpha);
	draw_sprite_ext(sprite_index, image_index, round(x), round(y),image_xscale,image_yscale,image_angle,c_white,curAlpha);
} else {
	draw_self();
}