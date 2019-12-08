with(instance_create_depth(x,y,depth-1,obj_explodeBomb)){
	alpha = .65;
}
//scr_playNoOverlap(snd_hyperbomb);
explosionForce = 2;
explosionVspd = -5+(-5*((16-scr_xDistanceToPlayerCentered())/16));
dirToPlayer = noone;
explosionTimerMax = 30;
explosionTimer = explosionTimerMax;
explosionDeincrement = 10;
noStep = true;
damageLinger = 15;

if(global.player.inNoPvpZone or global.boss != 0){
	instance_destroy();
	return;
}

if(place_meeting(x,y,global.player)){
	noStep = false;
	//show_debug_message("yeet");
	dirToPlayer = point_direction(x,y,global.player.centerx,global.player.centery);
	if(global.player.y <= y+10){
		global.player.vspd = explosionVspd;
		global.player.jumpFrames = 0;
		global.player.disableJumpGravity = true;
		global.player.currentJumpHeight = -explosionVspd;
		global.player.canCancelJump = false;
		global.player.grounded = 0;
	}
	//global.player.externalhspd += lengthdir_x(explosionForce,dirToPlayer);
	//global.player.externalvspd += lengthdir_y(explosionForce,dirToPlayer);
} else {
	noStep = true;
	instance_destroy();
}

