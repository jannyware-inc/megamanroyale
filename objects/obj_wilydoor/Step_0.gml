image_yscale = segments;

if(segments >= maxSegments and global.boss == 2){
	return;
}
if(global.boss == 2){
	closing = 1; 
	opening = 0;
	
	if(segments >= maxSegments){
		openTimer = openTimerMax;
		return;
	}
}

if(segments <= minSegments){
	opening = 0;
	fullyOpened = 1;
}

if(segments >= maxSegments){
	closing = 0;
	fullyOpened = 0;
}
	
if(opening == 1 and global.boss == 0){
	if(openTimer > 0 and segments != maxSegments ){
		openTimer--;
	} else {
		openTimer = openTimerMax;
		segments--;
		audio_play_sound(snd_wilyDoor,10,0);
	}
}

if(fullyOpened){
	player = instance_nearest(x,y,obj_player);
	if(distance_to_point(player.x,player.y) > closeRad){
		closing = 1;
	}
}

if(closing == 1 and opening == 0 and !place_meeting(x,y+sprite_get_height(sprite_index)*(segments+1.5),obj_player)){
	if(openTimer > 0 and segments != minSegments ){
		openTimer--;
	} else {
		openTimer = openTimerMax;
		segments++;
		audio_play_sound(snd_wilyDoor,10,0);
	}
}