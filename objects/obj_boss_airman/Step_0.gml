centerx = x + sprite_width/2;
centery = y + sprite_height/2;

if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

if(!scr_inZone()){
	if(instance_exists(currentLeafShield)){
		instance_destroy(currentLeafShield);
	}
	instance_destroy();
}

scr_bossblink();
if(hp <= 0 and state != "fall" and state != "heal" and state != "squareTheFuckUpBitch" and state != "fallSquatEntry"){
	with(obj_airman_enemy_tornado){
		instance_destroy();
	}
	instance_destroy();
}

if(scr_freezeexit()) return;


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "fall"){
	if(grounded == 1){
		state = "fallSquatEntry";
		x -= 1;
	}
} else if (state == "fallSquatEntry") {
	if(fallSquatTimer > 0){
		if(fallSquatTimer == fallSquatTimerMax-5)
			audio_play_sound(snd_landing,10,0);
		fallSquatTimer--;
	} else {
		fallSquatTimer=fallSquatTimerMax;
		state = "squareTheFuckUpBitch";
	}
} else if (state == "squareTheFuckUpBitch") {
	if(thumpTimer > 0){
		thumpTimer--;
	} else {
		thumpTimer=thumpTimerMax;
		state = "heal";
	}
	
} else if (state == "heal") {
	if(hpTimer > 0){
		hpTimer--;
	} else {
		hpTimer = hpTimerMax;
		if (hp < hpMax){
			hp++;
			scr_playNoOverlap(snd_heal1hp);
		} else {
			state = "shootTornadoes"
			global.player.canInput = true;
			ricochet = false;
		}
	}
} else if (state == "shootTornadoes"){
	//TODO spawn 6 tornadoes
	if(sideFacing == -1){
		_offsetX = tornadoShootXoffset;
		_offsetY = tornadoShootYoffset;
	} else {
		_offsetX = sprite_width - tornadoShootXoffset;
		_offsetY = tornadoShootYoffset;
	}
	///show_debug_message("sidefacing = " + string(sideFacing));
	//low tornadoes
	/*
	for(i = 0; i<tornadoCount/3; i++){
		tornado = instance_create_depth(x+_offsetX, y+_offsetY,global.player.depth+1,obj_airman_enemy_tornado);
		with(tornado){
			sideFacing = other.sideFacing;
			dir = 90 - (95 - random(10)) * sign(other.sideFacing);
			spd = other.i*2 + random(4.2 - other.i*1.8);
				}
	}
	*/
	with(instance_create_depth(x+_offsetX, y+_offsetY,global.player.depth-300,obj_airman_enemy_tornado)){
		sideFacing = other.sideFacing;
		dir = 90 - (95 - random(10)) * sign(other.sideFacing);
		//spd = 1+random(1);
		scatterTimer = 5+irandom(5);
	}
	with(instance_create_depth(x+_offsetX, y+_offsetY,global.player.depth-300,obj_airman_enemy_tornado)){
		sideFacing = other.sideFacing;
		dir = 90 - (95 - random(10)) * sign(other.sideFacing);
		//spd = 3+irandom(1);
		scatterTimer = 10+irandom(15);
	}
	
	//high tornadoes
	for(i = 0; i<tornadoCount - tornadoCount/3; i++){
		tornado = instance_create_depth(x+_offsetX, y+_offsetY,global.player.depth-300,obj_airman_enemy_tornado);
		with(tornado){
			sideFacing = other.sideFacing;
			dir = 90 - (50 - random(40)) * sign(other.sideFacing);
			//spd = 1.5 + random(3);
			scatterTimer = 15+irandom(25);
			}
	}
	state = "postShootTornadoes";
} else if (state == "postShootTornadoes") {
	if(shootTimer > 0){
		shootTimer--;
	} else {
		shootTimer = shootTimerMax;
		state = "blowTornadoes";
		//TODO trigger all tornadoes to move forward
		with(obj_airman_enemy_tornado){
			state = "blow";
		}
	}
} else if (state == "blowTornadoes"){
	global.player.externalhspd = blowForce * sign(sideFacing)*(min(1,2*((blowTimerMax-blowTimer)/blowTimerMax)));
	if(blowTimer > 0){
		blowTimer--;
	} else {
		blowTimer = blowTimerMax;
		if(tornadoRounds > 0){
			tornadoRounds--;
			state = "shootTornadoes";
		} else {
			tornadoRounds = tornadoRoundsMax;
			state = "jumpSmall";
			//jumpspeeds
			hspd = hopHspd * sideFacing;
			vspd = smallHopVspd;
			grounded = 0;
		}
	}
} else if (state == "jumpSmall") {
	if(grounded){
		hspd = 0;
		//jumpspeeds
		hspd = hopHspd * sideFacing;
		vspd = bigHopVspd;
		grounded = 0;
		state = "jumpBig";
	}
}else if (state == "jumpBig"){
	if(grounded){
		hspd = 0;
		sideFacing = -sign(sideFacing);
		state = "shootTornadoes";
	}
}


//collisions
vspd += grav;

if (place_meeting(x, y+vspd, obj_wall)) {
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
		grounded = 1;
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
	}	
x+=hspd;





if(sideFacing > 0){
	if(state == "fall" or state == "jumpSmall" or state == "jumpBig"){
		sprite_index = spr_boss_airman_jumpright;
	} else if(state == "squareTheFuckUpBitch" or state == "blowTornadoes"){
		sprite_index = spr_boss_airman_thumpright;
	} else if(state == "sleep" or state == "sleep1" or state == "heal" or state == "fallSquatEntry" or state == "fallSquat"){
		sprite_index = spr_boss_airman_sleepright;
	} else if (state == "shootTornadoes" or state == "leafShieldWindUp"){
		sprite_index = spr_boss_airman_fireright;
	}
} else {
	if(state == "fall" or state == "jumpSmall" or state == "jumpBig"){
		sprite_index = spr_boss_airman_jumpleft;
	} else if(state == "squareTheFuckUpBitch" or state == "blowTornadoes"){
		sprite_index = spr_boss_airman_thumpleft;
	} else if(state == "sleep" or state == "sleep1" or state == "heal" or state == "fallSquatEntry" or state == "fallSquat"){
		sprite_index = spr_boss_airman_sleepleft;
	} else if (state == "shootTornadoes" or state == "leafShieldWindUp"){
		sprite_index = spr_boss_airman_fireleft;
	}
}