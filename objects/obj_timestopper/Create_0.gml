get_input();

spdStart = .75;
spdDelta = .75;
weaponid = 7;
sideFacing = 1;
networkSent = 0;
frames = 4*60;
lastscale = -1;
//fx
sparkTimerMax = 5;
sparkTimer = 0;
behind_surface = noone;
dir = 0;

rad = 0;
radMax = 125;
radInc = 5;
/*
zawarudo = (irandom(30) == 0);
zawarudo = true;
*/
zawarudo = (lKey and rKey and uKey);
scr_playNoOverlap(mus_ticktock);

idn = global.bulletIDNum++;
networkSent = 0;
weaponid = 7;