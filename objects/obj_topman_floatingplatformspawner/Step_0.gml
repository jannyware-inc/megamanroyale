if(!scr_inZone()){
	spawnTimer = 0;
	return;
}
if(spawnTimer > 0){
	spawnTimer--;
} else if (scr_distanceToPlayer() < spawnDist) {
	spawnTimer = spawnTimerMax;
	with(instance_create_depth(x,y,depth,obj_topman_enemy_floatingplatform)){
		zone = other.zone;
		riseSpd = other.riseSpd;
	}
}