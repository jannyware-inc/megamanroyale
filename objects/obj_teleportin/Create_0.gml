event_inherited();
spd = 1.45;
grav = .3;
zone = -1;
isShootable = false;
invincible = false;
isSolid = false;
damageC = 2;
hp = 1;
ricochet = false;

timer = 0;
state = "teleport1";

teleport3TimerMax = 8;
teleport3Timer = teleport3TimerMax;
teleport2TimerMax = 8;
teleport2Timer = teleport2TimerMax;
vspd = 0;
teleportSpd = 10;

grav = -.3;
aliveFrames = 100;

y = global.player.y - 512;

sprite_index = global.player.sprite_index;

stoppedTimer = false;