if(instance_exists(global.emitter)){
	if(instance_exists(global.player)){
		with(global.emitter){
			var data = ds_map_create();
			data[? "x"] = global.player.x;
			data[? "y"] = global.player.y;
			data[? "d"] = 1;
			ds_map_add_map(die,ds_map_size(die),data);
		}
	} else {
		show_debug_message("Player doesn't exist!");
	}
} else {
	show_debug_message("There is no emitter object!!");
}