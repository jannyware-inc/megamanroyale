if(!initialized){
	initialized = true;
	with(obj_enemy){
		with(instance_create_depth(x,y,depth,obj_enemyrespawner)){
			enemy = other.id;
		}
		instance_deactivate_object(self);
	}
}