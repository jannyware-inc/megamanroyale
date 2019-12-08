if(random(49)< 48){
	if(global.oldmusic){
		musicIntro = mus_crashmanIntro;
		musicLoop = mus_crashmanLoop;
	} else {
		musicIntro = mus_crashmannestalgica;
		musicLoop = mus_crashmannestalgica;
	}
}else {
	musicIntro = mus_crashmanthereal;
	musicLoop = mus_crashmanthereal;
}
stageMusic = true;