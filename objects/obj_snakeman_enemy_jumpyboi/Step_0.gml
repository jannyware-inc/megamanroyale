centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "waitInView"
	return;
}


if(hp <= 0){
	scr_dropPickups(3);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "waitInView"){
	if(scr_inView()){
		state = "jump1";
	}
}
else if(state == "jump1"){
	hspd = spd * sideFacing;
	if(grounded){
		state = "jump2";
		vspd = jumpvspd;
		grounded = 0;
	}
} else if (state == "jump2"){
	hspd = spd * sideFacing;
	if(grounded){
		sideFacing = scr_playerSide();
		state = "bigjump";
		vspd = bigjumpvspd;
		grounded = 0;
	}
} else if (state == "bigjump"){
	hspd = spd * sideFacing;
	if(grounded){
		state = "jump1";
		vspd = jumpvspd;
		grounded = 0;
	}
}

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

if(sideFacing > 0){
	sprite_index = spr_snakeman_enemy_jumpyboiright;
} else {
	sprite_index = spr_snakeman_enemy_jumpyboileft;
}