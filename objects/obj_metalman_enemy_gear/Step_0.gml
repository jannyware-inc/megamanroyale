centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
	scr_goHome();
	gearboiJumps = gearboiJumpsMax;
	if(instance_exists(gearboi))
		instance_destroy(gearboi);
	state = "wait";
	gearboi = noone;
}

scr_hurtblink();
if(hp <= 0){
	if(instance_exists(gearboi)){
		gearboi.vspd = gearboiJumpVspd;
	}
	scr_explodeSmall();
	scr_dropPickups(7);
	instance_destroy();
}
if(scr_freezeexit()) return;


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(state == "wait"){
	if(scr_distanceToPlayer() < spawnDistance and gearboi == noone){
		gearboi = instance_create_depth(x,y-sprite_height,depth-1,obj_metalman_enemy_gearboi);
		with(gearboi){
			gear = other.id;
		}
	} else if(gearboi != noone and instance_exists(gearboi)){
		gearboi.vspd += gearboiGrav;
		gearboi.y += gearboi.vspd;
		if(place_meeting(x,y,gearboi)){
			if(gearboiJumps-- > 0){
				gearboi.vspd = gearboiJumpVspd;
			} else {
				
				state = "move";
			}
		}
	} else if (gearboi != noone and !instance_exists(gearboi)){
		state = "move";
	}
	return;
} else if (state == "move"){
	if(instance_exists(gearboi)){
		gearboi.x = x;
		gearboi.y = y - sprite_height;
		spd = spdWGearboi;
	} else {
		spd = spdWOGearboi;	
	}
	if(grounded){
		if(!genDir){
			genDir = true;
			sideFacing = scr_playerSideCentered();
		}
		vspd = 0;
		hspd = spd*sideFacing;
	} else {
		hspd = 0;
	}

	//collisions
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
			sideFacing = -sideFacing;
			hspd = 0;
		}	
	x+=hspd;
}