centerx = x;
centery = y-sprite_height/2;
if(scr_freezeexit()) return;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}


if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(4);
	instance_destroy();
}


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(!instance_exists(gear)){
	vspd += .3;
	y += vspd;
	if(!scr_inView){
		instance_destroy();
	}
}