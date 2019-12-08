draw_sprite(sprite_index, image_index, round(x), round(y));
for(i = 0; i < segments; i++){
	if(!global.lowgfx)
		draw_sprite_ext(spr_snakeman_enemy_snakewallsegment, 0, round(x+sprite_width-sprite_get_width(spr_snakeman_enemy_snakewallsegment)+global.shadowX), round(((y+sprite_height+sprite_get_height(spr_snakeman_enemy_snakewallsegment)*i))+global.shadowY),image_xscale,image_yscale,0,c_black,.4);
	draw_sprite(spr_snakeman_enemy_snakewallsegment,0,x+sprite_width-sprite_get_width(spr_snakeman_enemy_snakewallsegment),y+sprite_height+sprite_get_height(spr_snakeman_enemy_snakewallsegment)*i);
}
