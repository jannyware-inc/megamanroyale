
centerx = x;
centery = y-sprite_height/2;
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

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "wait"){
	sideFacing = scr_playerSideCentered();
	if(scr_xDistanceToPlayerCentered() < riseDist){
		state = "rise";
		hspd = 0;
	} else{
		return;
	}
}
else if(state == "rise"){
	if(!vwallCollide){
		vspd = riseSpeed;
	} else {
		vspd = 0;
		state = "swing";
	} 
} else if (state == "swing"){
	if(scr_xDistanceToPlayerCentered() < swingAtkDist){
		state = "fall";
		grounded = 0;
	}
} else if(state == "fall"){
	vspd += grav;
	fallTimer--;
	if(fallTimer <= 0 and grounded){
		fallTimer = fallTimerMax;
		state = "hop";
		sideFacing = scr_playerSideCentered();
		vspd = hopVspd;
	}	
} else if (state == "hop") {
	if(!grounded){
		vspd += grav;
		hspd = spd * sideFacing;
	} else {
		hspd = 0;
		sideFacing = scr_playerSideCentered();
		state = "hop";
		vspd = hopVspd;
	}
} 

if(state=="rise" or state == "swing"){
	collisionOffsetY = -9;
}else{
	collisionOffsetY = 0;
}
vwallCollide = false;
grounded = false;
_wall = instance_place(x, y+vspd+collisionOffsetY, obj_wall)
if (_wall != noone) {
	if(_wall.y > y){
		grounded = 1;
	}
	while(!place_meeting(x, y+collisionOffsetY+(sign(vspd)*.99), obj_wall)) {
		y += (sign(vspd)*.99);
	}
		vwallCollide = true;
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

image_xscale = -sideFacing;

if(state == "hop"){
	sprite_index = spr_hardman_monkey_jump;
	image_index = 1;
} else if(state == "swing"){
	sprite_index = spr_hardman_monkey_swing;
} else if (state == "rise"){
	sprite_index = spr_hardman_monkey_jump;
} else if (state == "fall"){
	sprite_index = spr_hardman_monkey_jump;
	image_index = 0;
}
