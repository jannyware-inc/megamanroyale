centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "wait";
	return;
}

if(hp <= 0){
	scr_explodeBig();
	scr_dropPickups(10);
	instance_destroy(wall);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "wait"){
	
	hspd = 0;
	if (waitTimer > 0){
		waitTimer--;
	} else {
		sleepTimer = sleepTimerMax;
		state = "attack2";
		ballTimer = 0;
	}
} else if (state == "attack2"){
	if(attack2Timer > 0){
		attack2Timer--;
	} else {
		attack2Timer = attack2TimerMax;
		state = "attackBalls";
	}
} else if (state == "attackBalls"){
	if(ballTimer > 0){
		ballTimer--;
	} else {
		if(balls > 0){
			ballTimer = ballTimerMax;
			balls--;
			//create ball
			with(instance_create_depth(x+sideFacing*ballOffsetX,y+ballOffsetY,depth-1,obj_topman_enemy_catball)){
				zone = other.zone;
				sideFacing = other.sideFacing;
				vspd = other.ballVspd;
				wall = other.wall;
			}
		} else {
			state = "attack22";
			balls = ballsMax;
			ballTimer = 0;
		}
	}
	
} else if (state == "attack22"){
	if(attack2Timer > 0){
		attack2Timer--;
	} else {
		attack2Timer = attack2TimerMax;
		state = "waitBalls";
	}
}else if (state == "waitBalls"){
	if(instance_number(obj_topman_enemy_catball) == 0){
		state = "attackFleas";
	}
} else if (state == "attackFleas"){
	if(ballTimer > 0){
		ballTimer--;
	} else {
		ballTimer = ballTimerMax;
		if(fleas > 0){
			fleas--;
			//create flea
			fleaFrames = fleaFramesMax;
			with(instance_create_depth(x+sideFacing*fleaOffsetX,y+fleaOffsetY,depth-1,obj_topman_enemy_catflea)){
				zone = other.zone;
				sideFacing = other.sideFacing;
				vspd = other.fleaVspd;
				hspd = 2.5*other.sideFacing;
				wall = other.wall;
			}
		} else {
			state = "waitFleas";
			fleas = fleasMax;
		}
	}
} else if (state == "waitFleas"){
	if(instance_number(obj_topman_enemy_catflea) == 0){
		state = "attackBalls";
		ballTimer = 0;
	}
}


if(fleaFrames > 0){
	fleaFrames--;
}

with(wall){
	x = other.x-other.sprite_width/2+5;
	y = other.y-other.sprite_height;
}
image_xscale = -sideFacing;



if(state == "wait" or state == "waitBalls" or state == "waitFleas"){
	sprite_index = spr_topman_enemy_catidle;
} else if (state == "attack2" or state == "attack22"){
	sprite_index = spr_topman_enemy_catattack2;
} else if (state == "attackBalls"){
	sprite_index = spr_topman_enemy_catattack;
} else if (state == "attackFleas"){
	sprite_index = spr_topman_enemy_catattack3;
	if(fleaFrames > 0){
		image_index = 1;
	} else {
		image_index = 0;
	}
}