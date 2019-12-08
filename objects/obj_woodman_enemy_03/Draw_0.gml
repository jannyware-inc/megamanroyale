if(!global.lowgfx)
	draw_sprite_ext(spr_woodman_enemy_03_tail, tailIndex, round(x+43+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,0,c_black,.4);
draw_sprite(sprite_index, image_index, round(x), round(y));
draw_sprite(spr_woodman_enemy_03_tail, tailIndex, round(x+43), round(y));
