
centerx = x+sprite_width/2;
centery = y+sprite_height/2;
//target = instance_nearest(x, y, obj_player);
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}


if(!scr_inZoneAndView())
	instance_destroy();


	
if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(1);
	instance_destroy();
}
	
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

	
if(scr_freezeexit()) return;
if(scr_distanceToPlayer() > 300){
	return;
}
	
if(state == "deploy"){
	if(deployFrames > 0){
		deployFrames--;
		hspd = deploySpd;
	} else {
		hspd = 0;
		state = "rise";
	}
} else if (state == "rise"){
	if(riseFrames > 0){
		riseFrames--;
		vspd = riseSpd;
	} else {
		vspd = 0;
		state = "attack";
	}
} else if (state == "attack"){
	centerx = x+sprite_width/2;
	centery = y+sprite_height/2
	if (abs(centerx - global.playerCenterx) > abs(centery - global.playerCentery))
					dir = point_direction(centerx,global.playerCentery, global.playerCenterx, global.playerCentery); //flat line left or right
				else
					dir = point_direction(global.playerCenterx,centery, global.playerCenterx, global.playerCentery); //flat line up or down
	len = spd;
	hspd = lengthdir_x(len,dir);
	vspd = lengthdir_y(len,dir);
}
x += hspd;
y += vspd;
