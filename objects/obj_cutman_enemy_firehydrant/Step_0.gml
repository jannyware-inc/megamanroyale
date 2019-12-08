centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "sleep";
	dir = startdir;
	return;
}
scr_hurtblink();
if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}

var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	if(visible){
		image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	}
	return;
}
with(obj_remotetimestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	if(visible){
		image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	}
	return;
}


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "sleep"){
	image_index = 2;
	hspd = 0;
	if (sleepTimer > 0){
		if(scr_distanceToPlayer() < attackDistance)
			sleepTimer--;
	else
		sleepTimer = SLEEPTIMERMAX;
 } else {
	sleepTimer = SLEEPTIMERMAX;
	state = "move";
 }
} else if(state == "move"){
	image_index = 0;
	if(!hitwall){
		hspd = lengthdir_x(spd,dir);
		vspd = lengthdir_y(spd,dir);
	} else {
		vspd = 0;
		hspd = 0;
		state = "closeEyes";
		dir += 180; //go back next time
	}
} else if (state == "closeEyes"){
	image_index = 1;
	if(closeEyesTimer > 0){
		closeEyesTimer--;
	} else {
		closeEyesTimer = closeEyesTimerMax;
		state = "sleep";
	}
}
hitwall = 0;
if (place_meeting(x, y+vspd, obj_wall)) {
	_wall = instance_place(x,y+vspd,obj_wall);
	while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
			y += (sign(vspd)*.99);
		}
	hitwall = 1;
	vspd = 0;	
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
	while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
		x += (sign(hspd)*.99);
	}
	hitwall = 1;
	hspd = 0;
}	
x+=hspd;