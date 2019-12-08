//target = instance_nearest(x, y, obj_player);
centerx = x;
centery = y;
if(!scr_inZoneOrView())
	instance_destroy();
	
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

scr_hurtblink();
if(hp <= 0){
	scr_dropPickups(1);
	scr_explodeSmall();
	instance_destroy();
}

if(scr_freezeexit()) return;

if(dirgen = false){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	dirgen = true;
}

if (state == "fly"){
	if(aliveFrames > 0){
		aliveFrames--;
		targetdir = point_direction(x,y,global.player.centerx,global.player.centery)%360;
		//show_debug_message("targetdir = " + string(targetdir));
	} else {
		instance_destroy();
	}
	dir = scr_angular_rotation(dir,targetdir,followDirDelta);
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
}
dir = dir%360;
x += hspd;
y += vspd;

switch(round((dir+360)/45)%8){
	case 0:
	case 8:
		sprite_index = spr_napalm_rm_rocket_0;
		image_xscale = -1;
		image_yscale = 1;
		break;
	case 1:
		sprite_index = spr_napalm_rm_rocket_45;
		image_xscale = -1;
		image_yscale = 1;
		break;
	case 2:
		sprite_index = spr_napalm_rm_rocket_90;
		image_xscale = 1;
		image_yscale = 1;
		break;
	case 3:
		sprite_index = spr_napalm_rm_rocket_45;
		image_xscale = 1;
		image_yscale = 1;
		break;
	case 4:
		sprite_index = spr_napalm_rm_rocket_0;
		image_xscale = 1;
		image_yscale = 1;
		break;
	case 5:
		sprite_index = spr_napalm_rm_rocket_45;
		image_xscale = 1;
		image_yscale = -1;
		break;
	case 6:
		sprite_index = spr_napalm_rm_rocket_90;
		image_xscale = 1;
		image_yscale = -1;
		break;
	case 7:
		sprite_index = spr_napalm_rm_rocket_45;
		image_xscale = -1;
		image_yscale = -1;
		break;
}