//target = instance_nearest(x, y, obj_player);
centerx = x;
centery = y;
if(!scr_inZoneOrView())
	instance_destroy();

if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
	
if(!turned and ((hspd < 0 and x <= global.player.x - turnarounddistance) or (hspd > 0 and x >= global.player.x + turnarounddistance))){
	turned = true;
	state = "turnaround";
}

if(state == "move"){
	if(!dirgen){
		dirgen = true;
		dir = point_direction(x,y,global.player.centerx,global.player.y-12);
		hspd = lengthdir_x(spd,dir);
		vspd = lengthdir_y(spd,dir);
	}
} if(state == "turnaround"){
	vspd = 0;
	hspd = 0;
	if(turnaroundTimer > 0){
		turnaroundTimer--;
	} else {
		dirgen = false;
		state = "move";	
	}
}

x += hspd;
y += vspd;


if(state == "turnaround"){
	image_index = 1;
} else {
	if(hspd!=0){
		image_xscale = -sign(hspd);
	}
	image_index = 0;
}