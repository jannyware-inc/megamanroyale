centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inView()){
	state = "switchup";
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


if(state == "switchup"){
	sideFacing = scr_playerSideCentered();
	ricochet = true;
	if(scr_xDistanceToPlayerCentered() < atkDistance){
		if(switchTimer > 0){
			switchTimer--;
		} else {
			switchTimer = switchTimerMax;
			state = "throw1";
			throwTimer = throwTimerMax;
		}
	}
} else if(state == "throw1"){
	sideFacing = scr_playerSideCentered();
	ricochet = true;
	if(throwTimer > 0){
		throwTimer--;
	} else {
		throwTimer = throwTimerMax;
		state = "throw2";
	}
} else if(state == "throw2"){
	sideFacing = scr_playerSideCentered();
	ricochet = false;
	if(throwTimer > 0){
		throwTimer--;
	} else {
		throwTimer = throwTimerMax;
		state = "throw3";
		with(instance_create_depth(x+throwx*sideFacing,y+throwy,depth+1,obj_gutsman_pickaxe)){
				hspd = other.throwHspd * scr_xDistanceToPlayerCentered() * other.sideFacing;
				vspd = other.throwVspd;
				grav = other.pickaxegrav;
		}
	}
} else if(state == "throw3"){
	sideFacing = scr_playerSideCentered();
	ricochet = false;
	if(throwTimer > 0){
		throwTimer--;
	} else {
		throwTimer = throwTimerMax;
		if(shots > 1){
			shots--;
			state = "throw1";
		} else {
			shots = shotsMax;
			state = "switchup";
		}
	}
}



image_xscale = -sideFacing;
switch(state){
	case "throw1":
		sprite_index = spr_gutsman_pickleman;
		image_index = 0;
		break;
	case "throw2":
		sprite_index = spr_gutsman_pickleman;
		image_index = 1;
		break
	case "throw3":
		sprite_index = spr_gutsman_pickleman;
		image_index = 2;
		break
	case "switchup":
		sprite_index = spr_gutsman_pickleman;
		image_index = 0;
		break;
}