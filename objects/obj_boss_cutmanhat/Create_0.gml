event_inherited();
spd = 3;
zone = -1;

isShootable = false;
isSolid = false;
damageC = 4;
dir = point_direction(x,y,global.player.centerx,global.player.centery);
throwTimer = 50;
//aliveFrames = 240;
targetdir = 0;
followDirDelta = 30;
returnrad = 2;
damageC = 3;
dirgen = false;
state = "throw";
audio_play_sound(snd_cutmanhat,50,true);
magnet = instance_nearest(x,y,obj_boss_cutmanhatmagnet);