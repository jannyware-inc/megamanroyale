event_inherited();
dirDelta = 45;
for(i = 0; i < 360; i+=dirDelta){
	explosion = instance_create_depth(x, y,depth,obj_explosionPlayerParticle);
	with(explosion){
		spd = 1;
		dir = other.i;
	}
}
for(i = 0; i < 360; i+=dirDelta){
	explosion = instance_create_depth(x, y,depth,obj_explosionPlayerParticle);
	with(explosion){
		spd = 2;
		dir = other.i;
	}
}

instance_destroy();