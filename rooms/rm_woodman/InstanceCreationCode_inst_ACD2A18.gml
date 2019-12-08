if(random(49)< 48){
	if(global.oldmusic){
		musicIntro = mus_woodmanIntro;
		musicLoop = mus_woodmanLoop;
	} else {
		if(irandom(2)){
			musicIntro = mus_woodmanNestalgicaIntro;
			musicLoop = mus_woodmanNestalgicaLoop;
		} else {
			musicIntro = mus_woodman130gritIntro;
			musicLoop = mus_woodman130gritLoop;
		}
	}
}else {
	musicIntro = mus_mm2wood;
	musicLoop = mus_mm2wood;
}
stageMusic = true;