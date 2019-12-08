/// @desc move bullet
centerx = x;
centery = y;
if(scr_remotefreezeexit()) return;

if (frames > 0)
	frames--;
else
	instance_destroy();
enemy = instance_place(x+hspd,y,obj_enemy);

if (ricochet == 0 and enemy != noone and enemy.isShootable = true) {
		if(!enemy.invincible and !enemy.ricochet){ // and !enemy.hurt
			enemy.hp-=enemy.dmg_airshooter;
			enemy.hurt = 1;
		}
		if (audio_is_playing(snd_damage)){
			audio_stop_sound(snd_damage);	
		}
		audio_play_sound(snd_damage,11,0);
		if(enemy.hp > 0)
			instance_destroy();
}

vspd += grav;
x+= sideFacing*hspd;
y+= vspd;
image_xscale = sideFacing;

