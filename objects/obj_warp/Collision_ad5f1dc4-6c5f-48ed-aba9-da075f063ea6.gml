/// @desc Fadeout to next room
if (active == 0){
	player = instance_nearest(x,y,obj_player)
	if xx = "px"
		xx = player.x;
	if yy = "py"
		yy = player.y;
	fadeout(target, c_black, 0.05, xx, yy);
	active = 1;
}