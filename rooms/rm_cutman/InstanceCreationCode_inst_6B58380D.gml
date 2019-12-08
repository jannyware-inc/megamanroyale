boss = obj_boss_cutman;

zone = 13;

if(global.oldmusic){
	musicIntro = mus_mm1bossIntro;
	musicLoop = mus_mm1bossLoop;
	musicVictory = mus_mm1victory;
} else {
	musicIntro = mus_mm1bosscreblestarIntro;
	musicLoop = mus_mm1bosscreblestarLoop;
	musicVictory = mus_mm1victory;
}