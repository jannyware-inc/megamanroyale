centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "sit"
	return;
}

scr_hurtblink();
if(hp <= 0){
	scr_dropPickups(10);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
	nextState = "sit";
}

if(state == "sit"){
	hspd = 0;
	if(sitTimer > 0){
		if(scr_xDistanceToPlayerCentered() < atkDistance){
			sitTimer--;
		} else {
			sitTimer = sitTimerMax;
		}
	} else {
		sitTimer = sitTimerMax;
		state = "jump";
		vspd = jumpVspd;
		sideFacing = scr_playerSideCentered();
		jumpHspd = sideFacing * spd;
		scr_playNoOverlap(snd_tigerjump);
		nextState = "idle";
	}
} else if(state == "jump"){
	if(grounded){
		state = nextState;
		hspd = 0;
	} else {
		hspd = sideFacing * spd;
	}
} else if (state == "idle"){
	if(idleTimer > 0){
		idleTimer--;
	} else {
		idleTimer = idleTimerMax;
		state = "jump";
		vspd = jumpVspd;
		jumpHspd = scr_playerSideCentered() * spd;
		sideFacing = scr_playerSideCentered();
		scr_playNoOverlap(snd_tigerjump);
	}
}
grounded = 0;
//collisions
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
		sideFacing = -sideFacing;
	}	
x+=hspd;

if(state == "sit"){
	sprite_index = spr_napalm_tiger_sit;
} else if (state == "jump"){
	sprite_index = spr_napalm_tiger_jump;
	if(vspd <= 0){
		image_index = 0;
	} else {
		image_index = 1;
	}
} else if (state == "idle"){
	sprite_index = spr_napalm_tiger_idle;
}
image_xscale = -sideFacing;