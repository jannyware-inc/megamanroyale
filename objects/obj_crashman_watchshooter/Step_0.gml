centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inView()){
	state = "shootlow";
	shots = shotsMax;
	return;
}

scr_hurtblink();

if(hp <= 0){
	scr_dropPickups(5);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);


if(state == "shootlow"){
	image_speed = 1;
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		if(shots > 0){
			shots--;
			//shoot
			scr_playNoOverlap(snd_watchshoot);
			with(instance_create_depth(x+lowShotX*sideFacing,y+lowShotY,depth+1,obj_crashman_watchshot)){
				hspd = other.lowShotHspd * other.sideFacing;
				vspd = other.lowShotVspd;
			}
		} else {
			image_index = 0;
			shots = shotsMax;
			state = "switchup";
		}
	}
} else if(state == "switchup"){
	if(switchTimer > 0){
		switchTimer--;
	} else {
		switchTimer=switchTimerMax;
		state = "shoothigh";
	}
} else if(state == "shoothigh"){
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		if(shots > 0){
			shots--;
			//shoot
			scr_playNoOverlap(snd_watchshoot);
			with(instance_create_depth(x+highShotX*sideFacing,y+highShotY,depth+1,obj_crashman_watchshot)){
				hspd = other.highShotHspd * other.sideFacing;
				vspd = other.highShotVspd;
			}
		} else {
			shots = shotsMax;
			state = "switchdown";
			//image_index = .95;
			image_speed = -1;
		}
	}
} else if(state == "switchdown"){
	image_speed = 1;
	if(switchTimer > 0){
		switchTimer--;
	} else {
		switchTimer=switchTimerMax;
		state = "shootlow";
	}
}


image_xscale = -sideFacing;
switch(state){
	case "shootlow":
		sprite_index = spr_crashman_watchshooter_low;
		break;
	case "shoothigh":
		sprite_index = spr_crashman_watchshooter_high;
		break;
	case "switchdown":
	case "switchup":
		sprite_index = spr_crashman_watchshooter_switch;
		break;
}