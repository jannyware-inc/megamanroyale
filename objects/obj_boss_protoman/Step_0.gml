centerx = x;
centery = y-sprite_height/2;

if(!scr_inZone()){
	//instance_destroy();
	global.player.canInput = true;
	return;
}
if(scr_inZoneAndView()){
	visible = true;
} else {
	visible = false;
}

if(global.player.dead > 0){
	instance_create_depth(x,y,depth,obj_boss_protoman_teleportaway);
	instance_destroy();
	return;
}

scr_hurtblink();
if(hp <= 0 and canDie){
	instance_create_depth(x,y,depth,obj_boss_protoman_teleportaway);
	with(obj_hardman_protomanrock){
		destroy = true;
	}
	instance_destroy();
	return;
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "whistle"){
	visible = false;
	if(whistleTimer > 0){
		whistleTimer--;
	} else {
		whistleTimer = whistleTimerMax;
		state = "fall";
	}
}else if(state == "fall"){
	visible = true;
	global.player.canInput = true;
	if(grounded == 1){
		state = "jump";
		vspd = jumpVspd;
		canDie = true;
		ricochet = false;
	}
} else if (state == "jump"){
	if(shootAnimationTimer > 0){
		shootAnimationTimer--;
	}
	
	if(grounded){
		shots = shotsMax;
		state = "run";
	} else {
		if(shootTimer > 0){
			shootTimer--;
		} else if(shots > 0){
			shots--;
			with(instance_create_depth(x+shootXoffset*sideFacing,y+shootYoffset,depth,obj_boss_protomanbullet)){
				dir = 90 - 90*(other.sideFacing);
			}
			shootTimer = shootTimerMax;
			shootAnimationTimer = shootAnimationTimerMax;
		}
		if(wallCollide and place_meeting(x,y,obj_boss_protoman_turnaroundzone)){
			sideFacing = -sideFacing;
		}
		hspd = sideFacing * spd;
	}
} else if (state == "run"){
	visible = true;
	hspd = 0;
	if(runTimer > 0){
		runTimer--;
	} else {
		runTimer = runTimerMax;
		vspd = jumpVspd;
		shootTimer = firstshootTimer;
		state = "jump";
	}
}


//collisions
if(state != "whistle")
	vspd += grav;
grounded = 0;
wallCollide = false;
_wall = instance_place(x, y+vspd, obj_wall)
if (_wall != noone) {
	if(_wall.y > y){
		grounded = 1;
		while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
			y += (sign(vspd)*.99);
		}
			vspd = 0;
		}
	}	
y+=vspd;

if (place_meeting(x+hspd, y, obj_wall)) {
	wallCollide = true;
	while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
		x += (sign(hspd)*.99);
	}
	hspd = 0;
	}	
x+=hspd;

if(state == "fall"){
	sprite_index = spr_boss_protomanteleport;
	image_index = 0;
} else if (state == "jump"){
	sprite_index = spr_boss_protomanjump;
	if(shootAnimationTimer > 0){
		image_index = 1;
	} else {
		image_index = 0;
	}
} else if (state == "run"){
	sprite_index = spr_boss_protomanrun; 
}
	
if(hspd !=0){
	image_xscale = -sideFacing;
}