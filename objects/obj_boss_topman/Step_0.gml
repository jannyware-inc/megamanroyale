centerx = x;
centery = y-sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

if(!scr_inZone()){
	
	if(instance_exists(top1)){
		instance_destroy(top1);
	}
	if(instance_exists(top2)){
		instance_destroy(top2);
	}
	if(instance_exists(top3)){
		instance_destroy(top3);
	}
	instance_destroy();
}
scr_bossblink();
if(hp <= 0 and canDie){
	if(instance_exists(top1)){
		instance_destroy(top1);
	}
	if(instance_exists(top2)){
		instance_destroy(top2);
	}
	if(instance_exists(top3)){
		instance_destroy(top3);
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
			state = "throw1";
			global.player.canInput = true;
			ricochet = false;
			attack = 1;
		}
	}
} else if (state == "throw1"){
	if(throw1Timer > 0){
		throw1Timer--;
	} else {
		throw1Timer = throw1TimerMax;
		state = "throw2";
		//spawn one top here
		top1 = instance_create_depth(x+throw2TopX*-sideFacing,y+throw2TopY,depth+1,obj_topman_enemy_topmantop);
	}
} else if (state == "throw2"){
	if(throw2Timer > 0){
		throw2Timer--;
	} else {
		throw2Timer = throw2TimerMax;
		state = "throw3";
		if(instance_exists(top1)){
			with(top1){
				x = other.x + other.throw3TopX*-other.sideFacing;
				y = other.y + other.throw3TopY;
			}
		}
	}
} else if (state == "throw3"){
	if(throw3Timer > 0){
		throw3Timer--;
	} else {
		throw3Timer = throw3TimerMax;
		state = "throw4";
		//throw 3 here
		top2 = instance_create_depth(x+throw3TopX*-sideFacing,y+throw3TopY,depth+1,obj_topman_enemy_topmantop);
		top3 = instance_create_depth(x+throw3TopX*-sideFacing,y+throw3TopY,depth+1,obj_topman_enemy_topmantop);
		with(top1){
			dir = 90 - (other.sideFacing * 45);
			moveTimer = other.topMoveFramesStart;
		}
		with(top2){
			dir = 90 - (other.sideFacing * 45);
			moveTimer = other.topMoveFramesStart + other.topMoveFramesDelta;
		}
		with(top3){
			dir = 90 - (other.sideFacing * 45);
			moveTimer = other.topMoveFramesStart + other.topMoveFramesDelta*2;
		}
	}
} else if (state == "throw4"){
	
	//this is the dab part
	if(throw4Timer > 0){
		throw4Timer--;
	} else {
		throw4Timer = throw4TimerMax;
		state = "throw5";
	}
} else if (state == "throw5"){
	//this is a random TIMER
	if(throw5Timer > 0){
		throw5Timer--;
	} else {
		throw5Timer = THROW5TIMERMAX;
		state = "deployTops";
		//deploy all tops
		with(top1){
			state = "dirGen";
			spd = 6;
		}
		with(top2){
			state = "dirGen";
			spd = 6;
		}
		with(top3){
			state = "dirGen";
			spd = 6;
		}
	}
} else if (state == "deployTops"){
	if(deployTopsTimer > 0){
		deployTopsTimer--;
	} else {
		deployTopsTimer = deployTopsTimerMax;
		state = "spindab";
		ricochet = true;
	}
} else if (state == "spindab"){
	if(dabTimer > 0){
		dabTimer--;
	} else {
		dabTimer = dabTimerMax;
		state = "spin";
		image_index = 0;
	}
} else if (state == "spin"){
	if(spinTimer > 0){
		spinTimer--;
	} else {
		spinTimer = SPINTIMERMAX;
		state = "run";
	}
}  else if (state == "run") {
	sideFacing = sideMoving;
	hspd = sideMoving * runSpd;
	if((sideMoving == -1 and x < leftBarrier) or (sideMoving == 1 and x > rightBarrier)){
		//this is what he does after he hits the ledge
		sideMoving = -sign(sideMoving);
		sideFacing = sideMoving;
		state = "throw1";
		ricochet = false;
		hspd = 0;
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


	if(state == "fall" or state == "sleep" or state == "throw5" or state == "deployTops"){
		sprite_index = spr_boss_topmanfall;
	} else if (state == "sleepIntro"){
		sprite_index = spr_boss_topmandab;
	} else if(state == "heal" or state == "spindab"){
		sprite_index = spr_boss_topmanspindab;
	} else if(state == "throw1"){
		sprite_index = spr_boss_topmanthrow1;
	} else if(state == "throw2" or state == "throw3"){
		sprite_index = spr_boss_topmanthrow2;
	} else if(state == "throw4"){
		sprite_index = spr_boss_topmanthrow3;
	} else if(state == "throw5"){
		sprite_index = spr_boss_topmandab;
	} else if(state == "spin"){
		sprite_index = spr_boss_topmanspin;
	}
	 
	image_xscale = -sideFacing;