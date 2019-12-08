if(global.oldmusic){
	musicIntro = mus_topmanIntro;
	musicLoop = mus_topmanLoop;
} else {	
	switch(irandom(1)){
		case 0:
			musicIntro = mus_topmanSmashIntro;
			musicLoop = mus_topmanSmashLoop;
			break;
		case 1:
			musicIntro = mus_topmandanielaraujoIntro;
			musicLoop = mus_topmandanielaraujoLoop;
			break;
	}
}
stageMusic = true;