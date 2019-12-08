event_inherited();
state = "squat1";


ricochet = 0;
homeY = y;
isShootable = true;
isSolid = true;
invincible = false;
zone = -1;
damageC = 3;
vspd = 0;
hspd = 0;
hurt = 0;
homeY = y;
homeX = x;
wasHurt = 0;

squatTimerMax = 2;
squatTimer = squatTimerMax;
hopHspd = 1;
hopVspd = -3;
grav = .2;
mirror = 1;
carrotsMax = 3;
carrots = carrotsMax;

grounded = 0;

attackTimerMax = 90;
attackTimer = attackTimerMax;
spd = 1;
dir = 0;
aRad = 250;


hp = 10;

stopAnimations = false;

player = instance_nearest(x, y, obj_player);
mirror = -sign(player.x - x);