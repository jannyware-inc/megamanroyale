if(instance_exists(global.emitter)){
	//show_debug_message("idn destroy script ran");
	with(global.emitter){
		var data = ds_map_create();
		data[? "idn"] = other.idn;
		ds_map_add_map(destroyByIdn,ds_map_size(destroyByIdn),data);
	}
} else {
	show_debug_message("There is no emitter object!!");
}