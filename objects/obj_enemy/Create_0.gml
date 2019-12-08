/// @description Insert description here
// You can write your code in this editor
localid = noone;

healthprimary = $0028D8;
healthsecondary = $FFFFFF;

damageC = 1;
hp = 500;
wasHurt = 0;
blinking = false;

state = "sleep";
zone = -1;
isShootable = true;
isSolid = false;
damageC = 3;
ricochet = 1;
invincible = false;
hurt = 0;
dmg_megabuster = 1;
dmg_metalblade = 2;
dmg_searchsnake = 2;
dmg_airshooter = 2;
dmg_hyperbomb = 2;
dmg_hyperbombexplosion = 1;
dmg_hyperbombmisfire = 10;
dmg_hyperbombmisfireexplosion = 5;
dmg_rollingcutter = 2;

frozen = false;
wasfrozen = false;

centerx = x;
centery = y;
/*
if(object_get_sprite(id) == -1){
	visible = false;
}*/