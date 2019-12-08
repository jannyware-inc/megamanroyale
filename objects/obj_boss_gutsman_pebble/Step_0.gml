centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	instance_destroy();
	return;
}
if(scr_freezeexit()) return;

if(dirGen){
	vspd = lengthdir_y(spd,dir);
	hspd = lengthdir_x(spd,dir);
	dirGen = false;
}

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(aliveFrames > 0){
	aliveFrames--;
} else {
	instance_destroy();
	return;
}

y += vspd;
x += hspd;
