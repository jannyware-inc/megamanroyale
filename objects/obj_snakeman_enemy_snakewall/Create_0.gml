event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 10;
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

segments = 3;
eyeOpenTimerMax = 100;
eyeOpenTimer = eyeOpenTimerMax;
eyeBlinkTimerMax = 10;
eyeBlinkTimer = eyeBlinkTimerMax;
eyeHalfOpenTimerMax = 20;
eyeHalfOpenTimer = eyeHalfOpenTimer;

atkDistance = 300;
state = "sleep";
sleepTimerMax = 100;
sleepTimer = sleepTimerMax;
blinkTimerMax = 20;
blinkTimer = blinkTimerMax;
shootTimerMax = 20;
shootTimer = shootTimerMax;
#macro BULLETSRANDOM 2+irandom(2);
bulletsMax = BULLETSRANDOM;
bullets = bulletsMax;

wall1 = instance_create_depth(x+sprite_width-sprite_get_width(spr_snakeman_enemy_snakewallsegment),y,layer_get_id("walls"),obj_wall);
with(wall1){
	image_yscale = (other.sprite_height+other.segments*sprite_get_height(spr_snakeman_enemy_snakewallsegment))/sprite_height;
	visible = false;
}
image_speed = 0;