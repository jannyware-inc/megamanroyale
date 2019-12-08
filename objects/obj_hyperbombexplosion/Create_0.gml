instance_create_depth(x,y,depth-1,obj_explodeBomb);
scr_playNoOverlap(snd_hyperbomb);
explosionForce = 2;
explosionVspd = -5+(-5*((16-scr_xDistanceToPlayerCentered())/16));
dirToPlayer = noone;
explosionTimerMax = 30;
explosionTimer = explosionTimerMax;
explosionDeincrement = 10;
noStep = true;
damageLinger = 15;

enemy = instance_place(x,y,obj_enemy);
if (enemy != noone and enemy.isShootable = true) {
		if(!enemy.invincible and !enemy.ricochet){ // and !enemy.hurt
			enemy.hp-=enemy.dmg_hyperbombexplosion;
			enemy.hurt = 1;
		}
		if (audio_is_playing(snd_damage)){
			audio_stop_sound(snd_damage);	
		}
		audio_play_sound(snd_damage,11,0);
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

