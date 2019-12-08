event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 8;
damageC = 4;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
sideFacing = -1;

//timers, etc
eyeOpen = false;
swingTimerMax = 40;
swingTimer = swingTimerMax;
swingEyeTimerMax = 30;
swingEyeTimer = swingEyeTimerMax;
attackTimerMax = 30;
attackTimer = attackTimerMax;
eyeX = 0;//gets set later
eyeY = 19;
eyeSprite = spr_snakeman_enemy_shotputguyeyeright;
rightSpriteOffsetX = -23;
state = "waitInView";
jumpvspd = -3.3;
bigjumpvspd = -8;
throwOffsetY = 16;