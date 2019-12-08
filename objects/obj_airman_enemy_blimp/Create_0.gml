event_inherited();
damageC = 0;
hp = 500;
isShootable = false;
ricochet = true;
state = "wait";
fadeInDist = 130;
visible = false;
invincible = false;

fadeInTimerMax = 8;
fadeInTimer = fadeInTimerMax;
spawnTimerMax = 80;
spawnTimer = spawnTimerMax;
spawnIndex = 0;

deployOffsetY = 38;


wall1 = instance_create_depth(x,y,0,obj_wall);
with(wall1){
	visible = false;
	image_xscale = (other.sprite_width)/sprite_width;
	image_yscale = other.sprite_height/sprite_height;
}
horn1 = noone;
horn2 = noone;

for(i=0;i<3;i++)
	flaotyboys[i] = noone;