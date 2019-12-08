centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView() and state == "idle"){
	scr_goHome();
	state = "idle"
	return;
}

scr_hurtblink();
if(hp <= 0){
	scr_dropPickups(20);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "idle"){
	ricochet = true;
	hspd = 0;
	if(idleTimer > 0){
		idleTimer--;
	} else {
		idleTimer = idleTimerMax;
		state = "open";
	}
} else if (state == "open"){
	ricochet = false;
	if(openTimer > 0){
		openTimer--;
	} else {
		openTimer = openTimerMax;
		state = "jump";
		vspd = jumpVspd;
		jumpHspd = scr_playerSideCentered() * spd;
		sideFacing = scr_playerSideCentered();
	}
} else if(state == "jump"){
	if(grounded){
		state = "idle";
		hspd = 0;
		scr_playNoOverlap(snd_rushbounce);
	} else {
		hspd = jumpHspd;
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
	}	
x+=hspd;

if(state == "idle"){
	sprite_index = spr_hardman_stompyboyidle;
} else if (state == "jump"){
	sprite_index = spr_hardman_stompyboyjump;
} else if (state == "open"){
	sprite_index = spr_hardman_stompyboyopen;
}
image_xscale = -sideFacing;