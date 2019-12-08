if(updateTimer > 0){
	updateTimer--;
} else {
	updateTimer = updateTimerMax;
	master = ds_map_create();
	//send player location
	if(instance_exists(global.player)){
		var p = ds_map_create();
		p[? "x"] = global.player.x;
		p[? "y"] = global.player.y;
		p[? "s"] = global.player.sliding;
		ds_map_add(p,"h", global.player.hurt);
		ds_map_add(p,"l",global.player.onLadder);
		p[? "r"] = scr_get_room(scr_get_player_room());
		p[? "w"] = global.player.weapon.weaponid;
		p[? "e"] = global.player.dabbing;
		var targetdir;
		if(global.player.lastexternalhspd != 0){
			if(global.player.hspd == 0){
				targetdir = global.player.sideFacing + 10; //face direction in idle anim
			} else {
				if(abs(global.player.hspd) - abs(global.player.externalhspd) > 0){ //if player is faster than the speed
					targetdir = global.player.sideFacing + 3; // face direction moving in run anim
				} else {
					targetdir = global.player.sideFacing + 6; //face opposide of direction moving in run anim
				}
			}
		} else {
			targetdir = global.player.sideFacing;
		}
		p[? "dr"] = targetdir;
		//show_debug_message("first map p = " + string(json_encode(p)));
		ds_map_add_map(master,"p",p);
	}
	if(!ds_map_empty(bullets)){ //bullet create
		//show_debug_message("bullets = " + string(json_encode(bullets)));
		ds_map_add_map(master,"bc",bullets);
	} 
	if(!ds_map_empty(die)){ //die
		//show_debug_message("you died");
		//show_debug_message("bullets = " + string(json_encode(bullets)));
		ds_map_add_map(master,"die",die);
	} 
	if(!ds_map_empty(destroyByIdn)){ //destroy by idn
		//show_debug_message("destroying by idn");
		//show_debug_message("bullets = " + string(json_encode(bullets)));
		ds_map_add_map(master,"dbn",destroyByIdn);
	} 
	if(!ds_map_empty(actionByIdn)){ //destroy by idn
		//show_debug_message("destroying by idn");
		//show_debug_message("bullets = " + string(json_encode(bullets)));
		ds_map_add_map(master,"abn",actionByIdn);
	} 
	if(!ds_map_empty(oth)){ //destroy by idn
		//show_debug_message("destroying by idn");
		//show_debug_message("bullets = " + string(json_encode(bullets)));
		ds_map_add_map(master,"o",oth);
	} 

	if(!ds_map_empty(master) and (global.connected == 1 or emitting)){
		//show_debug_message("last master = " + string(json_encode(master)));
		sio_emit_updateall(master);
	} else {
		//show_debug_message("did not submit");
	}
	
	ds_map_clear(master);
	if(ds_exists(bullets,ds_type_map)){
		ds_map_clear(bullets);
	} else {
		bullets = ds_map_create();
	}
	if(ds_exists(destroyByIdn,ds_type_map)){
		ds_map_clear(destroyByIdn);
	} else {
		destroyByIdn = ds_map_create()
	}
	if(ds_exists(oth,ds_type_map)){
		ds_map_clear(oth);
	} else {
		oth = ds_map_create();
	}
	if(ds_exists(die,ds_type_map)){
		ds_map_clear(die);
	} else {
		die = ds_map_create();
	}
	if(ds_exists(actionByIdn,ds_type_map)){
		ds_map_clear(actionByIdn);
	} else {
		actionByIdn = ds_map_create();
	}
	//bullets = ds_map_create();
	//die = ds_map_create();
	//destroyByIdn = ds_map_create();
	//actionByIdn = ds_map_create();
	
	if(global.connected == 1){
		emitting = true;
	} else {
		emitting = false;
	}
	
}

