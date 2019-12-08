//target = instance_nearest(x, y, obj_player);
centerx = x;
centery = y;
if(scr_freezeexit()) return;

if(!scr_inZoneOrView())
	instance_destroy();
hspd = lengthdir_x(spd,dir);
vspd = lengthdir_y(spd,dir);
	
if(aliveFrames > 0){
	aliveFrames--;
	x += hspd;
	y += vspd;
} else {
	instance_destroy();
}