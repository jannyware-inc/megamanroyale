centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "getDir";
	return;
}


if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "getDir"){
	sideFacing = scr_playerSide();
	state = "hover";
} else if(state == "hover"){
	hspd = spd * sideFacing;
	if(scr_distanceToPlayer() < atkDist){
		state = "attack";
		hspd = 0;		
	}
} else if (state == "attack"){
	hspd = 0;
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		state = "flyAway";
		instance_create_depth(x,y+sprite_height/2,depth,obj_snakeman_enemy_pill);
	}
} else if (state == "flyAway"){
	hspd = spd * sideFacing;
}


//turn around if hitting a wall
if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		sideFacing = -sign(sideFacing);
		hspd = spd* sideFacing;
	}	
x+=hspd;

if(sideFacing > 0){
	if(state == "hover"){
		sprite_index = spr_snakeman_enemy_pilldispenserright;
	}
	else if(state == "attack"){
		sprite_index = spr_snakeman_enemy_pilldispenserdrop;
	} else if(state == "flyAway"){
		sprite_index = spr_snakeman_enemy_pilldispenserempty
	}
} else {
	if(state == "hover"){
		sprite_index = spr_snakeman_enemy_pilldispenserleft;
	}
	else if(state == "attack"){
		sprite_index = spr_snakeman_enemy_pilldispenserdrop;
	} else if(state == "flyAway"){
		sprite_index = spr_snakeman_enemy_pilldispenserempty
	}
}