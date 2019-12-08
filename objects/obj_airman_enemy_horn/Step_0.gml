
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	
if(!scr_inZoneOrView())
	instance_destroy();
	
if(scr_freezeexit()) return;
	
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(state == "sleep"){
	if(sleepTimer > 0){
		sleepTimer--;
	} else {
		sleepTimer = sleepTimerMax;
		state = "rise";
	}
} else if (state == "rise"){
	if(currentRise < riseDist){
		currentRise += riseVspd;
		vspd = -riseVspd;
	} else {
		state = "sleep1"
		vspd = 0;
		sleepTimer = outSleepTimerMax;
	}
} else if (state == "sleep1"){
	if(sleepTimer > 0){
		sleepTimer--;
	} else {
		state = "fall";
	}
} else if (state == "fall"){
	if(currentRise > 0){
		currentRise -= fallVspd;
		vspd = fallVspd;
	} else {
		state = "sleep"
		sleepTimer = sleepTimerMax;
		vspd = 0;
	}
}


	y += vspd;