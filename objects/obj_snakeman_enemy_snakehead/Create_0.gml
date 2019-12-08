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
sideFacing = -1;
shootOriginX = x+sprite_width/2;
shootOriginY = y+sprite_height/2;

//timers, etc
atkDistance = 300;
state = "sleep";
sleepTimerMax = 100;
sleepTimer = 30;
blinkTimerMax = 20;
blinkTimer = blinkTimerMax;
shootTimerMax = 20;
shootTimer = shootTimerMax;

image_speed = 0;