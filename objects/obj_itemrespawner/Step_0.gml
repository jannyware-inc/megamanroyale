if(itemInstance == noone){
	itemInstance = instance_create_depth(x,y,depth,item);
	with(itemInstance){
		selfdestroy = false;
	}
} else if (!instance_exists(itemInstance)){
	if(respawnTimer > 0){
		respawnTimer--;
	} else {
		itemInstance = instance_create_depth(x,y,depth,item);
		with(itemInstance){
			selfdestroy = false;
		}
		respawnTimer = respawnTimerMax;
	}
} else {
	respawnTimer = respawnTimerMax;
}