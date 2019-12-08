event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 1;
damageC = 28;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 1.75;

startdir = 0;
dir = startdir;
//timers, etc
screemTimer = 80;

if(irandom(3) != 0){
	instance_destroy();
	//show_debug_message("buy");
}