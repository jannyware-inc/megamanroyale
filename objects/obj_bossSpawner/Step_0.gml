if(midboss and midbossdefeated){
	return;
}

if(instance_exists(bossInstance)){
	bossx = bossInstance.centerx;
	bossy = bossInstance.centery;
}

if(global.player.dead > 0 and !youWin){
	boss1queue = 0;
	if(stoppedMusic and global.player.dead == 3){
		with(obj_music_spawner){
			stop = false;
		}
	}
	stoppedMusic = 0;
}

if(scr_distanceToPlayer() > 500 or !scr_inZone()){
	return;
}

if(!stoppedMusic and global.boss == 2){
	with(obj_music_spawner){
	stop = true;
	}
	stoppedMusic = true;
}

if(global.boss == 2 and boss1queue == false){
	boss1queue = true;
	bossInstance = instance_create_depth(x,y,0,boss);
	with(bossInstance){
		zone = other.zone;
	}
	musicSpawner = instance_create_depth(x,y,0,obj_music_spawner_2);
	with(musicSpawner){
		musicIntro = other.musicIntro;
		musicLoop = other.musicLoop;
	}
	stoppedMusic = 1;
}

if(boss1queue and !instance_exists(bossInstance) and youWinQueue = 0){ //boss defeated
	if(midboss){
		midbossdefeated = true;
		return;
	}
	scr_bossDie(bossx,bossy);
	global.invincible = 1;
	//show_debug_message("cocks");
	// global.player.canInput = false;
	youWin = 1;
	winState = "begin";
	
	with(obj_music_spawner){
		stop = 1;
	}
	if(instance_exists(global.player.timer)){
		global.player.timer.stop = true;
	}
	youWinQueue = 1;
	/*
	musicSpawner = instance_create_depth(x,y,0,obj_music_spawner);
	with(musicSpawner){
		music = mus_celebrate;
	loopstart = 0;
	}
	*/
	if(global.connected){
		sio_emit_boss_defeated();
		sio_emit_set_spectate();
		global.updatePosition = false;
	}
}

if(youWin){
	if(winState == "begin"){
		if(waitTimer > 0){
			waitTimer--;	
		} else {
			winState = "audioPlay";
			audio_play_sound(musicVictory,100,0);
			waitTimer = 60*6;
		}
	} else if (winState == "audioPlay"){
		waitTimer = 0; // instantly skip this part cuz lolz
		if(waitTimer > 0){
			waitTimer--;
		} else {
			audio_play_sound(snd_teleport,100,0);
			global.pausePlayer = 1;
			global.player.visible = false;
			teleportmm = instance_create_depth(global.player.x,global.player.y,global.player.depth,obj_intromm);
			with(teleportmm){
				sprite_index = spr_teleport;
			}
			waitTimer = 15;
			winState = "teleport";
		}
	} else if (winState == "teleport"){
		if(waitTimer > 0){
			waitTimer--;
		} else {
			teleportmm.image_index = 2;
			winState = "teleportfly";
			waitTimer = 60;
		}
	} else if (winState == "teleportfly"){
		teleportmm.image_index = 2;
		teleportmm.y += -16;
		if(waitTimer > 0){
			waitTimer--;
		} else {
			
			
			winState = "text";
			global.boss = 0;
			depth = -900;
		}
	} else if (winState == "text"){
		if(keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0,gp_start)){	
			//exit room
			global.invincible = 0;
			global.pausePlayer = 0;
			//global.player.canInput = 1;
			//sio_emit_room_disconnect();
			scr_network_emitter_other("room_disconnect",noone);
			room_goto(rm_name);
		}
		if(textTimer > 0){
			textTimer--;
		} else {
			textTimer = textTimerMax;
		}
		if (textTimer > 30){
			drawSpectateMessage = true;
		} else {
			//drawSpectateMessage = false;
		}		
	}
}