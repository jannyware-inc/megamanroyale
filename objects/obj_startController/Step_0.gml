x+=spd;
with(obj_startmegaman){
	x += other.spd;
}
if(place_meeting(x,y,obj_startControllerReset)){
	x = xstart;
	with(obj_startmegaman){
		x = xstart;
	}
}