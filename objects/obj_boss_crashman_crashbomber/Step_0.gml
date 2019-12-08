//target = instance_nearest(x, y, obj_player);
centery = y;
centerx = x;
if(!scr_inZoneOrView())
	instance_destroy();
if(scr_freezeexit()) return;

if ((state == "shoot" or state == "explode") and place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
	
if(dirgen = false){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	dirgen = true;
}

if(aliveFrames > 0){	
	aliveFrames--;
} else {
	instance_destroy();
}


if(state == "shoot"){
	wallCollide = false;
	_wall = instance_place(x, y+vspd, obj_wall);
	if (_wall != noone) {
		state = "attach";
		if(_wall.y > y){
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
			vspd = 0;
		}
	}	
	y+=vspd;
	if (place_meeting(x+hspd, y, obj_wall)) {
		wallCollide = true;
		state = "attach";
		while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
			x += (sign(hspd)*.99);
		}
		hspd = 0;
		}	
	x+=hspd;
} else if (state == "attach"){
	vspd = 0;
	hspd = 0;
	scr_playNoOverlap(snd_crashbomber);
	state = "blink";
} else if (state == "blink"){
	if(blinkTimer > 0){
		blinkTimer--;
	} else {
		state = "explode";
		instance_create_depth(x,y-5,depth,obj_explosionCrashbomber);
		scr_playNoOverlap(snd_explodebig);
	}
} else if (state == "explode"){
	if(explodeTimer > 0){
		explodeTimer--;
	} else {
		instance_destroy();
		return;
	}
}


if(state == "shoot"){
	sprite_index = spr_boss_crashman_crashbomber;
} else if(state == "attach" or state == "blink"){
	sprite_index = spr_boss_crashman_crashbomberblink;
} else if(state == "explode"){
	sprite_index = spr_boss_crashman_crashbomberexplode;
}

if(hspd != 0){
	sideFacing = -sign(hspd);
}
image_xscale = sideFacing;