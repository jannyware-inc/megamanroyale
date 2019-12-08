centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(dirGen){
	vspd = lengthdir_y(spd,dir);
	hspd = lengthdir_x(spd,dir);
	dirGen = false;
}

if(place_meeting(x,y,obj_wall) and state == "thrown"){
	if(hspd < 0){
		with(instance_create_depth(x,y,depth,obj_boss_gutsman_pebble)){
			dir = 90 + 70;
		}
		with(instance_create_depth(x,y,depth,obj_boss_gutsman_pebble)){
			dir = 90 + 80;
		}
		with(instance_create_depth(x,y,depth,obj_boss_gutsman_pebble)){
			dir = 90 + 87;
		}
		with(instance_create_depth(x,y,depth,obj_boss_gutsman_pebble)){
			dir = 90 + 90;
		}
	} else {
		with(instance_create_depth(x,y,depth,obj_boss_gutsman_pebble)){
			dir = 90 - 70;
		}
		with(instance_create_depth(x,y,depth,obj_boss_gutsman_pebble)){
			dir = 90 - 80;
		}
		with(instance_create_depth(x,y,depth,obj_boss_gutsman_pebble)){
			dir = 90 - 87;
		}
		with(instance_create_depth(x,y,depth,obj_boss_gutsman_pebble)){
			dir = 90 - 90;
		}
	}
	instance_destroy();
	return;
}
vspd += grav;
y += vspd;
x += hspd;