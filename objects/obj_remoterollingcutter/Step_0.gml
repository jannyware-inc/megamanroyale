//target = instance_nearest(x, y, obj_player);
if(player == noone or !instance_exists(player)){
	instance_destroy();
	//show_debug_message("fuc");
	return;
}

centerx = x;
centery = y;
if(scr_localfreezeexit()) return;

if(!global.nopvp and place_meeting(x,y,global.player)){
	scr_hurt(damageC,1);
}

if(act != noone){
	x = actx;
	y = acty;
	dir = act;
	act = noone;
	state = "return";
}

if(aliveFrames > 0){
	aliveFrames--;
} else {
	instance_destroy();
	return;
}

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
		dir = 90;
	}
} else if (state == "return"){
	targetdir = point_direction(x,y,player.x,player.centery);
	if(point_distance(x,y,player.x,player.centery) < 25){
		followDirDelta = followDirDeltaNear;
	} else {
		followDirDelta = followDirDeltaFar;
	}	
	dir = scr_angular_rotation(dir,targetdir,followDirDelta);
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
}
dir = dir%360;
x += hspd;
y += vspd;

