//target = instance_nearest(x, y, obj_player);
centerx = x;
centery = y;
if(!scr_inZoneOrView())
	instance_destroy();
if(scr_freezeexit()) return;	
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
	
if(dirgen = false){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	dirgen = true;
}

if(aliveFrames > 0){
	
	aliveFrames--;

} else {
	instance_destroy();
}

	x += hspd;
	y += vspd;