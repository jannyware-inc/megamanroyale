if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(destroy){
	scr_playNoOverlap(snd_hardmanrockdestroy);
	instance_create_depth(x+sprite_width/2,y,depth-100,obj_explosionBig);
	instance_create_depth(x+sprite_width/2,y+sprite_height/2,depth-100,obj_explosionBig);
	instance_create_depth(x+sprite_width/2,y+sprite_height,depth-100,obj_explosionBig);
	instance_destroy();
}