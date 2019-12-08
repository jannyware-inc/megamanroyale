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
}

if(aliveFrames > 0){
	aliveFrames--;
} else {
	instance_destroy();
}

if(moveTimer > 0 and state != "dirGen"){
	moveTimer-- ;
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
} else {
	vspd = 0;
	hspd = 0;
}

if(state == "dirGen"){
	dir = point_direction(x,y,global.player.centerx,global.player.centery);
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	state = "notdirgenlol";
	moveTimer = 120;
}

x += hspd;
y += vspd;