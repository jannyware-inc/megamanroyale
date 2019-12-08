//target = instance_nearest(x, y, obj_player);
centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inZoneAndView()){
	instance_destroy();	
}

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(1);
	instance_destroy();
}
if(scr_freezeexit()) return;

	
if(place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
}
	
if(scatter and scatterFrames > 0){
	scatterFrames--;
	vspd = scatterVspd;
	hspd = 0;
} else {
	targetdir = point_direction(x+sprite_width/2,y+sprite_height/2,global.player.centerx,global.player.centery);
	dir = scr_angular_rotation(dir,targetdir,maxRads);
	vspd = lengthdir_y(spd,dir);
	hspd = lengthdir_x(spd,dir);
}
x += hspd;
y += vspd;

if(hspd != 0){
	image_xscale = -sign(hspd);
} else {
	image_xscale = -scr_playerSideCentered();
}