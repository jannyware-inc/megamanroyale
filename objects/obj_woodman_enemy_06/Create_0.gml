event_inherited();
state = "wait";

ricochet = 0;
homeY =y;
isShootable = true;
isSolid = false;
invincible = false;
zone = -1;
damageC = 3;
vspd = 0;
hspd = 0;
hurt = 0;
homeY = y;
homeX = x;
swingTimerMax = 132;
swingTimer = swingTimerMax;
swingAtkDist = 60;
wasHurt = 0;
standTimerMax = 60;
standTimer = standTimerMax;

grabTimerMax = 20;
grabTimer = grabTimerMax;

riseSpeed = -3;
hopHspd = 1.5;
hopVspd = -3;
grav = .25;
mirror = 1;
collisionOffsetY = 0;
grounded = 0;
riseDist = 180;

attackTimerMax = 90;
attackTimer = attackTimerMax;
spd = 1.5;
dir = 0;
aRad = 250;


hp = 4;

stopAnimations = false;

player = instance_nearest(x, y, obj_player);


