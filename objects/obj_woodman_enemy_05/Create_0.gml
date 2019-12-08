event_inherited();
state = "run";


ricochet = true;
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
wasHurt = 0;

runTimerMax = 25;
runTimer = runTimerMax;

hopHspd = 1.5;
hopVspd = -4.25;
grav = .25;
mirror = 1;

grounded = 0;

attackTimerMax = 90;
attackTimer = attackTimerMax;
spd = 1.5;
dir = 0;
aRad = 250;


hp = 8;

stopAnimations = false;

player = instance_nearest(x, y, obj_player);
