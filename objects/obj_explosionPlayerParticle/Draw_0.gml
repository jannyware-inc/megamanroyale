if(!global.lowgfx)
	draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,0,c_black,.4);
draw_sprite(sprite_index, image_index, round(x), round(y));
//draw_text(x,y,sprite_get_speed(sprite_index));