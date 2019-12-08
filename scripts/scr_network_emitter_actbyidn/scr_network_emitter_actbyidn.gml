//scr_network_emitter_actionbyidn(action)  
if(instance_exists(global.emitter)){
	//show_debug_message("idn destroy script ran");
	with(global.emitter){
		var data = ds_map_create();
		data[? "idn"] = other.idn;
		data[? "x"] = other.x;
		data[? "y"] = other.y;
		data[? "act"] = argument0;
		ds_map_add_map(actionByIdn,ds_map_size(actionByIdn),data);
	}
} else {
	show_debug_message("There is no emitter object!!");
}