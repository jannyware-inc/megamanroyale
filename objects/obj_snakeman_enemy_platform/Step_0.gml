if(!scr_inView()){
	visible = false;
} else{
	visible = true;
}

if(stop or !scr_inZone()){
	return;
}
if (state == 1){
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = moveTimerMax;
		state = 2;
		_player = instance_place(x,y-moveDist-1.5,obj_player)
		if(_player != noone){
			global.player.y = other.y-other.moveDist-1.1;
		}
		y -= moveDist;
	}
} else if (state == 2){
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = moveTimerMax;
		state = 3;
		_player = instance_place(x,y-moveDist-1.5,obj_player)
		if(_player != noone){
			global.player.y = other.y-other.moveDist-1.1;
		}
		y -= moveDist;
	}
} else if (state == 3){
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = moveTimerMax;
		state = 4;
		y+=moveDist;
	}
}else if (state == 4){
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = moveTimerMax;
		state = 1;
		y+=moveDist;
	}
}