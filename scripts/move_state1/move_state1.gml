/*
//this file is a mess and i regret everything
//...but it just works™

//external speed collisions
//vertical
externalWallCollide = false;
if(externalhspd != 0 or externalvspd != 0){
	if (instance_place(x, y+.4998+externalvspd, obj_wall)) {
		while(!place_meeting(x, y+.4998+(sign(externalvspd)*.69), obj_wall)) {
			y += (sign(externalvspd)*.69);
		}
		externalvspd = 0;
	}
	y+=externalvspd;

//horizontal
	if (place_meeting(x+externalhspd, y+.4998, obj_wall)) {
		externalWallCollide = true;
		while(!place_meeting(x+sign(externalhspd)*.69, y+.4998, obj_wall)) {
			x += sign(externalhspd)*.69;
		}
		externalhspd = 0;
		mask_index = spr_player_mask_standing;
		sliding = 0;
	}
	x+=externalhspd;

}


/// move_state

//Get direction
dir = point_direction(0,0, xaxis, yaxis);
//dir = point_direction(0,0, xaxis, 0);

if(global.player.canInput == 0){
	rKey = 0;
	lKey = 0;
	dKey = 0;
	dKeyPress = 0;
	uKey = 0;
	uKeyPress = 0;
	jumpKey = 0;
	jumpKeyPress = 0;
	actKeyPress = 0;
	actKeyHold = 0;
	xaxis = 0;
	yaxis = 0;
	slideKeyPress = 0;
}

scr_inventoryInput();


//get length
if (xaxis == 0) && (yaxis == 0) {
	len = 0;
	if(blinkTimer > 0){
		blinkTimer--;
	}
	if(idleTimer > 0){
		if(blinkTimer == 0)
			idleTimer--;
	} else {
		blinkTimer = blinkTimerMax;
		idleTimer= idleTimerMax;
	}
	
} else {
	blinkTimer = 0;
	idleTimer= idleTimerMax;
	len = spd;
	if (sliding == 0 and hurt == 0)
		get_face();
}


//get speed variables
hspd = lengthdir_x(len,dir);
vspd += grav*sideUp;

//runTimer increment
if(len != 0)
	runTimer++;
else if (runTimer > 0 and !sliding){
	if(runTimer > runTrigger)
		runTimer = runTrigger;
	runTimer--;
}
	
//bullet offset start
if(grounded){
	armLength = armLengthGround+(sideUp == -1 * -20);
	armHeight = armHeightGround+(sideUp == -1 * -20);
} else {
	armLength = armLengthAir+(sideUp == -1 * -20);
	armHeight = armHeightAir+(sideUp == -1 * -20);
}


//iframe blinking
if(invulnerable and iFrameTimer%(blinkFrames*2)>(blinkFrames-1)){
	invisible = true;
} else {
	invisible = false;
}


//gravity
if (grounded){
	vspd = 0;
	gravBuffer = 0;
} else if (!disableJumpGravity and !hurt){
	//mask_index = spr_player_mask_standing;
	if(gravBuffer >= 1){
		gravBuffer =  0;
		vspd = vspd + 1;
	}else{
		if(!hurt)
			//mask_index = spr_player_mask_standing;
		gravBuffer+= grav*sideUp;
	}
}

//throw timer
if(throwTimer > 0){
	throwTimer--;
	if(grounded){
		hspd = 0;
	}
	if(onLadder){
		vspd = 0;
	}
}

//jumpbuffer
if(jumpBuffer <= 0 and jumpKeyPress){
	jumpBuffer = jumpBufferMax;
} else if (sliding or (jumpBuffer > 0 and !jumpKey)){
	jumpBuffer = 0;
} else if(jumpBuffer > 0){
	jumpBuffer--;
}


//jump or slide
if (!hurt and (slideKeyPress or jumpBuffer > 0) and grounded and (slideKeyPress or (sideUp == 1 and dKey) or (sideUp == -1 and uKey)) and !sliding and (throwTimer <= 0)){	
	switch(face){
	case 0:
	case 1: //upright
	case 7://downright
		if(sideUp == 1){
			mask_index = spr_player_mask_slidingright;
		} else {
			mask_index = spr_player_mask_slidingrightup;
		}
			if(!place_meeting(x+1,y+.4998,obj_wall)){
					instance_create_depth(x-dustOffsetX,y+dustOffsetY,depth,obj_slideDustright);
					sliding = 1;
			} else {
				mask_index = spr_player_mask_standing;
			}
		break;
	case 3:
	case 4: //upright
	case 5://downright
		if(sideUp == 1){
			mask_index = spr_player_mask_slidingleft;
		} else {
			mask_index = spr_player_mask_slidingleftup;
		}
			if(!place_meeting(x-1,y+.4998,obj_wall)){
				instance_create_depth(x+dustOffsetX,y+dustOffsetY,depth,obj_slideDustleft);
				sliding = 1;
			} else {
				mask_index = spr_player_mask_standing;
			}
			break;
	}
} else if (!hurt and jumpBuffer > 0 and grounded and !onLadder){
	//if youre sliding and try jumping with a wall above you, you dont jump
	if(!sliding or (sliding and !place_meeting(x,y-6*sideUp,obj_wall))){
		currentJumpHeight = jumpHeight*sideUp;
		canCancelJump = true;
		jumpBuffer = 0;
		onLadder = 0;
		sliding = 0;
		slideFrames = 0;
		jumpFrames = 0;
		vspd = -jumpHeight*sideUp;
		disableJumpGravity = 1;
		runTimer = runTrigger;//so you dont land and then stop for 3 frames
		grounded = 0;
	}
} else if (!hurt and jumpKeyPress and onLadder and !uKey){//ladder dismount
	canGrabLadders = false;
	onLadder = 0;
	sliding = 0;
	slideFrames = 0;
	jumpFrames = 1000;
	disableJumpGravity = 1;
	runTimer = runTrigger;//so you dont land and then stop for 3 frames
} else if (!hurt and !onLadder and disableJumpGravity and !grounded and ((sideUp == 1 and (jumpFrames * jumpDeacceleration) <= currentJumpHeight) or (sideUp == -1 and -(jumpFrames * jumpDeacceleration) >= currentJumpHeight))){
	jumpFrames++;
	vspd = -currentJumpHeight + (jumpFrames * jumpDeacceleration)*sideUp;
	if(canCancelJump and !jumpKey){
		jumpFrames = 1000;
		vspd = 0;
	}
} else if (disableJumpGravity and !grounded or onLadder or ((sideUp == 1 and (jumpFrames * jumpDeacceleration) > currentJumpHeight) or (sideUp == -1 and -(jumpFrames * jumpDeacceleration) < currentJumpHeight))){
	//show_debug_message("0");
	jumpFrames = 0;
	disableJumpGravity = 0;

}

//collision mask
if(sliding){
	switch(face){
		case 0:
			if(!hurt and sign(xaxis) == -1){
				dir = 180;
				get_face();
				mask_index = spr_player_mask_standing;
				if(place_meeting(x,y+.4998,obj_wall)){
					if(sideUp == 1){
						mask_index = spr_player_mask_slidingright;
					} else {
						mask_index = spr_player_mask_slidingrightup;
					}
				} else {
					sliding = 0;
				}
			} else {
				if(sideUp == 1){
					mask_index = spr_player_mask_slidingright;
				} else {
					mask_index = spr_player_mask_slidingrightup;
				}
			}
			break;
		case 4:
			if(!hurt and sign(xaxis) == 1){
				dir = 0;
				get_face();
				mask_index = spr_player_mask_standing;
				if(place_meeting(x,y+.4998,obj_wall)){
					if(sideUp == 1){
						mask_index = spr_player_mask_slidingleft;
					} else {
						mask_index = spr_player_mask_slidingleftup;
					}
				} else {
					sliding = 0;
				}
			} else {
				if(sideUp == 1){
					mask_index = spr_player_mask_slidingleft;
				} else {
					mask_index = spr_player_mask_slidingleftup;
				}
			break;
			}
		}
} else {
	mask_index = spr_player_mask_standing;
	if(place_meeting(x,y+.4998,obj_wall)){		
		sliding = 2;
		switch(face){
		case 0:
			if(sideUp == 1){
				mask_index = spr_player_mask_slidingright;
			} else {
				mask_index = spr_player_mask_slidingrightup;
			}
			break;
		case 4:
			if(sideUp == 1){
				mask_index = spr_player_mask_slidingleft;
			} else {
				mask_index = spr_player_mask_slidingleftup;
			}
			break;
		}
	}
}


//terminal veolcity
if(sideUp == 1){
	if (vspd > 7)
		vspd = 7;
} else {
	if (vspd <-7){
		vspd = -7;
	}
}
	
//hurtframes counter	
if (hurtFrames > 1){
	shootFrameTimer = 0;
	throwTimer = 0;
	hurtFrames--;
	hurt = 1
} else if (hurtFrames == 1){
	hurtFrames--;
	iFrameTimer = hurtIFrameTimer;
} else {
	hurt = 0;
}
//hurt (where megaman stumbles back)	
if (hurt == 1){
	//vspd = 0;
	onLadder = 0;
}

if(hurtFrames > maxHurtFrames-upHurtFrames){
	vspd = hurtVspd;
}

//...or ladders
if (onLadder){
	hspd = 0;
}

//iframes invulnerability
if (iFrameTimer > 0){
	invulnerable = 1;
	iFrameTimer--;
} else {
	invulnerable = 0;
}

//laddertopgrounded check
_ladderTopGrounded = instance_place(x, y+1.5*sideUp, obj_laddertop);
if(!(_ladderTopGrounded != noone  and  vspd >= 0 and !onLadder and !place_meeting(x, y, obj_laddertop))){
	_ladderTopGrounded = noone;
}

//ground check
if ((place_meeting(x, y+1.5*sideUp, obj_wall) and ((sideUp == 1 and vspd >= 0) or (sideUp == -1 and vspd <=0))) or _ladderTopGrounded != noone) {
	grounded = true;
}else{
	grounded = false;
	runTimer = runTrigger;
	sliding = 0;
	slideFrames = 0;
}


//ladders
_ladder = instance_place(x,y-1,obj_ladder);

if(_ladder == noone and (grounded or _ladderTopGrounded != noone)){
	_ladder = instance_place(x,y+1.51,obj_ladder);
}
if (hurt == 0 and _ladder != noone and (abs(_ladder.x+8 - x) <= ladderGrabX) ){
	if (sliding == 0 and ((uKey and !dKey and _ladderTopGrounded == noone) or (_ladderTopGrounded != noone and _ladderTopGrounded.canDescend and dKey and !uKey)) and hurt == 0 and canGrabLadders ){

		if (!onLadder){
			ladderY = y; // marks where you initially climbed the ladder
			shootFrameTimer = 0;
		}
		if(_ladderTopGrounded != noone and dKey and _ladderTopGrounded.canDescend){
			y = _ladderTopGrounded.y + climbUpDist;
		}
		sliding = 0;
		x = _ladder.x+8; 
		onLadder = true;
		disableJumpGravity = true;
		hspd = 0;
	} 
} else {
	onLadder = 0;
}

if(onLadder){
	x = _ladder.x+8
	vspd = ladderSpd * (dKey - uKey) * (shootFrameTimer <= 0);
}


if (canGrabLadders == 0 and !uKey){
	canGrabLadders = true;
}

//wily doors
_wilyDoor = instance_place(x+sign(hspd)*5,y+.4998,obj_wilydoor)
if (_wilyDoor != noone) {
	_wilyDoor.opening = true;
}
	
//show_debug_message("new Frame");
_maxChecks = 10;
//vertical wall collisions
if (vCollision){
	if (instance_place(x, y+.4998+vspd, obj_wall)) {
		while(!place_meeting(x, y+.4998+(sign(vspd)*.69), obj_wall)) {
			//show_debug_message("v");
			y += (sign(vspd)*.69);
		}
		
		if(!uKey){
			onLadder = false;
		}
		disableJumpGravity = false;
		vspd = 0;
		externalvspd = 0;
	}
}

//stuck checking
_wall = instance_place(x, y+.4998, obj_wall)
if (_wall != noone){
	//if(!place_meeting(x,y+1,obj_wall)){
	//	y = y+1;
	//}
	//y = _wall.y;
	hCollision = false;
	vCollision = false;
	//grounded = false;
	}
else{
	hCollision = true;
	vCollision = true;
}

climbUp = 0;
//laddertop wall collisions

_laddertop = instance_place(x, y+.4998+vspd, obj_laddertop);
if(_laddertop != noone){
	if (y < _laddertop.y and !onLadder){
		//show_debug_message("player y, ladder y " + string(y) + "    " + string(_laddertop.y));
		y = _laddertop.y-1;
			vspd = 0;
			disableJumpGravity = false;
		}
		if (y-climbUpDist < _laddertop.y and onLadder and vspd < 0 and !place_meeting(x,_laddertop.y,obj_wall)){
			y = _laddertop.y;
			grounded = 1;
			wasGrounded = 1;
			onLadder = 0;
			disableJumpGravity = false;
		}
		if (y-climbUpAnimDist < _laddertop.y and onLadder and vspd != 0){
			climbUp = 1;
		}
}
		

	y+= vspd;

//hurt horizontal movement
if(hurt == 1){
	runTimer = runTrigger;
	switch(face){
	case 0:
	case 1: //upright
	case 7://downright
		hspd = hurtKnockback;
		break;
	case 3:
	case 4: //upright
	case 5://downright
		hspd = -hurtKnockback;
		break;
	}
}
if(!sliding){
	slideFrames = 0;
} else if(sliding == 2){
	slideFrames = 20;
}

//slide speed, some movement is done in face switch
if (sliding > 0 and hurt == 0 and slideFrames < maxSlideFrames){
	slideFrames++;
	runTimer = runTrigger;
	
	switch(face){
	case 0:
	case 1: //upright
	case 7://downright
		hspd = slideSpeed;
		break;
	case 3:
	case 4: //upright
	case 5://downright
		hspd = -slideSpeed;
		break;
	}
	
}
if((sliding > 0) and (sliding == 2 or slideFrames >= maxSlideFrames)){
		mask_index = spr_player_mask_standing;
	
		if(!place_meeting(x,y+.4998,obj_wall)){
				sliding = 0;
				//runTimer = 0;
				runTimer = runTrigger;
				sliding = 0;
				slideFrames = 0;
	
		} else {
			if(sliding and place_meeting(x,y+.4998,obj_wall)){
				sliding = 2;
				//hspd = 0;
				slideFrames = 1;
				switch(face){
				case 0:
					if(sideUp == 1){
						mask_index = spr_player_mask_slidingright;
					} else {
						mask_index = spr_player_mask_slidingrightup;
					}
					break;
				case 4:
					if(sideUp == 1){
						mask_index = spr_player_mask_slidingleft;
					} else {
						mask_index = spr_player_mask_slidingleftup;
					}
					break;
				}	
			}
		}
}

if(dabKey and grounded and !sliding and hurt == 0 and !onLadder and weapon.name == "megabuster"){
	isRunning = false;
	runTimer = 0;
	sliding = 0;
	switch(face){
		case 0:
			dabbing = 1;
			break;
		case 4:
			dabbing = 2;
			break;
	}
	hspd = 0;
} else {
	dabbing = 0;
}

//horizontal collisions
if (hCollision){
	if (place_meeting(x+hspd, y+.4998, obj_wall)) {
		while(!place_meeting(x+sign(hspd)*.69, y+.4998, obj_wall)) {
			x += sign(hspd)*.69;
			//show_debug_message("h");
		}
		mask_index = spr_player_mask_standing;
		if(!sliding){
			runTimer = 0;
		}
		hspd = 0;
		sliding = 0;
	}
}


if (!grounded or runTimer == 1 or runTimer >= runTrigger) // you might want to change this
	x += hspd;
	//x = round(x);



//shooting
if(!dabbing and actKeyPress and sliding == 0 and hurt == 0){
	//show_debug_message("inspector created at " + string(x) +", " + string(y));
	shoot();
}

//sfx
if(!wasGrounded and grounded){
	audio_play_sound(snd_landing,9,0);
}

//deathBarriers
_deathBarrier = instance_place(x,y+.4998,obj_deathBarrier)
if(_deathBarrier != noone){
	if(_deathBarrier.y + 8 > y){
		y = _deathBarrier.y - 8;
	}
	vspd = 0;
	hspd = 0;
	hp = 0;
}

//checkpoints
if(place_meeting(x,y+.4998,obj_checkpoint)){
	_checkpoint = instance_place(x,y+.4998,obj_checkpoint);
	if(_checkpoint.checkpoint > checkpoint){
		respawnX = _checkpoint.xx;
		respawnY = _checkpoint.yy;
	}
}



//show_debug_message("Runtimer = " + string(runTimer) + " Grounded = " + string(grounded));
// sprites
if(!onLadder or (!wasOnLadder and onLadder) or shootFrameTimer == shootFrames){
	switch(face){
		case 0:
		case 1: //upright
		case 7://downright
			sideFacing = 1;
			break;
		case 3:
		case 4:
		case 5:
			sideFacing = -1;
	}
}

if(weapon.name == "megabuster"){
	if (hurt == 1)
		sprite_index = RIGHTHURT;
	else if(onLadder and (shootFrameTimer > 0)){
			sprite_index = RIGHTLADDERSHOOT;
			image_speed = 0;
			shootFrameTimer--;
		}
	else if(climbUp == 1)
			sprite_index = CLIMBUP;
	else if (onLadder){
		sprite_index = CLIMB;
		image_index = abs((y - ladderY) / ladderAnimationDelta);
	}
	else if(!grounded){
		if (shootFrameTimer > 0){
			sprite_index = RIGHTJUMPSHOOT;
			image_index = 0;
			shootFrameTimer--;
		}else{
			sprite_index = RIGHTJUMP;
			image_index = 0;
		}
	}else{
		if (sliding){
			sprite_index = RIGHTSLIDE;
		}
		else if(runTimer > runTrigger){
			if (shootFrameTimer > 0){
				sprite_index = RIGHTSHOOTRUN;
				image_speed = 1;
				shootFrameTimer--;
			}else{
				sprite_index = RIGHTRUN;
				image_speed = 1;
			}
		}else{
			if(dabbing){
				sprite_index = spr_player_dab;
				image_speed = 0;
				image_index = 0;
			} else if (shootFrameTimer > 0){
				sprite_index = RIGHTSHOOT;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
				shootFrameTimer--;
			} else if (blinkTimer > 0){
				sprite_index = spr_player_blink;
				image_speed = 0;
				image_index = 0;
			}else{
				sprite_index = RIGHT;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
			}
		}
	}
} else if (weapon.name == "metalblade"){
	if (hurt == 1)
		sprite_index = spr_player_righthurtm;
	else if(onLadder and (shootFrameTimer > 0)){
			sprite_index = spr_player_rightladdershootm;
			image_speed = 0;
			shootFrameTimer--;
		}
	else if(climbUp == 1)
			sprite_index = spr_player_climbupm;
	else if (onLadder){
		sprite_index = spr_player_climbm;
		image_index = abs((y - ladderY) / ladderAnimationDelta);
	}
	else if(!grounded){
		if (shootFrameTimer > 0){
			sprite_index = spr_player_rightjumpshootm;
			image_index = 0;
			shootFrameTimer--;
		}else{
			sprite_index = spr_player_rightjumpm;
			image_index = 0;
		}
	}else{
		if (sliding){
			sprite_index =  spr_player_rightslidem;
		}
		else if(runTimer > runTrigger){
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshootrunm;
				image_speed = 1;
				shootFrameTimer--;
			}else{
				sprite_index = spr_player_rightrunm;
				image_speed = 1;
			}
		}else{
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshootm;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
				shootFrameTimer--;
			}else if (blinkTimer > 0){
				sprite_index = spr_player_rightblinkm;
				image_speed = 0;
				image_index = 0;
			}else{
				sprite_index = spr_player_rightm;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
			}
		}
	}
} else if (weapon.name == "searchsnake"){
	if (hurt == 1)
		sprite_index = spr_player_righthurts;
	else if(onLadder and (shootFrameTimer > 0)){
			sprite_index = spr_player_rightladdershoots;
			image_speed = 0;
			shootFrameTimer--;
		}
	else if(climbUp == 1)
			sprite_index = spr_player_climbups;
	else if (onLadder){
		sprite_index = spr_player_climbs;
		image_index = abs((y - ladderY) / ladderAnimationDelta);
	}
	else if(!grounded){
		if (shootFrameTimer > 0){
			sprite_index = spr_player_rightjumpshoots;
			image_index = 0;
			shootFrameTimer--;
		}else{
			sprite_index = spr_player_rightjumps;
			image_index = 0;
		}
	}else{
		if (sliding){
			sprite_index =  spr_player_rightslides;
		}
		else if(runTimer > runTrigger){
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshootruns;
				image_speed = 1;
				shootFrameTimer--;
			}else{
				sprite_index = spr_player_rightruns;
				image_speed = 1;
			}
		}else{
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshoots;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
				shootFrameTimer--;
			}else{
				sprite_index = spr_player_rights;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
			}
		}
	}
} else if (weapon.name == "airshooter"){
	if (hurt == 1)
		sprite_index = spr_player_righthurta;
	else if(onLadder and (shootFrameTimer > 0)){
			sprite_index = spr_player_rightladdershoota;
			image_speed = 0;
			shootFrameTimer--;
		}
	else if(climbUp == 1)
			sprite_index = spr_player_climbupa;
	else if (onLadder){
		sprite_index = spr_player_climba;
		image_index = abs((y - ladderY) / ladderAnimationDelta);
	}
	else if(!grounded){
		if (shootFrameTimer > 0){
			sprite_index = spr_player_rightjumpshoota;
			image_index = 0;
			shootFrameTimer--;
		}else{
			sprite_index = spr_player_rightjumpa;
			image_index = 0;
		}
	}else{
		if (sliding){
			sprite_index =  spr_player_rightslidea;
		}
		else if(runTimer > runTrigger){
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshootruna;
				image_speed = 1;
				shootFrameTimer--;
			}else{
				sprite_index = spr_player_rightruna;
				image_speed = 1;
			}
		}else{
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshoota;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
				shootFrameTimer--;
			}else if (blinkTimer > 0){
				sprite_index = spr_player_rightblinka;
				image_speed = 0;
				image_index = 0;
			}else{
				sprite_index = spr_player_righta;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
			}
		}
	}
}else if (weapon.name == "rushcoil" or weapon.name == "rushjet"){
	if (hurt == 1)
		sprite_index = spr_player_righthurtr;
	else if(onLadder and (shootFrameTimer > 0)){
			sprite_index = spr_player_rightladdershootr;
			image_speed = 0;
			shootFrameTimer--;
		}
	else if(climbUp == 1)
			sprite_index = spr_player_climbupr;
	else if (onLadder){
		sprite_index = spr_player_climbr;
		image_index = abs((y - ladderY) / ladderAnimationDelta);
	}
	else if(!grounded){
		if (shootFrameTimer > 0){
			sprite_index = spr_player_rightjumpshootr;
			image_index = 0;
			shootFrameTimer--;
		}else{
			sprite_index = spr_player_rightjumpr;
			image_index = 0;
		}
	}else{
		if (sliding){
			sprite_index =  spr_player_rightslider;
		}
		else if(runTimer > runTrigger){
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshootrunr;
				image_speed = 1;
				shootFrameTimer--;
			}else{
				sprite_index = spr_player_rightrunr;
				image_speed = 1;
			}
		}else{
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshootr;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
				shootFrameTimer--;
			}else if (blinkTimer > 0){
				sprite_index = spr_player_rightblinkr;
				image_speed = 0;
				image_index = 0;
			}else{
				sprite_index = spr_player_rightr;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
			}
		}
	}
}else if (weapon.name == "hyperbomb"){
	if (hurt == 1)
		sprite_index = spr_player_righthurtb;
	else if(onLadder and (shootFrameTimer > 0)){
			sprite_index = spr_player_rightladdershootb;
			image_speed = 0;
			shootFrameTimer--;
		}
	else if(climbUp == 1)
			sprite_index = spr_player_climbupb;
	else if (onLadder){
		sprite_index = spr_player_climbb;
		image_index = abs((y - ladderY) / ladderAnimationDelta);
	}
	else if(!grounded){
		if (shootFrameTimer > 0){
			sprite_index = spr_player_rightjumpshootb;
			image_index = 0;
			shootFrameTimer--;
		}else{
			sprite_index = spr_player_rightjumpb;
			image_index = 0;
		}
	}else{
		if (sliding){
			sprite_index =  spr_player_rightslideb;
		}
		else if(runTimer > runTrigger){
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshootrunb;
				image_speed = 1;
				shootFrameTimer--;
			}else{
				sprite_index = spr_player_rightrunb;
				image_speed = 1;
			}
		}else{
			if (shootFrameTimer > 0){
				sprite_index = spr_player_rightshootb;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
				shootFrameTimer--;
			}else if (blinkTimer > 0){
				sprite_index = spr_player_rightblinkb;
				image_speed = 0;
				image_index = 0;
			}else{
				sprite_index = spr_player_rightb;
				image_speed = 0;
				image_index = 1;
				//runTimer++;
			}
		}
	}
}

if((len == 0 or (vspd == 0 and hspd == 0)) and !onLadder){
	if(runTimer > 0)
		image_index = 1;
	else
		image_index = 0;	
	isRunning = false;
	//runTimer = 0;
}


externalhspd = 0;
if(externalvspd != 0){
	if(sign(externalvspd) == -1*sideUp and sign(externalvspd + grav*sideUp) == 1*sideUp){
		externalvspd = 0;
	} else {
		externalvspd+= grav*sideUp;
	}
}


wasSideUp = sideUp;
wasGrounded = grounded; //you should check if vspd is positive
wasSliding = sliding;
wasOnLadder = onLadder;
