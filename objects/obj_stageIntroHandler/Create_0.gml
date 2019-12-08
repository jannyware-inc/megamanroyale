//create roomplayers
with(obj_roomPlayers){
	instance_destroy();
}
global.roomPlayers = instance_create_depth(0,0,-900,obj_roomPlayers);

with(obj_remotePlayer){
	invisible = false;
	dead = 0;
}
dt = delta_time;
enddt = 520 / 60 * 1000000;

introMusicOld = mus_mm2stageIntro;
introMusic = mus_mm2StageIntroSmash;
bossName = "error";
bossSprite = spr_intro_woodman;

if(global.roomGoto == rm_woodman){
	bossName = "WOOD  MAN";
	bossSprite = spr_intro_woodman;
	introMusicOld = mus_mm2stageIntro;
	introMusic = mus_mm2StageIntroSmash;
} else if (global.roomGoto == rm_snakeman){
	bossName = "SNAKE MAN";
	bossSprite = spr_intro_snakeman;
	introMusicOld = mus_mm3stageIntro;
	introMusic = mus_mm3stageintrodanielaraujo;
} else if (global.roomGoto == rm_topman){
	bossName = "TOP   MAN";
	bossSprite = spr_intro_topman;
	introMusicOld = mus_mm3stageIntro;
	introMusic = mus_mm3stageintrodanielaraujo;
} else if (global.roomGoto == rm_airman){
	if(irandom(40) != 0){
		bossName = "AIR   MAN";
	} else {
		bossName = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
	} 
	bossSprite = spr_intro_airman;
	introMusicOld = mus_mm2stageIntro;
	introMusic = mus_mm2StageIntroSmash;
} else if (global.roomGoto == rm_metalman){
	bossName = "METAL MAN";
	bossSprite = spr_intro_metalman;
	introMusicOld = mus_mm2stageIntro;
	introMusic = mus_mm2StageIntroSmash;
} else if(global.roomGoto == rm_cutman){
	bossName = "CUT   MAN";
	bossSprite = spr_intro_cutman;
	introMusicOld = mus_mm1stageintro;
	introMusic = mus_mm1stageintrocreblestar;
}else if (global.roomGoto == rm_hardman){
	if(irandom(100) != 0){
		bossName = "HARD  MAN";
	} else {
		bossName = "PENIS JOKE MAN GET IT BECAUSE HES HARD LIKE AN ERECT PENIS";
	} 
	bossSprite = spr_intro_hardman;
	introMusicOld = mus_mm3stageIntro;
	introMusic = mus_mm3stageintrodanielaraujo;
} else if (global.roomGoto == rm_crashman){
	if(irandom(1) != 0){
		bossName = "CRASH MAN";
	} else {
		bossName = "CLASH MAN";
	} 
	bossSprite = spr_intro_crashman;
	introMusicOld = mus_mm2stageIntro;
	introMusic = mus_mm2StageIntroSmash;
}


audio_stop_all();
if(global.oldmusic){
	audio_play_sound(introMusicOld,100,0)
} else {
	audio_play_sound(introMusic,100,0);
}

layer_hspeed("bigstar",3);
layer_hspeed("medstar",1.5);
layer_hspeed("smallstar",.5);

blackTimer = 0;
black1 = 50;
black2 = 80;
black3 = 110;
blackFront = 515;
black1Draw = true;
black2Draw = true;
black3Draw = true;


bossX = camera_get_view_width(view_camera[0])/2;
bossY = -120;
bossYSpeed = 3;
bossEndY = camera_get_view_height(view_camera[0])/2-2;

bossIndex = .0001;
bossFramerate = 8/60;
bossWaitTimer = 20;

bossTextX = camera_get_view_width(view_camera[0])/2-30;
bossTextY = camera_get_view_height(view_camera[0])/2+4;

bossNameIndex = 0;
bossNameSpeed = .25;
bossCurrent = "";

endTime = 520;
