event_inherited();
//enemy Flags
isShootable = true;
ricochet = true;
hp = 3;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 2;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;

//timers, etc
atkDistance = 50;
state = "waitInView";
vaultTimerMax = 15;
vaultTimer = vaultTimerMax;
jumpvspd = -7.5;
landTimerMax = 10;
landTimer = landTimerMax;