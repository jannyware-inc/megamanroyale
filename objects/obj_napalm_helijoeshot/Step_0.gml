//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneOrView())
	instance_destroy();
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
	
if(dirgen = false){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	dirgen = true;
	
	image_speed = 0;
	if (dir <= 180){
		image_index = 2;
	} else if (dir > 245 and dir < 295){
		image_index = 1;
	} else if (dir > 180 and dir < 360){
		image_index = 0;
	}
}

if(aliveFrames > 0){
	aliveFrames--;
} else {
	instance_destroy();
}

x += hspd;
y += vspd;

if(hspd != 0){
	image_xscale = -sign(hspd);
}