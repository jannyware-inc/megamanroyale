get_input();
msgLength = string_length(dialogue[msgIndex]);
msgCurrent = string_copy(dialogue[msgIndex], 1, ltrIndex);
ltrCurrent = string_copy(dialogue[msgIndex], ltrIndex-1, 1);

//check if last letter in index, sets timer to 0
if(msgLength <= ltrIndex){
	ltrTimer = 0;
	ltrNext = 2;
	sndSpeedIndex = 1;
} 

//ltrnext 0 if advance to next character, 1 if wait for timer, 2 if wait for actkey to advance
if (ltrNext == 0){
	switch(ltrCurrent){
		case ".":
		case "!":
		ltrTimer = 5;
		ltrNext = 1;
		break;	
		case ",":
		ltrTimer = 3;
		ltrNext = 1;
		break;	
	}
			
		
	if(sndSpeedIndex <= 0){
		audio_sound_pitch(audio_play_sound(ltrSnd,10,0),.9+random(.2));
		sndSpeedIndex = 1;
	}else{
		sndSpeedIndex -= ltrSpeed
	}
	ltrIndex += ltrSpeed;
} else if (ltrNext == 1){
	//show_debug_message("ltrTimer = " + string(ltrTimer) + " ltrSpeed = " + string(ltrSpeed));
	if (ltrTimer > 0)
		ltrTimer -= ltrSpeed;
	else{
	ltrNext = 0;
	ltrTimer = 0;
	ltrIndex++;
	}
} else if (ltrNext == 2){
	if(actKeyPress){
		if(msgIndex >= array_length_1d(dialogue)-1) {
			instance_destroy();
		}else{
		msgIndex++;
		ltrIndex = 0;
		ltrNext = 0;
		}
	}
}
