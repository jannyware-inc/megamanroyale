if(global.oldmusic){
	switch(irandom(1)){
		case 0:
			musicIntro = mus_mm2stageselectIntro;
			musicLoop = mus_mm2stageselectLoop;
			break;
		case 1:
			musicIntro = mus_mm3stageselect;
			musicLoop = mus_mm3stageselect;
			break;
	}
} else {
	switch(irandom(4)){
		case 0:
			musicIntro = mus_mm2selectMaximZhuavlevIntro;
			musicLoop = mus_mm2selectMaximZhuavlevLoop;
			break;
		case 1:
			musicIntro = mus_mm2quickman130GritSoundStudioIntro;
			musicLoop = mus_mm2quickman130GritSoundStudioLoop;
			break;
		case 2:
			musicIntro = mus_mmxsmandrill130Grit;
			musicLoop = mus_mmxsmandrill130Grit;
			break;
		case 3:
			musicIntro = mus_firemancreblestarIntro;
			musicLoop = mus_firemancreblestarLoop;
			break;
		case 4:
			musicIntro = mus_stoneman130grit;
			musicLoop = mus_stoneman130grit;
			break;
	}
}
stageMusic = true;