centerx = x;
centery = y;
if(scr_localfreezeexit()) return;
/// @desc move bullet
if(act == 1){
	x = actx;
	y = acty;
	instance_create_depth(x,y,depth,obj_remotehyperbombexplosion);
	instance_destroy();
	return;
}
if(act == 2){
	x = actx;
	y = acty;
	instance_create_depth(x,y,depth,obj_remotehyperbombmisfire);
	instance_destroy();
	return;
}
if (frames > 0){
	frames--;
} else {
	instance_create_depth(x,y,depth,obj_remotehyperbombexplosion);
	instance_destroy();
}

centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}


//collisions
if(state == "dirGen"){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	state = "fall";
} else if(state == "fall"){
	if(grounded){
		vspd = -lastVspd * bounce;
		hspd = hspd*decel;
	}
	if(wallCollide){
		hspd = -lastHspd * bounce;
	}
	lastHspd = hspd;
	lastVspd = vspd;
}	

vspd+=grav;
grounded = 0;
if (!place_meeting(x,y,obj_wall) and place_meeting(x, y+vspd, obj_wall)) {
	if(vspd >= 0){
		grounded = 1;
	}
	while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
		y += (sign(vspd)*.99);
	}
	vspd = 0;		
	}	
y+=vspd;
wallCollide = 0;
if (!place_meeting(x,y,obj_wall) and place_meeting(x+hspd, y, obj_wall)) {
	wallCollide = 1;
	while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
			x += (sign(hspd)*.99);
		}
		hspd = 0;
	}	
x+=hspd;

if(hspd != 0)
	image_xscale = sign(hspd);
	