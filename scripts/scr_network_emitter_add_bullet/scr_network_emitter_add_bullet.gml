if(instance_exists(global.emitter)){
	with(global.emitter){
		var data = ds_map_create();
		data[? "x"] = other.x;
		data[? "y"] = other.y;
		data[? "dir"] = other.dir;
		data[? "w"] = other.weaponid;
		data[? "f"] = other.frames;
		data[? "s"] = other.spd;
		//data[? "id"] = other.ID;
		data[? "idn"] = other.idn;
		//show_debug_message("prebullet = " + string(json_encode(data)));
		//ds_list_add(bullets,data);
		ds_map_add_map(bullets,ds_map_size(bullets),data);
	}
} else {
	show_debug_message("There is no emitter object!!");
}