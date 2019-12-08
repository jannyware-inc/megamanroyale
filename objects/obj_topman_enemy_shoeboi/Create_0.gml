event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 1;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
spd = .5;
grav = .25;
invincible = false;
//position
vspd = 0;
hspd = 0;
homeY = y;
homeX = x;
sideFacing = scr_playerSideCentered();

//timers, etc
jumpVspd = -5.2;
smallJumpVspd = -3;
jumpHspd = 2;
state = "waitInDist";
atkDistance = 180;
smallHopDistance = 80;
attackTimerMax = 60;
attackTimer = attackTimerMax;

sleep1TimerMax = 5;
sleep1Timer = sleep1TimerMax;
sleep2TimerMax = 55;
sleep2Timer = sleep2TimerMax;