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
spd = 1.6;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "shootlow";

attackTimerMax = 60/8*3;
attackTimer=attackTimerMax;
switchTimerMax = 60/4*2;
switchTimer = switchTimerMax;
shotsMax = 5;
shots = shotsMax;

throwVspd = -5;
throwHspd = 1/30;
atkDistance = 220;
throwx = -2;
throwy = -22;

throwTimerMax = 60/8;
throwTimer = throwTimer;

pickaxegrav = .3;