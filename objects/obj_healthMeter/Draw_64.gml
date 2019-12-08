display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
var j = 0;
if(currentHp >= 0){
	for(j = 0; j < maxHp-currentHp; j++){
		draw_sprite(spr_healthMeter_empty,0,drawX,drawY+j*2);
	} 
} else {
	for(j = 0; j < maxHp; j++){
		draw_sprite(spr_healthMeter_empty,0,drawX,drawY+j*2);
	}
}
for(j = j; j < maxHp; j++){
	draw_sprite(spr_healthMeter_full,0,drawX,drawY+j*2);
}