centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	instance_destroy();
	return;
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

vspd += grav;

y += vspd;
x += hspd;
if(hspd!=0){
	image_xscale = sign(hspd);
}
rotation += 90/8;
image_angle = floor(rotation/90)*90;