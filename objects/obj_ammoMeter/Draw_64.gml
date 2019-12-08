if(player.weapon.infiniteAmmo){
	return;
}

display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
if(player.weapon.meterSprite != noone){
	var j = 0;
	if(curSize >= 0){
		for(j = 0; j < maxSize-curSize; j++){
			draw_sprite(spr_ammoMeter_empty,0,drawX,drawY+j*2);
		} 
	} else {
		for(j = 0; j < curSize; j++){
			draw_sprite(spr_ammoMeter_empty,0,drawX,drawY+j*2);
		}
	}

	for(j = j; j < maxSize; j++){
		//draw_sprite(player.weapon.meterSprite,0,drawX,drawY+j*2);
		draw_sprite_ext(spr_ammo_primary,0,drawX,drawY+j*2,1,1,0,global.player.colorprimary,1);
		draw_sprite_ext(spr_ammo_secondary,0,drawX,drawY+j*2,1,1,0,global.player.colorsecondary,1);
		draw_sprite_ext(spr_ammo_outline,0,drawX,drawY+j*2,1,1,0,c_black,1);
	}
}