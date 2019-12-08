centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "free" or state == "bounce"){
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
			hspd = 0;
			if(state == "free"){
				state = "bounce";
				vspd = bounceVspd;
			} else {
				scr_explodeSmall();
				y = -9999;
				state = "notfree";
			}
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
}
