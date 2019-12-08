centerx = x+sprite_width/2;
centery = y+sprite_height/2;
//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneAndView())
	instance_destroy();

if(hp<=0){
	scr_explodeSmall();
	scr_dropPickups(3);
	if(hasEgg){
		if(instance_exists(egg))
			egg.fall = true;
	}
	instance_destroy();
}

if(scr_freezeexit()) return;

x += hspd;
y += vspd;

if(hasEgg){
	with(egg){
		mirror = sign(other.hspd);
		x = other.x;
		y = other.y+other.sprite_height;
	}
}
	
if(hasEgg and scr_distanceToPlayer() < dropDistance){
	hasEgg = false;
	with(egg){
		fall = true;
	}
} 

if(sign(hspd) > 0){
	sprite_index = spr_airman_enemy_birdright;
} else {
	sprite_index = spr_airman_enemy_birdleft;
}