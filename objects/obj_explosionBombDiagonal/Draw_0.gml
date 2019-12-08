if(!global.lowgfx)
draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.4*alpha);
draw_sprite_ext(sprite_index, image_index, round(x), round(y),image_xscale,image_yscale,image_angle,c_white,alpha);