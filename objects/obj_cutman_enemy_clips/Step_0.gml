centerx = x;
centery = y-sprite_height/2;
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

var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	return;
}
with(obj_remotetimestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	return;
}


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

vspd += grav;
x+=hspd;
y+=vspd;
sideFacing = -sign(hspd);
image_xscale = sideFacing;