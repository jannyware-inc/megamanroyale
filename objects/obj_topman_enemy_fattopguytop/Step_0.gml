centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	instance_destroy();
	visible = false;
}


if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(1);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(aliveFrames > 0){
	aliveFrames--;
} else {
	scr_explodeSmall();
	instance_destroy();
}

if(aliveFrames - blinkFrames < 0){
	visible = (aliveFrames % 4 < 2);
}

if(grounded){
	vspd = 0;
	hspd = spd*sideFacing;
} else {
	hspd = 0;
}

//collisions
vspd += grav;

grounded = 0;
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
		sideFacing = -sideFacing;
		hspd = 0;
	}	
x+=hspd;

if(place_meeting(x,y,obj_topman_topkiller)){
	scr_explodeSmall();
	instance_destroy();
}