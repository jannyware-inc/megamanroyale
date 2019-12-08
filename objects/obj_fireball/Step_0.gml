//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneOrView())
	instance_destroy();

if(scr_freezeexit()) return;
if(aliveFrames > 0){
	if (place_meeting(x,y,global.player))
			scr_hurt(damageC,0);
	aliveFrames--;
	vspd+=grav;
	x += hspd;
	y += vspd;
} else {
	instance_destroy();
}