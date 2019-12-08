centerx = x;
centery = y+8;

collider.x = centerx;
collider.y = centery;

if(state == "move"){
	_crashdir = noone;
	with(collider){
		//show_debug_message("collidery = " + string(y));
		other._crashdir = instance_place(x,y,obj_crashman_crashdir);
	}

	if(_crashdir != noone){
		//show_debug_message("collided");
		dir = _crashdir.dir;
	}
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
} 


if(global.player.y <= y){
	mask_index = spr_crashman_platform;
} else {
	mask_index = spr_mask_empty;
}

y+=vspd;
x+=hspd;

if(place_meeting(x,y-2.5-abs(vspd),obj_player)){
	_y = global.player.y;
	_x = global.player.x;
	
	global.player.y = y-1.5;
	global.player.externalhspd += hspd;
	_pCollide = false;
	with(global.player){
		_wallfp = instance_place(x,y+.4998,obj_wall);
		if(_wallfp != noone){
			other._pCollide = true;
		}
	}
	if(_pCollide){
		//global.player.x = _x;
		global.player.y = _y;
		mask_index = spr_mask_empty;
	} else {
		
	}
}