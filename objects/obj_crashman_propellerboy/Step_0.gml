centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneAndView()){
	instance_destroy();
	return;
}

scr_hurtblink();
if(hp <= 0){
	scr_dropPickups(10);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "idle"){
	hspd = 0;
	if(idleTimer > 0){
		idleTimer--;
	} else {
		idleTimer = idleTimerMax;
		state = "rise";
	}
} else if (state == "rise"){
	vspd = riseVspd;
	if(riseTimer > 0){
		riseTimer--;
	} else {
		riseTimer = riseTimerMax;
		state = "jump";
		vspd = 0;
		hspd = scr_playerSideCentered() * min( maxJumpHspd, jumpHspd * scr_xDistanceToPlayerCentered()/40);
		sideFacing = scr_playerSideCentered();
	}
} else if(state == "jump"){
	if(grounded){
		state = "idle";
		hspd = 0;
		scr_playNoOverlap(snd_propellerboyland);
	}
}
grounded = 0;
//collisions
if(state != "rise")
	vspd += grav;

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
	}	
x+=hspd;

if(state == "idle"){
	sprite_index = spr_crashman_propellercup_wind;
} else if (state == "jump"){
	sprite_index = spr_crashman_propellercup_wind;
	image_index = 0;
} else if (state == "rise"){
	sprite_index = spr_crashman_propellercup_fly;
}
image_xscale = -sideFacing;