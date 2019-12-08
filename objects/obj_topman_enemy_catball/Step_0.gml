centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else {
	visible = false;
}

if(!scr_inZone()){
	instance_destroy();
}

if(hp <= 0){
	scr_explodeSmall();
	scr_randomDropWeapon(1);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	



if(grounded){
	vspd = bounceVspd;
} 
hspd = spd*sideFacing;

//collisions
vspd += grav;

grounded = 0;
_wall = instance_place(x,y+vspd,obj_wall)
if (_wall != noone and _wall != wall) {
	if(_wall.y > y){
		grounded = 1;
	}
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
	}	
y+=vspd;


_wall = instance_place(x+hspd,y,obj_wall)
if (_wall != noone and _wall != wall) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		sideFacing = -sideFacing;
		hspd = 0;
	}	
x+=hspd;