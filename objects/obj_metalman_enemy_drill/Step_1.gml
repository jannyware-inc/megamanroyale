centerx = x;
centery = y-sprite_height/2;

if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(place_meeting(x,y,obj_metalman_enemy_drillkiller)){
	instance_destroy();
}


if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}

if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(place_meeting(x,y,obj_wall)){
	vspd = vsideFacing * wallspd;
	metwall = true;
} else {
	vspd = vsideFacing * risespd;
	if(metwall){
		selfdestroy = true;
	}
}


if(selfdestroy and aliveTimer > 0){
	aliveTimer--;
} else if(selfdestroy){
	instance_destroy();
}

y+=vspd;

image_yscale = -vsideFacing;