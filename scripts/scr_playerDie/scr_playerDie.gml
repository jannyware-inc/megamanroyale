global.player.invisible = true;
explosion = instance_create_depth(global.playerCenterx,global.playerCentery,-700,obj_explosionPlayer);
audio_play_sound(snd_playerExplosion,10,0);
global.pausePlayer = 1;
global.boss = 0;
if(global.connected > 0){
	//sio_emit_die();
	scr_network_emitter_die();
}

with(obj_music_spawner){
	stop = true;
}
if(!global.player.infiniteLives){
	global.player.life--;
	if(global.player.life <=0){
		if(global.connected){
			instance_create_depth(0,0,-800,obj_gameOver);
		}
		//game over
		global.player.dead = 4;
	}
}
instance_create_depth(centerx,y,-700,obj_deathmarkersmall);