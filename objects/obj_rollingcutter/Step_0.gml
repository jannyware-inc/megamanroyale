if(state == "return" and point_distance(x,y,global.player.x,global.player.y) < 10){
	scr_network_emitter_destroybulletbyidn();
	//show_debug_message("sent destroy cutter delete");
	audio_stop_sound(snd_cutmanhat);
	instance_destroy();
	return;
}
	
if(scr_remotefreezeexit()) return;

if(aliveFrames > 0){
	aliveFrames--;
} else {
	//scr_network_emitter_destroybulletbyidn();
	audio_stop_sound(snd_cutmanhat);
	instance_destroy();
	return;
}

if(dirgen = false){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	dirgen = true;
}
if(!networkSent){
	networkSent = true;
	scr_network_emitter_add_bullet();
}


if(state == "throw"){
	if(throwTimer > 0){
		throwTimer--;
	} else {
		state = "return";
		dir = 90;
	}
} else if (state == "return"){
	targetdir = point_direction(x,y,global.player.x,global.player.centery);
	if(point_distance(x,y,global.player.x,global.player.centery) < 25){
		followDirDelta = followDirDeltaNear;
	} else {
		followDirDelta = followDirDeltaFar;
	}	
	dir = scr_angular_rotation(dir,targetdir,followDirDelta);
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	//local only code
	if(actTimer > 0){
		actTimer--;
	} else {
		actTimer = actTimerMax;
		scr_network_emitter_actbyidn(dir);
	}
}
dir = dir%360;
x += hspd;
y += vspd;

if(attackTimer > 0){
	attackTimer--;
}
enemy = instance_place(x+hspd,y,obj_enemy);

if (attackTimer <= 0 and enemy != noone and enemy.isShootable = true) {
	if(!enemy.invincible){
		enemy.hp-=enemy.dmg_rollingcutter;
		enemy.hurt = 1;
		if(enemy.hp > 0){
			attackTimer = attackTimerMax;
		}
		scr_playNoOverlap(snd_damage);
	}
}