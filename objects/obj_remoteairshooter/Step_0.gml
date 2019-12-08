/// @desc move bullet
centerx = x;
centery = y;
if(scr_localfreezeexit()) return;
if (frames > 0)
	frames--;
else
	instance_destroy();
enemy = instance_place(x+hspd,y,obj_enemy);

if(instance_exists(global.player) and !global.player.inNoPvpZone and global.boss == 0 and global.pausePlayer == 0 and global.player.canInput == 1 and place_meeting(x,y,obj_player)){
	scr_hurt(2,1);
}
vspd += grav;
x+= sideFacing*hspd;
y+= vspd;
image_xscale = sideFacing;

