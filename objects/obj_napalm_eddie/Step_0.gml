centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "sleep";
	return;
}

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "sleep"){
	if(scr_distanceToPlayer() < attackDistance and abs(y - global.player.y) < attackY){
		state = "wakeup";
		image_index = 0;
	}
} else if (state == "wakeup"){
	if(image_index > 1){
		image_index = 1;
	}
	if(wakeupTimer > 0){
		wakeupTimer--;
	} else {
		wakeupTimer = wakeupTimerMax;
		state = "move";
		sideFacing = scr_playerSideCentered();
	}
} else if (state == "move"){
	if(grounded){
		hspd = spd*sideFacing;
	} else {
		hspd = 0;
	}
} 

vspd += grav;
grounded = 0;
if (place_meeting(x, y+vspd, obj_wall)) {
	_wall = instance_place(x,y+vspd,obj_wall)
	if(_wall.y > y)
		grounded = 1;
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
		
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
		sideFacing = -sideFacing;
	}	
x+=hspd;


if (state == "sleep"){
	sprite_index = spr_napalm_cautioncone_sleep;
} else if (state == "wakeup"){
	sprite_index = spr_napalm_cautioncone_wakeup;
} else if (state == "move"){
	sprite_index = spr_napalm_cautioncone_move;
}