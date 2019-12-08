if(state == "active"){
	if(global.player.teleportTimer == 0 and global.player.y < y-3 and global.player.y > y-sprite_height + 4 and scr_xDistanceToPlayerCentered() < tpDistance){
		global.player.x = gotox;
		global.player.y = gotoy;
		global.player.teleportTimer = global.player.teleportTimerMax;
		audio_play_sound(snd_teleporter,70,0);
	}
}