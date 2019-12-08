centerx = x;
centery = y-sprite_height/2+6;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

if(!scr_inZone()){
	with(obj_boss_hardmanknuckle){
		scr_explodeSmall();
		instance_destroy();
	}
	instance_destroy();
}
scr_bossblink();
if(hp <= 0 and canDie){
	with(obj_boss_hardmanknuckle){
		scr_explodeSmall();
		instance_destroy();
	}
	instance_destroy();
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(vspd >= 0 and place_meeting(x,y+1,obj_wall)){
	grounded = 1;
} else {
	grounded = 0;
}
	
if(state == "fall"){
	if(grounded == 1){
		state = "sleepIntro";
	}
} else if (state == "sleepIntro"){
	if(sleepIntroTimer > 0){
		sleepIntroTimer--;
	} else {
		sleepIntroTimer = sleepIntroTimerMax;
		state = "fallSquatEntry";
	}
} else if (state == "fallSquatEntry") {
	if(fallSquatTimer > 0){
		fallSquatTimer--;
	} else {
		fallSquatTimer=fallSquatTimerMax;
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
			canDie = true;
			state = "taunt";
			sideFacing = scr_playerSideCentered();
			global.player.canInput = true;
			ricochet = false;
		}
	}
} else if(state == "taunt"){
	if(tauntTimer > 0){
		tauntTimer--;
		if(tauntTimer > tauntTimerMax/2){
			image_index = 1;
		} else {
			image_index = 0;
		}
	} else {
		tauntTimer = tauntTimerMax;
		sideFacing = scr_playerSideCentered();
		state = "shoot1";
		shootTimer = shoot1TimerMax;
	}
}else if (state == "jump"){
	hspd = jumpHspd * sideFacing;
	if(scr_xDistanceToPlayerCentered() < fallDistance){
		vspd = 0;
		state = "fall1";
		image_index = 0;
	} else if (grounded){
		scr_playNoOverlap(snd_hardmanrumble);
		state = "rumble";
	}
} else if (state == "shoot1"){
	if(shootTimer >0){
		shootTimer--;
	} else {
		sideFacing = scr_playerSideCentered();
		//shoot first arm
		instance_create_depth(x+shootOffsetX*sideFacing,y+shootOffsetY,depth-1,obj_boss_hardmanknuckle);
		shootTimer = shoot2TimerMax;
		state = "shoot2";
	}
} else if (state == "shoot2"){
	if(shootTimer >0){
		shootTimer--;
	} else {
		shootTimer = shoot3TimerMax;
		state = "shoot3";
	}
}else if (state == "shoot3"){
	if(shootTimer >0){
		shootTimer--;
	} else {
		sideFacing = scr_playerSideCentered();
		//shoot 2nd arm
		instance_create_depth(x+shootOffsetX*sideFacing,y+shootOffsetY,depth-1,obj_boss_hardmanknuckle);
		shootTimer = shoot4TimerMax;
		state = "shoot4";
	}
}else if (state == "shoot4"){
	if(shootTimer >0){
		shootTimer--;
	} else {
		shootTimer = shoot5TimerMax;
		state = "shoot5";
	}
}else if (state == "shoot5"){
	if(shootTimer >0){
		shootTimer--;
	} else {
		//jump
		sideFacing = scr_playerSideCentered();
		shootTimer = shoot1TimerMax;
		state = "jumpsquat";
	}
} else if (state == "fall1"){
	hspd = 0;
	vspd = 0;
	if(fall1Timer > 0){
		fall1Timer--;
	} else {
		fall1Timer = fall1TimerMax;
		state = "falldown";
		grav = fallgrav;
	}
} else if(state == "falldown"){
	hspd = 0;
	if(grounded){
		state = "rumble";
		grav = normalgrav;
		scr_playNoOverlap(snd_hardmanrumble);
	}
} else if(state == "rumble"){
	if(global.player.dead == 0){
		global.pausePlayer = 1;
	} else {
		state = "getup"
	}
	layer_y(rumblelayer1,-1+irandom(3));
	layer_y(rumblelayer2,-1+irandom(3));
	layer_y(rumblelayer3,-1+irandom(3));
	if(rumbleTimer > 0){
		rumbleTimer--;
	} else {
		layer_y(rumblelayer1,0);
		layer_y(rumblelayer2,0);
		layer_y(rumblelayer3,0);
		rumbleTimer = rumbleTimerMax;
		global.pausePlayer = 0;
		state = "getup";
		vspd = getupVspd;
	}
} else if(state == "getup"){
	hspd = 0;
	if(image_index < 0){
		image_index = 0;
	}
	if(grounded){
		state = "taunt";
	}
} else if(state == "jumpsquat"){
	image_index = 0;
	if(jumpSquatTimer > 0){
		jumpSquatTimer--;
	} else {
		jumpSquatTimer = jumpSquatTimerMax;
		state = "jump";
		vspd = jumpVspd;
	}
}

//collisions
vspd += grav;
//grounded = 0;
wallCollide = false;
_wall = instance_place(x, y+vspd, obj_wall)
if (_wall != noone) {
	if(_wall.y > y){
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
			vspd = 0;
		}
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
	wallCollide = true;
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
	}	
x+=hspd;


//image_xscale = -sideFacing;


	if(state == "fall" or state == "idle"){
		sprite_index = spr_boss_hardmanidle;
	} else if (state == "sleepIntro"){
		image_index = 0;
		sprite_index = spr_boss_hardmantaunt;
	} else if (state == "fallSquatEntry"){
		sprite_index = spr_boss_hardmantaunt;
	} else if(state == "heal"){
		sprite_index = spr_boss_hardmanidle;
		image_index = 2;
	} else if(state == "shoot1"){
		sprite_index = spr_boss_hardmanshoot;
		image_index = 0;
	} else if(state == "shoot2"){
		sprite_index = spr_boss_hardmanshoot;
		image_index = 01
	} else if(state == "shoot3"){
		sprite_index = spr_boss_hardmanshoot;
		image_index = 2;
	} else if(state == "shoot4"){
		sprite_index = spr_boss_hardmanshoot;
		image_index = 3;
	} else if(state == "shoot5"){
		sprite_index = spr_boss_hardmanshoot;
		image_index = 4;
	} else if (state == "taunt"){
		sprite_index = spr_boss_hardmantaunt;
	} else if (state == "falldown"){
		sprite_index = spr_boss_hardmanfall
		image_index = 2;
	} else if (state == "rumble"){
		sprite_index = spr_boss_hardmanfall;
		image_index = 3;
	} else if (state == "fall1"){
		sprite_index = spr_boss_hardmanfall;
	} else if(state == "jumpsquat"){
		sprite_index = spr_boss_hardmanjump;
		image_index = 0;
	} else if(state == "jump"){
		sprite_index = spr_boss_hardmanjump;
		image_index = 1;
	}
	 
	image_xscale = -sideFacing;