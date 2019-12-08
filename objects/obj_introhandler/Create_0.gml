//music
musicBox = instance_create_depth(0,0,0,obj_music_spawner_2);
with(musicBox){
	musicIntro = mus_mm2intronestalgicaIntro;
	musicLoop = mus_mm2intronestalgicaLoop;
}

layer_y(layer_get_id("megaman"),-1000);
layer_y(layer_get_id("royale"),-1000);

//textalign
boxHeight = camera_get_view_height(view_camera[0]) - 60;

//text
textCenter = boxHeight + 20;
textTop = boxHeight + 15;
textBottom = boxHeight + 30;


singleMessage = true;

intromm = instance_nearest(x,y,obj_intromm);

message1 = "OH GOD HELP ME, I CANT STOP CUMMING";
message2 = "ALL OVER MY TV";
kinoY = 170;

logoX = 145-sprite_get_width(spr_logo)/2;
logoY = 10;
drawLogo = false;

startTextX = 145;
startTextY = 155;
playersOnlineTextX = 145;
playersOnlineTextY = 130;
startBottomTextX = 135;
startBottomTextY = 200;

drawStartText = false;
startText = "\nPress start!\n\n\n\n\n\n\nMega Man is property of Capcom\n---This is an unofficial fan game!---";
startBottomText = "\nfollow me at twitter JannyWareInc!";

state = "start";

waitTimer = 60;

textColor = $000000;
msgDurationTimerMax = 4.55 * 60;
msgDurationTimer = 0;
fade1 = 15;
fade2 = 30;
fade3 = 45;

helmetTimer = 60;
teleportTimer = 15;
teleportFlyTimer = 30;
flyY = -16;