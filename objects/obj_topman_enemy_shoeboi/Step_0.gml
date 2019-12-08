centerx = x;
centery = y-8;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "waitInDist"
	return;
}
scr_hurtblink();

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}
if(scr_freezeexit()) return;


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

switch(state){
	case "waitInDist":
		if(scr_distanceToPlayer() < atkDistance){
			sprite_index = spr_topman_enemy_shoeboijump;
			if(!place_meeting(x,y,obj_wall)){
				state = "jump";
				sideFacing = scr_playerSideCentered();
				grounded = 0;
				if(scr_distanceToPlayer() < smallHopDistance){
					vspd = smallJumpVspd;
				} else {
					vspd = jumpVspd;
				}
				hspd = jumpHspd * sideFacing;
			} else {
				sprite_index = spr_topman_enemy_shoeboiwait;
				state = "sleep2";
			}
		}
		break;
	case "jump":
		hspd = jumpHspd * sideFacing;
		if(grounded){
			state = "sleep1";
			hspd = 0;
		}
		break;
	case "sleep1":
		if(sleep1Timer > 0){
			sleep1Timer--;
		} else {
			state = "sleep2";
			sleep1Timer = sleep1TimerMax;
		}
		break;
	case "sleep2":
		if(sleep2Timer > 0){
			sleep2Timer--;
		} else {
			state = "waitInDist";
			sleep2Timer = sleep2TimerMax;
		}
		break;
}

//collisions

vspd += grav;
if(state == "jump"){
	
	_wall = instance_place(x,y+vspd,obj_wall);
	if (_wall != noone) {
				while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
					y += (sign(vspd)*.99);
				}
			vspd = 0;
		}	
		
	_wall = instance_place(x,y+vspd+16,obj_wall);
	if (_wall != noone) {
			
				while(!place_meeting(x, y+(sign(vspd)*.99)+16, obj_wall)) {
					y += (sign(vspd)*.99)+16;
				}
			
			if(vspd >= 0){
				grounded = 1;
				vspd = 0;
				y = _wall.y-.51;
			}
		}	
	y+=vspd;


	if (place_meeting(x+hspd, y, obj_wall)) {
				while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
					x += (sign(hspd)*.99);
				}
			hspd = 0;
		}	
	x+=hspd;
}

image_xscale = sideFacing;

switch(state){
	case "waitInDist":
	case "sleep2":
		sprite_index = spr_topman_enemy_shoeboiwait;
		image_index = 1;
		break;
	case "sleep1":
		sprite_index = spr_topman_enemy_shoeboiwait;
		image_index = 0;
		break;
	case "jump":
		sprite_index = spr_topman_enemy_shoeboijump;
		image_index = 0;
		break;
}