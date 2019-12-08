centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView() or !scr_inView()){
	returnx = x;
	returny = y;
	scr_goHome();
	if(scr_inView()){
		x = returnx;
		y = returny;
	}
	state = "dirUp";
	spd = swaySpd;
	dir = startDir;
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


if(hurt == 1 and (state=="dirUp" or state == "dirDown")){
	poofTimer = poofTimerMax;
	state = "poof";
	image_index = 0;
	hurt = 0;
}
scr_hurtblink();


if(state == "dirUp"){
	if(dir > minDir){
		dir -= dirDelta;
	} else {
		state = "dirDown";
	}
}
else if(state == "dirDown"){
	if(dir < maxDir){
		dir += dirDelta;
	} else {
		state = "dirUp";
	}
} else if (state == "poof"){
	hp = hpMax;
	isShootable = false;
	spd = 0;
	if(poofTimer > 0){
		poofTimer--;
	} else {
		state = "attack";
	}
} else if (state == "attack"){
	isShootable = true;
	spd = atkSpd;
	dir = 180;
}

vspd = lengthdir_y(spd,dir);
hspd = lengthdir_x(spd,dir);

y+=vspd;
x+=hspd;


if(state == "dirUp" or state == "dirDown"){
	sprite_index = spr_snakeman_enemy_cloudbullet_cloud;
} else if (state == "poof"){
	sprite_index = spr_snakeman_enemy_cloudbullet_poof;
} else if (state == "attack"){
	sprite_index = spr_snakeman_enemy_cloudbullet_attack;
}