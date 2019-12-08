//target = instance_nearest(x, y, obj_player);
centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inView()){
	instance_destroy();	
}

if (scatter and !scatterDirGen){
	dir = -20+random(240);
	vspd = lengthdir_y(spd,dir);
	hspd = lengthdir_x(spd,dir);
	scatterDirGen = true;
}

if(hp <= 0){	
	scr_explodeSmall();
	scr_dropPickups(1);
	instance_destroy();
}
if(scr_freezeexit()) return;

if(!scr_inZoneOrView())
	instance_destroy();
	
if(place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
}
	
if(scatter and scatterFrames > 0){
	scatterFrames--;
} else {
	if(!targetDirGen){
		dir = point_direction(x+sprite_width/2,y+sprite_height/2,global.playerCenterx,global.playerCentery);
		vspd = lengthdir_y(spd,dir);
		hspd = lengthdir_x(spd,dir);
		targetDirGen = true;
	}
}
x += hspd;
y += vspd;

if(hspd < 0){
	sprite_index = spr_airman_enemy_hatchlingleft;
} else {
	sprite_index = spr_airman_enemy_hatchlingright;
}