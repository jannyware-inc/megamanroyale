//scr_network_emitter_other(opcode,data);
if(instance_exists(global.emitter)){
	with(global.emitter){
		var data = ds_map_create();
		data[? "op"] = argument0;
		data[? "d"] = argument1;
		ds_map_add_map(oth,ds_map_size(oth),data);
	}
} else {
	show_debug_message("There is no emitter object!!");
}