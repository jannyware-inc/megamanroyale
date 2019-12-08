//y += lerp(0,gotoy-y,1/global.tps);
//x += lerp(0,gotox-x,1/global.tps);


if(room != curRoom){
	inRoom = false;
	x = gotox;
	y = gotoy;
	return;
} else {
	inRoom = true;
}
if(instance_exists(global.player)){
	depth = global.player.depth +1;
} else {
	depth = -100;
}

/*
if(iplTimerMax == 0){
	show_debug_message("For some reason this broke the code");
	iplTimerMax = 10;
} else {
	iplTimerMax = room_speed/global.tps;
}
*/
//show_debug_message("sliding? " + string(sliding));
centerx = x;
centery = y - sprite_height/2;
var localfreezeexit = scr_localfreezeexit();
updateTimer++;

//check if there is a position update
if(lastGotox != gotox or lastGotoy != gotoy){
	if(sign(gotox - lastGotox) != 0)
		sideFacing = sign(gotox - lastGotox);
	blinkTimer = 0;
	idleTimer= idleTimerMax;
	//iplTimerMax = updateTimer;
	//show_debug_message("updatetimer = " + string(updateTimer));
	updateTimer = 0;
	iplSx = x;
	iplSy = y;
	iplEx = gotox;
	iplEy = gotoy;
	//if(instance_exists(global.ping)){
	//	iplTimerMax = global.ping.framesSinceLastUpdate;
	//}
	iplTimer = 0;
	moving = true;
	stopFrames = stopFramesMax;
} else {
	if(!localfreezeexit){
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
	}
}
x = lerp(iplSx,iplEx,iplTimer/iplTimerMax);
y = lerp(iplSy,iplEy,iplTimer/iplTimerMax);


if(x != lastx or y != lasty){
	//show_debug_message("moving");
	stopFrames = stopFramesMax;
} else {
	//show_debug_message("not moving");
}
if(stopFrames > 0){
	moving = true;
	if(abs(x - tiptoestartx) < tiptoedistance){
		tiptoeing = true;
	} else {
		tiptoeing = false;
	}
	stopFrames--;
} else {
	moving = false;
	tiptoestartx = x;
}

if(!wasMoving and moving){
	image_index = 1; //corrects running animation	
}
if(iplTimer<iplTimerMax){
	iplTimer++;
}

//grounded
_ladderTop = instance_place(x,y+2.5,obj_laddertop);
if(place_meeting(x,y+2.5,obj_wall) or (_ladderTop != noone and _ladderTop.y > y)){
	grounded = true;
} else {
	grounded = false;
}

if(!localfreezeexit){
	if(throwTimer > 0){
		throwTimer--;
		throwing = true;
	} else {
		throwing = false;
	}

	if(shootTimer > 0){
		shootTimer--;
		shooting = true;
	} else {
		shooting = false;
	}

	if(dabbing){
		shooting = false;
		shootTimer = 0;
		moving = 0;
		if(dabbing == 1){
			sideFacing = 1;
		} else if (dabbing == 2){
			sideFacing = -1;
		}
	}
	
	if(moving){
		runAnimTimer += sprite_get_speed(sprite_index)/room_speed*image_speed;
	} else {
		runAnimTimer = 0;
	}
}


if(hurt > 0 and wasHurt == 0){
	
	with(instance_create_depth(x,y-sprite_height-6,-10,obj_sweat)){
		transparent = true;
	}
	with(instance_create_depth(x+10,y-sprite_height-2,-10,obj_sweat)){
		transparent = true;
	}
	with(instance_create_depth(x-10,y-sprite_height-2,-10,obj_sweat)){
		transparent = true;
	}
	
}

if(wasHurt > 0 and hurt == 0){
	iFrameTimer = hurtIFrameTimer;
}

if(onLadder and !wasOnLadder){
	ladderY = y;
}

if(onLadder and (place_meeting(x,y,obj_ladder) or place_meeting(x,y,obj_laddertop))){
	ladderDraw = 1;
} else {
	ladderDraw = 0;
}
if(!localfreezeexit){
	if(iFrameTimer > 0){
		iFrameTimer--;
		if(iFrameTimer%4 >= 2){
			invisible = true;
		} else {
			invisible = false;
		}
	} else {
		invisible = false;
	}
} else {
	if(!dead){
		invisible = false;
	}
}

if(dead > 0){
	invisible = true;
}
if(dead == 1){
	//scr_remotePlayerDie(); // this is handled in updateall function
	dead = 2;
}

if(wasSliding == 0 and sliding > 0){
	if(sideFacing > 0){
		with(instance_create_depth(x-dustOffsetX,y+dustOffsetY,depth,obj_slideDustright)){
			transparent = true;
		}
	} else {
		with(instance_create_depth(x+dustOffsetX,y+dustOffsetY,depth,obj_slideDustright)){
			transparent = true;
		}
	}
}



//last pos
lastGotox = gotox;
lastGotoy = gotoy;
wasHurt = hurt;
wasSliding = sliding;
wasOnLadder = onLadder;
sideDraw = sideFacing;
wasMoving = moving;
lastx = x;
lasty = y;

if(targetdir == 9){
	moving = false;
	//if(grounded){
		sideFacing = -1;
	//}
} else if(targetdir == 11){
	moving = false;
	//if(grounded){
		sideFacing = 1;
	//}
} else if(targetdir == 2 or targetdir == 5){
	sideFacing = -1;
	moving = true;
} else if(targetdir == 4 or targetdir = 7){
	sideFacing = 1;
	moving = true;
} 

if(!moving){
	if(targetdir == -1){
		sideFacing = -1;
	} else if (targetdir == 1){
		sideFacing = 1;
	}
}

//scr_weaponcolors(weapon);
sideDraw = sideFacing;
if(hurt > 0){
	sideDraw = -sideFacing;
	image_index = 18;
	image_speed = 0;
} else if (ladderDraw){
	if(throwing){
		image_index = 27;
		image_speed = 0;
	}else if(shooting){
		image_index = 26;
		image_speed = 0;
	} else {
		sideDraw = abs((floor((y - ladderY) / ladderAnimationDelta)%2))*2-1;
		image_index = 15;
		image_speed = 0;
	}
}else if(!grounded){
	if(dabbing){
		image_index = 14;
		image_speed = 0;
	} else if(throwing){
		image_index = 17;
		image_speed = 0;
	} else if(shooting){
		image_index = 16;
		image_speed = 0;
	} else {
		image_index = 15;
		image_speed = 0;
	}
}else if(moving){
	if(sliding){
		image_index = 13;
		image_speed = 0;
	} else if(throwing){
		image_index = 4;
		image_speed = 0;
	} else if(shooting and !tiptoeing){
		image_index = 9 + runAnimTimer%3.99;
		image_speed = 1;
	} else if(shooting and tiptoeing){
		image_index = 3;
		image_speed = 0;
	} else if(tiptoeing){
		image_index = 2;
		image_speed = 0;
	} else {
		//show_debug_message("running");
		image_index = 5 + runAnimTimer%3.99;
		image_speed = 1;
	}
} else {
	if(dabbing){
		image_index = 14;
		image_speed = 0;
	} else if (throwing){
		image_index = 4;
		image_speed = 0;
	}else if(shooting){
		image_index = 3;
		image_speed = 0;
	} else if (blinkTimer > 0) {
		image_index = 1;
		image_speed = 0;
	} else {
		image_index = 0;
		image_speed = 0;
	}
}
 