if(blinking){
	draw_sprite_ext(spr_bossblink, image_index, round(centerx), round(centery),image_xscale,image_yscale,0,c_white,1);
} else {
	draw_sprite_ext(sprite_index, image_index, round(x), round(y),image_xscale,image_yscale,0,c_white,1);
}
//draw_text_outlined(x,y-40,c_black,c_white,string(state));