centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "sleep"
	return;
}

scr_hurtblink();
if(hp <= 0){
	scr_dropPickups(3);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
	state = "retreat";
}

if(state == "sleep"){
	hspd = 0;
	vspd = 0;
	if(sleepTimer > 0){
		if(scr_xDistanceToPlayerCentered() < atkDistance){
			sleepTimer--;
		} else {
			sleepTimer = sleepTimerMax;
		}
	} else {
		sleepTimer = sleepTimerMax;
		state = "wakeup";
	}
} else if(state == "wakeup"){
	if(wakeupTimer > 0){
		wakeupTimer--;
	} else {
		wakeupTimer	= wakeupTimerMax;
		state = "attack";
	}
} else if (state == "attack"){
	dir = point_direction(x,y,global.player.x,global.player.y);
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		with(instance_create_depth(x,y,depth+1,obj_snakeman_enemy_projectile)){
			spd = 1.5;
		}
	}
	if(place_meeting(x,y,global.player)){
		state = "retreat";
	}
} else if (state == "retreat"){
	var _wall = instance_place(x,y-1,obj_wall);
	if(_wall != noone and _wall.y < bbox_top){
		state = "sleep";
		hspd = 0;
		vspd = 0;
	} else {
		dir = 90;
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	}
}
grounded = 0;
//collisions
vspd += grav;


y+=vspd;
x+=hspd;

if(state == "sleep"){
	sprite_index = spr_napalm_bat_sleep;
} else if (state == "wakeup"){
	sprite_index = spr_napalm_bat_wakeup;
	if(wakeupTimer > wakeupTimerMax/2){
		image_index = 0;
	} else {
		image_index = 1;
	}
} else if (state == "attack"){
	sprite_index = spr_napalm_bat_fly;
}