centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "squat1";
	return;
}

scr_hurtblink();

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(5);
	instance_destroy();
}

if(scr_freezeexit()) return;


if (place_meeting(x,y,global.player))
	scr_hurt(damageC,0);

vspd += grav;


//player distance checking
if(distance_to_object(obj_player) < aRad){
	if(state == "squat1"){
		if(squatTimer > 0){
			squatTimer--;
		}else{
			mirror = -sign(player.x - x);
			squatTimer = squatTimerMax;
			//jump
			vspd = hopVspd;
			hopHspd = abs(hopHspd) * sign(player.x - x);
			hspd = hopHspd;
			state = "hop";
			grounded = 0;
		}
	} else if (state == "hop"){
		hspd = hopHspd;
		//hopping
		if (grounded == 1){
			mirror = -sign(player.x - x);
			state = "squat2";
		}	
	} else if(state == "squat2"){
		if(squatTimer > 0){
			squatTimer--;
		}else{
			squatTimer = squatTimerMax;
			state = "attack";
			grounded = 0;
		}
	} else if(state == "attack"){
		if(attackTimer > 0){
			attackTimer--;
		}else{
			attackTimer = attackTimerMax;
			if(carrots > 0){
				mirror = -sign(player.x - x);
				carrots--;
				//shoot
				
				carrot = instance_create_depth(x+16,y+18,100,obj_woodman_enemy_04_carrot);
				with(carrot){
					dir = point_direction(x+sprite_width/2,y+sprite_width/2+3,player.centerx, player.centery);
					hspd = lengthdir_x(spd,dir);
					vspd = lengthdir_y(spd,dir);
					zone = other.zone;
				}
			} else {
				carrots = carrotsMax;
				state = "squat1";
			}
		}
	}
}

if (place_meeting(x, y+vspd, obj_wall)) {
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
		hspd = 0;
		grounded = 1;
	}	
y+=vspd;

if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
	}	
x+=hspd;


if(mirror > 0){
	sprite_index = spr_woodman_enemy_04;
} else {
	sprite_index = spr_woodman_enemy_04_mirror;
}

if(state == "squat1" or state == "squat2"){
	image_index = 2;
} else if (state == "hop") {
	image_index = 1;
} else if (state == "attack") {
	image_index = 0;
}
