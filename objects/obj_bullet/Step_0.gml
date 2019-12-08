/// @desc move bullet
centerx = x;
centery = y;
len = spd;
hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

if(global.connected and networkSent == 0){
	networkSent = 1;
	//sio_emit_bullet_create();
	scr_network_emitter_add_bullet();
}
if(scr_remotefreezeexit()) return;
if (frames > 0)
	frames--;
else
	instance_destroy();
enemy = instance_place(x+hspd,y,obj_enemy);

if (ricochet == 0 and enemy != noone and enemy.isShootable = true) {
	if(enemy.ricochet == 1){
		if(hspd > 0){
			dir = 135;
		} else {
			dir = 45;
		}
		//sio_emit_bullet_deletebyidn();
		scr_network_emitter_destroybulletbyidn();
		scr_playNoOverlap(snd_dink);
		ricochet = 1;
	} else {
		if(!enemy.invincible){
			enemy.hp-=enemy.dmg_megabuster;
			enemy.hurt = 1;
		}
		if (audio_is_playing(snd_damage)){
			audio_stop_sound(snd_damage);	
		}
		audio_play_sound(snd_damage,11,0);
		
		//sio_emit_bullet_deletebyidn();
		scr_network_emitter_destroybulletbyidn();
		instance_destroy();
	}
}



x+= hspd;
y+= vspd;
