if(transparent)
	draw_set_alpha(.75);
draw_sprite(sprite_index, image_index, round(x), round(y));
draw_set_alpha(1);