event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 5;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 1.75;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = 1;
grounded = 0;
attackDistance = 300;
startdir = 0;
dir = startdir;
//timers, etc
state = "sleep";

sleepTimer = SLEEPTIMERMAX;
closeEyesTimerMax = 10;
closeEyesTimer = closeEyesTimerMax;
hitwall = 0;
text = "sample text";