for(i = 0; i < tornados; i++){
	with(instance_create_depth(x,y,depth,obj_airshooter)){
		hspd = other.spdStart + (other.i*other.spdDelta);
		sideFacing = other.sideFacing;
	}
}

//send over network
if(global.connected and networkSent == 0){
	networkSent = 1;
	//sio_emit_bullet_create();
	scr_network_emitter_add_bullet();
}

instance_destroy();