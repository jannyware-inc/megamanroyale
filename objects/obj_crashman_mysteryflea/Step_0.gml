centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else {
	visible = false;
	return;
}

if(!scr_inZone()){
	//instance_destroy();
}

if(hp <= 0){
	scr_explodeSmall();
	//scr_randomDropWeapon(1);
	global.player.dropChance = 150;
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	

if(grounded){
	if(waitTimer > 0){
		waitTimer--;
		hspd = 0;
	} else {
		sideFacing = scr_playerSideCentered();
		hspd = spd*sideFacing;
		waitTimer = waitTimerMax;
		vspd = bounceVspd;
		grounded = 0;
	}
} else {
	if(abs(hspd) < abs(spd))
		hspd = spd*sideFacing;
}


if(grounded){
	sprite_index = spr_topman_enemy_catflea;
} else {
	sprite_index = spr_topman_enemy_catfleajump;
}

image_xscale = -sideFacing;

//collisions
vspd += grav;



_wall = instance_place(x,y+vspd,obj_wall);
if(_wall != noone and _wall != wall){
	if(_wall.y > y){
		grounded = 1;
	}
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
	}	
y+=vspd;

_wall = instance_place(x+hspd,y,obj_wall);
if(_wall != noone and _wall != wall){
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		//sideFacing = -sideFacing;
		hspd = 0;
	}	
x+=hspd;

