gotox = 0;
gotoy = 0;
tpDistance = 9;
topWall = instance_create_depth(x-16,y-64,0,obj_wall);
with(topWall){
	image_xscale = 32/16;
	image_yscale = 16/16;
}
bottomWall = instance_create_depth(x-16.75,y-16,0,obj_wall);
with(bottomWall){
	image_xscale = 32/16;
	image_yscale = 16/16;
}
state = "active";