centerx = x;
centery = y-sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(!scr_inZone()){
	
	instance_destroy();
}

scr_bossblink();
if(hp <= 0 and canDie){

	instance_destroy();
	return;
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

	
if(state == "fall"){
	if(grounded == 1){
		state = "heal";
		scr_playNoOverlap(snd_cutmantaunt);
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
			state = "jump";
			global.player.canInput = true;
			ricochet = false;
			attack = 1;
		}
	}
} else if (state == "jump"){
	if(grounded){
		if(jumps > 0){
			jumps--;
			state = "jumpsquat";
		} else {
			jumps = jumpsMin + irandom(jumpsRandom);
			state = "stomp";
			vspd = stompVspd;
		}
	}
} else if (state == "jumpsquat"){
	if(jumpSquatTimer > 0){
		jumpSquatTimer--;
	} else {
		jumpSquatTimer = jumpSquatTimerMax;
		state = "jumping";
		vspd = jumpVspd;
		jumpHspd = jumpHspdMin + irandom(jumpHspdRandom);
	}
} else if (state == "jumping"){
	hspd = jumpHspd;
	if(grounded){
		state = "landing";
		shakeTimer = shakeTimerMax;
		hspd=0;
	}
} else if (state == "landing"){
	if(landingTimer > 0){
		landingTimer--;
	} else {
		landingTimer = landingTimerMax;
		state = "jump";
	}
} else if (state == "stomp"){
	if(grounded){
		state = "shake";
		boulder = instance_create_depth(x,y-200,depth-1,obj_boss_gutsman_boulder);
		with(boulder){
			zone = other.zone;
		}
		shakeTimer = shakeTimerMax;
	}
} else if (state = "shake"){
	if(place_meeting(x,y,boulder)){
		state = "catch";
		with(boulder){
			grav = 0;
			vspd = 0;
			hspd = 0;
			y = other.bbox_top - sprite_height/2+6;
		}
	}
} else if(state == "catch"){
	if(catchTimer > 0){
		catchTimer--;
	} else {
		catchTimer = catchTimerMax;
		state = "throw";
		with(boulder){
			dir = point_direction(x,y,global.player.x,global.player.y);
			dirGen = true;
			grav = 0;
			state = "thrown";
		}
	}
}  else if(state == "throw"){
	if(throwTimer > 0){
		throwTimer--;
	} else {
		throwTimer = throwTimerMax;
		state = "jump";
	}
}



grounded = 0;
//collisions
if(!(state == "hurt" and hurtTimer1 > 0))
	vspd += grav;
//grounded = 0;
wallCollide = false;
_wall = instance_place(x, y+vspd, obj_wall);
if (_wall != noone) {
	while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
		y += (sign(vspd)*.99);
	}
	if(_wall.y > y){
		grounded = 1;
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


sideFacing = scr_playerSideCentered();

image_xscale = -sideFacing;


if(state == "fall"){
	image_index = 0;
	sprite_index = spr_boss_gutsman_taunt;
} else if (state == "taunt"){
	sprite_index = spr_boss_gutsman_taunt;
}else if (state == "jump" or state == "jumpsquat"){
		sprite_index = spr_boss_gutsman_squat;
} else if (state == "landing"){
	if(landingTimer/landingTimerMax > .5){
		sprite_index = spr_boss_gutsman_taunt;
		image_index = 0;
	} else {
		sprite_index = spr_boss_gutsman_squat;
	}
} else if (state == "jumping"){
	sprite_index = spr_boss_gutsman_jump;
} else if(state == "heal"){
	sprite_index = spr_boss_gutsman_taunt;
} else if (state == "shake"){
	sprite_index = spr_boss_gutsman_throw;
	image_index = 0;
} else if (state == "catch"){
	sprite_index = spr_boss_gutsman_throw;
	image_index = 1;
} else if (state == "throw"){
	sprite_index = spr_boss_gutsman_throw;
	image_index = 2;
} 

if(shakeTimer > 0){
	if(global.player.grounded){
		global.player.shakeFrames = 20;
		global.player.canCancelJump = false;
		global.player.externalvspd = -2;
	}
	shakeTimer--;
	var shakex = 5-irandom(10);
	var shakey = 5-irandom(10);
	layer_x(fg,shakex);
	layer_y(fg,shakey);
	layer_x(bg,shakex);
	layer_y(bg,shakey);
} else {
	layer_x(fg,0);
	layer_y(fg,0);
	layer_x(bg,0);
	layer_y(bg,0);
}