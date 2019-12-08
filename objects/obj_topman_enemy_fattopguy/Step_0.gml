centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "sideGen";
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

if(instance_number(obj_topman_enemy_fattopguytop) > 2){
	chargeTimer = chargeTimerMax;
}

if(state == "sideGen"){
	sideFacing = scr_playerSideCentered();
	state = "charge";
} else if(state == "charge"){
	if(chargeTimer > 0){
		chargeTimer--;
	} else {
		chargeTimer=chargeTimerMax;
		state = "attack";
		with(instance_create_depth(x,y-4,depth-1,obj_topman_enemy_fattopguytop)){
			sideFacing = other.sideFacing;
			zone = other.zone;
		}
	}
} else if(state == "attack"){
	hspd = spd * sideFacing;
	if(attackTimer > 0){
		attackTimer--;
	} else {	
		attackTimer = attackTimerMax;
		state = "charge";
	}
} 


image_xscale = sideFacing;
switch(state){
	case "charge":
		sprite_index = spr_topman_enemy_fattopguycharge;
		break;
	case "attack":
		sprite_index = spr_topman_enemy_fattopguyshoot;
		break;
}