if(global.lowgfx)
return;

with(obj_player){
	if(visible and !invisible and !skipDraw)
		draw_sprite_ext(sprite_index, image_index, floor(x+global.shadowX), ceil(y-.01+(sideUp == -1)*(-20)+global.shadowY),sideFacing,sideUp,image_angle,c_black,.4);
}
with(obj_enemy){
	if(visible)
		draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.4);
}
with(obj_remotePlayer){
	if(visible and !invisible and inRoom)
		draw_sprite_ext(sprite_index, image_index, floor(x+global.shadowX), ceil(y-.01+global.shadowY),sideFacing,image_yscale,image_angle,c_black,.2);
}
with(obj_bullet){
	if(visible)
		draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.4);
}
with(obj_pickup){
	if(visible)
		draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.4);
}
with(obj_remoteBullet){
	if(visible)
		draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.2);
}
with(obj_intromm){
	if(visible and !noShadow)
		draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.4);
}
with(obj_rush){
	if(visible)
		draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.4);
}
with(obj_remoterush){
	if(visible)
		draw_sprite_ext(sprite_index, image_index, round(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.2);
}
with(obj_startmegaman){
	if(visible)
		draw_sprite_ext(sprite_index, image_index, floor(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.4);
}
with(obj_image){
	if(visible)
		draw_sprite_ext(sprite_index, image_index, floor(x+global.shadowX), round(y+global.shadowY),image_xscale,image_yscale,image_angle,c_black,.4);
}