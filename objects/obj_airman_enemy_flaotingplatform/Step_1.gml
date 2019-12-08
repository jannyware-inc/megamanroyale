if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

//floating platform
dir += degPerFrame;
hspd = lengthdir_x(spd,dir);
vspd = lengthdir_y(spd,dir);
mirror= sign(hspd);

_pickup = instance_place(x,y-3,obj_pickup);

if(global.player.y <= y+1.1){
	wall.x = x+wallX;
	wall.y = y;
} else {
	//fk outta here shadow realm
	wall.x = -9999;
	wall.y = -9999;
}

y+=vspd;
x+=hspd;

if(_pickup != noone and instance_exists(_pickup)){
	_pickup.hspd = 0;
	_pickup.vspd = -_pickup.grav;
	_pickup.y = y;
	_pickup.x += hspd;
	//_pickup.grav = 0;
}

wall.x = x+wallX;
wall.y = y;





_wallCollis = false;

	with(wall){
		other._wallCollis = place_meeting(x,y-3.6,obj_player);
	}


if(_wallCollis == true){
	//show_debug_message("moving");
	global.player.y = wall.y-1.5;
	global.player.externalhspd += hspd;
	//global.player.grounded = true;
} 




if(mirror > 0){
	sprite_index = spr_airman_enemy_floatingplatform;
} else {
	sprite_index = spr_airman_enemy_floatingplatformmirror;
}