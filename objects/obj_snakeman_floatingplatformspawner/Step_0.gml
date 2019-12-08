if(!scr_inZone()){
	spawnTimer = 0;
	return;
}
if(scr_distanceToPlayer() < spawnDist){
	if(spawnTimer > 0){
		spawnTimer--;
	} else {
		spawnTimer = spawnTimerMax;
		with(instance_create_depth(x,y,depth,obj_snakeman_enemy_floatingplatform)){
			zone = other.zone;
		}
	}
} else {
	spawnTimer = spawnTimerMax;
}