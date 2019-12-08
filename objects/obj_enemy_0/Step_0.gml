

if(distance_to_object(target) <= aRad){
	dir = point_direction(x,y,target.centerx,target.centery);
	len = spd;
	hspd = lengthdir_x(len,dir);
	vspd = lengthdir_y(len,dir);
	x += hspd;
	y += vspd;
}