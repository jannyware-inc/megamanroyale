event_inherited();
spd = 3;

damageC = 4;
dir = 0
throwTimer = 25;
aliveFrames = 240;

attackTimerMax = 5;
attackTimer = 0;
targetdir = 0;
followDirDeltaFar = 4;
followDirDeltaNear = 8;
followDirDelta = followDirDeltaFar;
returnrad = 2;
damageC = 3;
dirgen = false;
state = "throw";
audio_play_sound(snd_cutmanhat,50,true);

//idn = global.bulletIDNum++;
networkSent = 0;
weaponid = 8;

actTimerMax = 10;
actTimer = 0;