/// @desc move bullet
show_debug_message("bullet's alive" + string(frames));
centerx = x;
centery = y;
if(scr_localfreezeexit()) return;
len = spd;
hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);
if (frames > 0)
	frames--;
else{
	show_debug_message("deleted cuz no frames");
	ds_map_delete(global.bulletID,ID);
	instance_destroy();
}
if((room == rm_waitingroom or weaponid == 1) and instance_exists(global.player) and !global.player.inNoPvpZone and global.boss == 0 and global.pausePlayer == 0 and global.player.canInput == 1 and place_meeting(x,y,obj_player)){
	scr_hurt(damageC,1);
}

x+= hspd;
y+= vspd;

if(weaponid == 0){
	sprite_index = spr_bullet;
} else if(weaponid == 1){
	sprite_index = spr_metalblade;
}