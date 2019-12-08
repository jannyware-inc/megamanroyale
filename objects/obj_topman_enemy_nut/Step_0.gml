centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else {
	visible = false;
}

if(!scr_inZoneAndView()){
	scr_goHome();
	state = "waitInDist"
	screwTimer = screwTimerMax;
	nutlTimer = nutlTimerMax;
	return;
}
scr_hurtblink();

if(hp <= 0){
	scr_dropPickups(3);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

switch(state){
	case "waitInDist":
		visible = false;
		if(scr_distanceToPlayer() < screwDistance){
			state = "nutl";
		}
		break;
	case "nutl":
		ricochet = true;
		if(nutlTimer > 0){
			nutlTimer--;
			visible = nutlTimer%6 < 3;
		} else {
			nutlTimer = nutlTimerMax;
			audio_play_sound(snd_boltclick,10,0);
			state = "screw";
			image_index = 0;
			visible = true;
		}
		nutldistance = lerp(x+nutldistanceStart,x-12,(nutlTimerMax-nutlTimer)/nutlTimerMax);
		//show_debug_message(string(nutldistance) + ":   " + string((nutlTimerMax-nutlTimer)/nutlTimerMax));
		break;
	case "screw":
		if(screwTimer > 0){
			screwTimer--;
		} else {
			screwTimer = screwTimerMax;
			state = "attack";
			ricochet = false;
		}
		break;
	case "attack":
		_dir = point_direction(x,y,global.playerCenterx,global.playerCentery);
		x+= lengthdir_x(spd,_dir);
		y+= lengthdir_y(spd,_dir);
}

if(instance_exists(nutl)){
	with(nutl){
		if(other.state == "nutl"){
			visible = true;
		} else {
			visible = false;
		}
		y = other.y;
		x = other.nutldistance;
	}
}

switch(state){
	case "nutl":
		sprite_index = spr_topman_enemy_nutr;
		break;
	case "screw":
		sprite_index = spr_topman_enemy_nutspin;
		break;
	case "attack":
		sprite_index = spr_topman_enemy_nut;
		break;
}