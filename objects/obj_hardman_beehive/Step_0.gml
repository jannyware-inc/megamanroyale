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
		with(instance_create_depth(x-24,y-24,depth,obj_hardman_bee)){
			zone = other.zone;
		}
		with(instance_create_depth(x+24,y-24,depth,obj_hardman_bee)){
			zone = other.zone;
		}
		with(instance_create_depth(x,y,depth,obj_hardman_bee)){
			zone = other.zone;
		}
		with(instance_create_depth(x+24,y+24,depth,obj_hardman_bee)){
			zone = other.zone;
		}
		with(instance_create_depth(x-24,y+24,depth,obj_hardman_bee)){
			zone = other.zone;
		}
		instance_destroy();
	}
	aliveFrames--;
	vspd+=grav;
	x += hspd;
	y += vspd;	
}
