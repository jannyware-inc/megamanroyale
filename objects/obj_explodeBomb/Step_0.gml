centerx = x;
centery = y;

for(i = 0; i <=360;i+=90){
	with(instance_create_depth(x,y,depth,obj_explosionBombCardinal)){
		dir = other.i;
		spd = 1.5;
		alpha = other.alpha;
	}
}
for(i = 45; i <=360;i+=90){
	with(instance_create_depth(x,y,depth,obj_explosionBombDiagonal)){
		dir = other.i;
		spd = 2;
		alpha = other.alpha;
	}
}
for(i = 0; i <=360;i+=90){
	with(instance_create_depth(x,y,depth,obj_explosionBombCardinal)){
		dir = other.i;
		spd = 2.5;
		alpha = other.alpha;
	}
}
instance_destroy();