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
scr_hurtblink();

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "waitInView"){
	if(scr_inView()){
		state = "dirGen";
	}
}
else if(state == "dirGen"){
	ricochet = true;
	sideFacing = scr_playerSide();
	hspd = spd * sideFacing;
	state = "run";
} else if (state == "run"){
	hspd = spd * sideFacing;
	if(scr_distanceToPlayer() < atkDistance){
		sideFacing = scr_playerSide();
		state = "vault";
		image_index = 0;
	}
}else if(state == "vault"){
	hspd = 0;
	if(vaultTimer > 0){
		vaultTimer--;
	} else {
		vaultTimer = vaultTimerMax;
		vspd = jumpvspd;
		state = "jump";
		image_index = 0;
		broom = instance_create_depth(x,y-4,depth,obj_snakeman_enemy_broom);
		with(broom){
			sideFacing = other.sideFacing;
		}
		grounded = 0;
	}
} else if (state == "jump"){
	ricochet = false;
	hspd = spd * sideFacing;
	if(grounded){
		state = "land";
	}
} else if (state == "land"){
	hspd = 0;
	if(landTimer > 0){
		landTimer--;
	} else {
		landTimer = landTimerMax;
		sideFacing = scr_playerSide();
		hspd = spd * sideFacing;
		state = "runGround";
	}
} else if (state == "runGround"){
	hspd = spd * sideFacing;
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
		sideFacing = -sign(sideFacing);
		hspd = spd * sideFacing;
	}	
x+=hspd;

if(sideFacing > 0){
	if(state == "runGround"){
		sprite_index = spr_snakeman_enemy_broombotgroundrunright;
	} else if (state == "dirGen" or state == "run") {
		sprite_index = spr_snakeman_enemy_broombotrunright;
	} else if (state == "jump") {
		sprite_index = spr_snakeman_enemy_broombotjumpright;
	} else if (state == "vault"){
		sprite_index = spr_snakeman_enemy_broombotvaultright;
	} else if (state == "land"){
		sprite_index = spr_snakeman_enemy_broombotgroundrunright;
		image_index = 1;
	}
} else {
	if(state == "runGround"){
		sprite_index = spr_snakeman_enemy_broombotgroundrunleft;
	} else if (state == "dirGen" or state == "run") {
		sprite_index = spr_snakeman_enemy_broombotrunleft;
	} else if (state == "jump") {
		sprite_index = spr_snakeman_enemy_broombotjumpleft;
	} else if (state == "vault"){
		sprite_index = spr_snakeman_enemy_broombotvaultleft;
	} else if (state == "land"){
		sprite_index = spr_snakeman_enemy_broombotgroundrunleft;
		image_index = 1;
	}
}