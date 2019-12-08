centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inZoneAndView()){
	visible = false;
} else {
	visible = true;
}

if(!scr_inZoneAndView()){
	scr_goHome();
	state = "wait";
	return;
}

scr_hurtblink();

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(5);
	instance_destroy();
}

if(scr_freezeexit()) return;

if (place_meeting(x,y,global.player))
	scr_hurt(damageC,0);

if(state == "wait"){
	visible = false;
	if(abs(global.playerCenterx - (x+sprite_width/2)) < riseDist){
		visible = true;
		state = "rise";
		hspd = 0;
		scr_mirror();
	} else{
		return;
	}
}
else if(state == "rise"){
	if(!grounded){
		vspd = riseSpeed;
	} else {
		vspd = 0;
		state = "grab";
		grounded = false;
		scr_mirror();
	} 
} else if (state == "grab") {
	if(grabTimer > 0){
		grabTimer--;
	} else {
		grabTimer = grabTimerMax;
		state = "swing";
		scr_mirror();
	}
} else if (state == "swing"){
	if(swingTimer > 0 and abs(global.playerCenterx - (x+sprite_width/2)) > swingAtkDist){
		swingTimer--;
	} else {
		swingTimer = swingTimerMax;
		y = y - sprite_height;
		state = "hop";
		grounded = 0;
		vspd = hopVspd;
		hopHspd = abs(hopHspd) * sign(global.playerCenterx - (x+sprite_width/2));
		scr_mirror();
	}
} else if (state == "hop") {
	if(!grounded){
		vspd += grav;
		hspd = hopHspd;
	} else {
		hspd = 0;
		state = "stand";
		scr_mirror();
	}
} else if (state == "stand"){
	if (standTimer > 0){
		standTimer--;
	} else {
		standTimer = standTimerMax;
		grounded = 0;
		hopHspd = abs(hopHspd) * sign(global.playerCenterx - (x+sprite_width/2));
		vspd = hopVspd;
		state = "hop";
		scr_mirror();
	}
}

if(state=="rise" or state == "swing"){
	collisionOffsetY = 18;
}else{
	collisionOffsetY = 0;
}

if (place_meeting(x, y+collisionOffsetY+vspd, obj_wall)) {
			while(!place_meeting(x, y+collisionOffsetY+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
		if(place_meeting(x,y+.4998,obj_wall))
			grounded = 1;
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
	}	
x+=hspd;


if(mirror > 0){
	if(state == "hop"){
		sprite_index = spr_woodman_enemy_06_hop;
	} else if(state == "swing"){
		sprite_index = spr_woodman_enemy_06_swing;
	} else if (state == "rise"){
		sprite_index = spr_woodman_enemy_06_rise;
	} else if (state == "grab"){
		sprite_index = spr_woodman_enemy_06_grab;
	} else if (state == "stand"){
		sprite_index = spr_woodman_enemy_06_stand;
	}
} else {
	if(state == "hop"){
		sprite_index = spr_woodman_enemy_06_hopmirror;
	} else if(state == "swing"){
		sprite_index = spr_woodman_enemy_06_swingmirror;
	} else if (state == "rise"){
		sprite_index = spr_woodman_enemy_06_risemirror;
	} else if (state == "grab"){
		sprite_index = spr_woodman_enemy_06_grabmirror;
	} else if (state == "stand"){
		sprite_index = spr_woodman_enemy_06_standmirror;
	}
}
