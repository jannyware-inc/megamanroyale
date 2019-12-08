if(!scr_inZone()){
	return;
}

if(spawnTimer > 0){
	spawnTimer--;
} else{
	spawnTimer = SPAWNTIMERMAX;
	if(scr_inView() and instance_number(obj_crashman_tele) < maxTeles){
		with(instance_create_depth(x,y,depth,obj_crashman_tele)){
			zone = other.zone;
		}
	}
} 