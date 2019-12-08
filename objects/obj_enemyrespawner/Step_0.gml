if(!initialized){
	initialized = true;
	if(enemy != noone){
		instance_activate_object(enemy);
		with(enemy)
			other.copyenemy = instance_copy(false);
		instance_deactivate_object(copyenemy);
	}
}

if(!instance_exists(enemy)){
	instance_activate_object(copyenemy);
	with(copyenemy)
		other.enemy = instance_copy(false);
	instance_deactivate_object(copyenemy);
}