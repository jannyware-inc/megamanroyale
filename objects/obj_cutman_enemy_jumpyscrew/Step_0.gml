centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView() and state == "idle"){
	scr_goHome();
	state = "idle"
	return;
}


if(hp <= 0){
	scr_dropPickups(3);
	scr_explodeSmall();
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

if(state == "idle"){
	hspd = 0;
	if(idleTimer > 0){
		idleTimer--;
	} else {
		idleTimer = idleTimerMax;
		state = "jump";
		vspd = jumpVspd;
		switch(irandom(3)){
			case 0:
				jumpHspd = scr_playerSideCentered() * .5;
				break;
			case 1:
				jumpHspd = scr_playerSideCentered() * 1.2;
				break;
			case 2:
				jumpHspd = scr_playerSideCentered() * 1.5;
				break;
		}
	}
} else if(state == "jump"){
	if(grounded){
		state = "idle";
		hspd = 0;
	} else {
		hspd = jumpHspd;
	}
}
grounded = 0;
//collisions
vspd += grav;

if (place_meeting(x, y+vspd, obj_wall)) {
	_wall = instance_place(x,y+vspd,obj_wall)
	if(_wall.y > y)
		grounded = 1;
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
		
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
	}	
x+=hspd;

if(state == "idle"){
	image_index = 0;
} else if (state == "jump"){
	image_index = 1;
}