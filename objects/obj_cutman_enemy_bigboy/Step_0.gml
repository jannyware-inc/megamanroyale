centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView() and state == "idle" or state == "dead"){
	scr_goHome();
	state = "idle"
	return;
}

scr_hurtblink();
if(hp <= 0){
	scr_dropPickups(100);
	scr_explodeSmall();
	scr_deadrespawn();
	//instance_destroy();
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
		state = "jump";
		jumpHspd = scr_playerSideCentered() * spd;
		sideFacing = scr_playerSideCentered();
		if(irandom(1) == 0){
			vspd = bigJumpVspd;
		} else {
			vspd = smallJumpVspd;
		}
	}
} else if(state == "jump"){
	if(grounded){
		state = "idle";
		hspd = 0;
		scr_playNoOverlap(snd_bigboy);
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
	sprite_index = spr_cutman_enemy_bigboyidle;
} else if (state == "jump"){
	sprite_index = spr_cutman_enemy_bigboyjump;
}
image_xscale = -sideFacing;