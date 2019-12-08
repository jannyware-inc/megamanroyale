centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "roam";
	return;
}

if(hp <= 0){
	if(instance_exists(grounder)){
		instance_destroy(grounder);
	}
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}
if(scr_freezeexit()) return;


if (place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
	if(state != "bounce"){
		image_index = 0;
		state = "bounce";
	}
}

if(state == "roam"){
	groundergrounded = false;
	with(grounder){
		y = other.y;
		x = other.x + other.grounderOffsetX * other.sideFacing;
		other.groundergrounded = place_meeting(x,y,obj_wall);
	}
	if(!groundergrounded){
		sideFacing = -sideFacing;
	}
	if(abs(global.player.y - y) < attackY){
		spd = aggrospd;
	} else {
		spd = notaggrospd;
	}
	if(place_meeting(x+abs(hspd)*sideFacing,y,obj_wall)){
		sideFacing = -sideFacing;
	}
	hspd = spd*sideFacing;
	x+=hspd;
} else if (state == "bounce"){
	if(bounceTimer > 0){
		bounceTimer--;
	} else {
		bounceTimer = bounceTimerMax;
		if(bounces > 0){
			bounces--;
			sideFacing = -sideFacing;
		} else {
			state = "roam";
			bounces = bouncesMax;
		}
	}
}


image_xscale = -sideFacing;

if(state == "roam"){
	sprite_index = spr_metalman_enemy_roomba;
} else if (state == "bounce"){
	sprite_index = spr_metalman_enemy_roombabounce;
}