for(i = 0; i < tornados; i++){
	with(instance_create_depth(x,y,depth,obj_remoteairshooter)){
		hspd = other.spdStart + (other.i*other.spdDelta);
		sideFacing = other.sideFacing;
	}
}

instance_destroy();