event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 2;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = .25;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = 1;
grounded = 0;

//timers, etc
state = "move";
atkDistance = 200;
can1 = instance_create_depth(x,y-16,depth,obj_metalman_enemy_tincan);
can2 = instance_create_depth(x,y+16,depth,obj_metalman_enemy_tincan);
can3 = instance_create_depth(x,y+32,depth,obj_metalman_enemy_tincan);
mask = instance_create_depth(x,y,depth,obj_metalman_enemy_tincanmask);
sinCounter = 0;
fireHspd = 3;
fireVspd = -3;
attackY = 40;
waitTimerMax = 65;
waitTimer = waitTimerMax;
recollectTimerMax = 30;
recollectTimer = recollectTimerMax;
recollectvspd = -3.5;