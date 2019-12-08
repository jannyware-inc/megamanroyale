skipDraw = false;
if(room = rm_stageIntro){
	return;
}
//curRoom = scr_get_room_name(scr_get_room(room));

lastweapon = weapon;
lastexternalhspd = externalhspd;
//show_debug_message(keyboard_lastkey);
//sio_emit_position_update();

//if(skipInit == 0){
	//x = global.player.x;
	//y = global.player.y;
//} else
//	skipInit = 0;
global.player = id;
if(keyboard_check_pressed(vk_f4)){
	//sio_emit_room_disconnect();
	scr_network_emitter_other("room_disconnect",noone);
	global.connected = 0;
	room_goto(rm_name);
}


if(timeStopperCooldown > 0){
	timeStopperCooldown--;
}


if(global.developerMode){
	
	if(keyboard_check_pressed(ord("H"))){
	 sideUp = sideUp + (-sign(sideUp)*2);
	}
	if(keyboard_check_pressed(ord("R"))){
	 x = xstart;
	 y = ystart;
	}
	if(keyboard_check_pressed(ord("C"))){
	with(obj_topman_enemy_floatingplatform){
		instance_destroy();
	}
	}

	if(keyboard_check_pressed(ord("7"))){
	 x = 30;
	 y = 0;
	 room_restart();
	 room_goto(rm_airman);

	}

	if(keyboard_check_pressed(ord("8"))){
	 x = 30;
	 y = 0;
	 room_restart();
	 room_goto(rm_woodman);
	 //
	}
	if(keyboard_check_pressed(ord("9"))){
	 x = 30;
	 y = 0;
	 room_restart();
	 room_goto(rm_snakeman);
	 //
	}
	if(keyboard_check_pressed(ord("6"))){
	 room_goto(rm_metalman);
	 //
	}
	if(keyboard_check_pressed(ord("0"))){
	 room_restart();
	 room_goto(rm_topman);
	 //
	}

	if(keyboard_check_pressed(ord("P"))){
	scr_hurt(id,0);
	 //
	}
	if(keyboard_check_pressed(ord("G"))){
		room_goto(scr_get_room_index(100));
	}
	if(keyboard_check_pressed(ord("I"))){
		room_goto(rm_cutman);
	}
	if(keyboard_check_pressed(ord("H"))){
		layer_background_blend(layer_get_id("Background"),c_white);
	}

	if(keyboard_check_pressed(ord("O"))){
		room_goto(rm_hardman);
	 //
	}
	if(keyboard_check_pressed(ord("U"))){
	if(global.pausePlayer == 1)
		global.pausePlayer = 0;
	else
		global.pausePlayer = 1;
	}
}

if(hasTimer and !hasTimerGen){
	hasTimerGen = true;
	timer = instance_create_depth(0,0,-200,obj_timer);
}

if(dead == 4){
	return;
}

if(hp <= 0 and dead == 0){
	dead = 1;
}

if(dead == 1){
	scr_playerDie();
	dead = 2
} else if (dead == 2){
	if(deadTimer > 0){
		deadTimer--;
	} else {
		deadTimer = deadTimerMax;
		dead = 3;
	}
} else if (dead == 3){
	//reset player,etc
	scr_playerReset();
}

if(teleportTimer > 0){
	teleportTimer--;
}

if(hp > hpMax){
	hp = hpMax;
}
if(hpIpl > hp){
	hpTimer = 0;
	hpIpl = hp;
} else if(hpIpl < hp){
	if(hpTimer > 0){
		hpTimer--;
	} else {
		hpTimer = hpTimerMax;
		hpIpl++;
		scr_playNoOverlap(snd_heal1hp);
	}
}

get_input();
//depth = -y;
//guide = instance_place(x,y+.4998,obj_camGuide);
guide = instance_position(centerx,centery,obj_camGuide);

if(global.pausePlayer == 0){
	if(instance_number(obj_teleportin) <= 0){
		move_state();
	} else{
		skipDraw = true;
		image_index = 0;
	}
} else {
	if(dead == 0){
		invisible = false;
	}
	image_speed = 0;
}

if(guide != noone and dead == 0){
	if(global.boss == 1 or global.boss == 2){
		if(global.boss == 1 and place_meeting(x,y,obj_bossStartZone)){
			global.boss = 2;
		}
	}
	if(guide.bossRoom = 0){
		global.boss = 0;
	}
}

if(place_meeting(x,y,obj_nopvp)){
	inNoPvpZone = true;
} else {
	inNoPvpZone = false;
}

if(inNoPvpZone or global.boss > 0){
	global.nopvp = true;
} else {
	global.nopvp = false;
}

global.player.x = x;
global.player.y = y;

centerx = x;
centery = y + originYOffset;

global.playerCenterx = centerx;
global.playerCentery = centery;
global.playerWidth = sprite_width;
global.playerHeight = sprite_height;