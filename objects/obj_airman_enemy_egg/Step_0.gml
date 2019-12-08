centerx = x+sprite_width/2;
centery = y+sprite_height/2;//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneAndView())
	instance_destroy();
	
if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}


if(scr_freezeexit()) return;
	
if(fall == true){
	if (place_meeting(x,y,obj_player)){
		scr_hurt(damageC,0);
		broken = 1;
	} else if (place_meeting(x,y,obj_wall)){
		broken = 1;
	}
	
	if (broken == 1){
		eggShellLeft = instance_create_depth(x+sprite_width/2,y,depth,obj_airman_enemy_egg_eggshell);
		eggShellRight = instance_create_depth(x+sprite_width/2,y,depth,obj_airman_enemy_egg_eggshell);
		with(eggShellRight){
			hspd = -hspd;
		}
		for(i=0; i< 4;i++){
			hatchling = instance_create_depth(x+sprite_width/2,y,depth,obj_airman_enemy_hatchling);
			with(hatchling){
				scatter = true;
				scatterFrames = 5;
			}
		}
		for(i=0; i< 4;i++){
			hatchling = instance_create_depth(x+sprite_width/2,y,depth,obj_airman_enemy_hatchling);
			with(hatchling){
				scatter = true;
				scatterFrames = 20;
			}
		}
		instance_destroy();
	}
	aliveFrames--;
	vspd+=grav;
	x += hspd;
	y += vspd;	
}

if(mirror > 0){
	sprite_index = spr_airman_enemy_eggright;
} else {
	sprite_index = spr_airman_enemy_eggleft;
}
