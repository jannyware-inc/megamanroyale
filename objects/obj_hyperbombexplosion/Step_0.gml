

if (noStep){
	return;
}

if(dirToPlayer != noone and explosionTimer > 0){
	explosionTimer -= explosionDeincrement;
	
}
if ((global.player.dead != 0 or global.player.hurt or global.player.onLadder) or (explosionTimer <= 0 and (global.player.grounded == 1 or global.player.externalWallCollide))){
	global.player.externalhspd = 0;
	instance_destroy();
} else {
	if(!global.pausePlayer and !global.player.remotetimestopperfrozen)
		global.player.externalhspd += lengthdir_x(explosionForce,dirToPlayer);
}

/*
	_player.vspd = bounceVspd;
	_player.jumpFrames = 0;
	_player.disableJumpGravity = true;
	_player.currentJumpHeight = -bounceVspd;
	_player.canCancelJump = false;
/*