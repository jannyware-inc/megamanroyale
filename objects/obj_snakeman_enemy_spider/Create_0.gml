event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 1;
damageC = 1;
zone = -1;
hurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = .75;

//timers, etc
state = "moveDown";
moveTimerMax = 140;
moveTimer = moveTimerMax;