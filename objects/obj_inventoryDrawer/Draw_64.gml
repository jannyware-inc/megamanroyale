camH = camera_get_view_height(view_camera[0]);
camW = camera_get_view_width(view_camera[0]);
display_set_gui_size(camW, camH);
//draw_set_alpha(.65);
draw_set_color(c_black);

//draw_rectangle(boxX,boxY-boxH,boxW,boxY,0);
scr_draw9slice(spr_9slice_mm2,boxX,boxY-boxH,boxW,boxY);
draw_set_alpha(1);
var size, key, i;
draw_set_color(c_white);
	//draw_text(vw,2,"players:");
	/*
	size = ds_map_size(global.weapons);
	key = ds_map_find_first(global.weapons);
	if(size == 0){
		draw_text(itemStartX,(camH-boxH)+itemStartY,"Inventory is empty.");
	} else {
		for (i = 0; i < size; i++;){
			if(instance_exists(global.weapons[? key]))
				draw_sprite(global.weapons[? key].sprite,0,itemStartX+i*itemDeltaX,(camH-boxH)+itemStartY);
			key = ds_map_find_next(global.weapons, key);
		}
	}*/
draw_set_font(fnt_megamanSmall);
draw_set_halign(fa_center);
for (i = 0; i < 5; i++;){
	if(instance_exists(global.player.weapons[i]))
		draw_set_color(c_white);
	draw_sprite(global.player.weapons[i].sprite,0,itemStartX+i*itemDeltaX,(camH-boxH)+itemStartY);
	if(global.player.weapons[i].selectable){
		draw_set_color(c_red);
		draw_text_outlined(itemStartX+i*itemDeltaX+numX,(camH-boxH)+itemStartY+numHeight,c_black,c_white,string(i+1));
	}
	draw_set_color(c_white);
	if(global.player.weapons[i] == global.player.weapon)
		draw_sprite(spr_inv_selectorSmall,0,itemStartX+i*itemDeltaX,(camH-boxH)+itemStartY);
}
draw_set_halign(fa_left);
//draw_set_color(c_red);
//draw_sprite(spr_pickup_1up,0,livesX+sprite_get_width(spr_pickup_1up)/2,livesY);
//draw_text_outlined(livesX+sprite_get_width(spr_pickup_1up),livesY-sprite_get_height(spr_pickup_1up)/2-2,c_black,c_white,string(" x " + string(global.player.life)));
for(i = 0; i < global.player.life; i++){
	draw_sprite(spr_pickup_1up,0,livesX+i*4,livesY);
}
for(i = 0; i < global.player.etanks; i++){
	draw_sprite(spr_pickup_etank,0,livesX+sprite_get_width(spr_pickup_1up)+string_width(string(" x " + string(global.player.life)))+i*4+12,livesY);
}
//draw_text(dropX,dropY,"Drop chance: " + string(global.player.dropChance));