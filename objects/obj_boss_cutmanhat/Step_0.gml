//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneOrView())
	instance_destroy();
	
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
if(scr_freezeexit()) return;
if(dirgen = false){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	dirgen = true;
}
if(state == "throw"){
	if(throwTimer > 0){
		throwTimer--;
	} else {
		state = "return";
	}
} else if (state == "return"){
	if(magnet != noone and instance_exists(magnet)){
		targetdir = point_direction(x,y,magnet.x,magnet.y)%360;
		//show_debug_message("targetdir = " + string(targetdir));
	} else {
		instance_destroy();
	}
	dir = scr_angular_rotation(dir,targetdir,followDirDelta);
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
}
dir = dir%360;
x += hspd;
y += vspd;