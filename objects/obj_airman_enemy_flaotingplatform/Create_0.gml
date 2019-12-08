event_inherited();
degPerFrame = 1.44*.75;
dir = 180;
spd = 1.32*.75;
playerDeltaX = 0;
mirror = -1;
isShootable = false;
wallX = 8;
wall = instance_create_depth(x+wallX,y,depth,obj_wall);
with(wall){
	//visible = true;
	image_xscale = 16/16; //the platform's collision box is already 16 px wide so lol
}