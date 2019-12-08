event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 3;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 1.6;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "shootlow";

attackTimerMax = 15;
attackTimer=attackTimerMax;
switchTimerMax = 60/4*2;
switchTimer = switchTimerMax;
shotsMax = 3;
shots = shotsMax;

lowShotX = 15;
lowShotY = -14;
lowShotVspd = -1;
lowShotHspd = 2.75;

highShotX = 12;
highShotY = -25;
highShotVspd = -4;
highShotHspd = 1;
