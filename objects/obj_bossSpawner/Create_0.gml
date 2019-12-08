boss = obj_enemy; //set obj with creation code
stoppedMusic = 0;
boss1queue = 0;
youWin = 0;
youWinQueue = 0;
bossInstance = noone;
zone = -1;
midboss = false;
midbossdefeated = false;

if(global.oldmusic){
	musicIntro = mus_mm2bossIntro;
	musicLoop = mus_mm2bossLoop;
	musicVictory = mus_mm2victory;
} else {
	musicIntro = mus_mm2bossNestalgicaIntro;
	musicLoop = mus_mm2bossNestalgicaLoop;
	musicVictory = mus_mm2victory;
}

waitTimer = 60;

textTimerMax = 60;
textTimer = 60;
drawSpectateMessage = false;

camW = camera_get_view_width(view_camera[0]);
camH = camera_get_view_height(view_camera[0]);
