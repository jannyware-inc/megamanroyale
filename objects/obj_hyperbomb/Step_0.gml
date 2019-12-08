/// @desc move bullet
if(global.connected and networkSent == 0){
	networkSent = 1;
	scr_network_emitter_add_bullet();
}
centerx = x;
centery = y;
if(scr_remotefreezeexit()) return;
if (frames > 0){
	frames--;
} else {
	instance_create_depth(x,y,depth,obj_hyperbombexplosion);
	instance_destroy();
}

centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}


//collisions
if(state == "dirGen"){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	state = "fall";
} else if(state == "fall"){
	if(grounded){
		vspd = -lastVspd * bounce;
		hspd = hspd*decel;
	}
	if(wallCollide){
		hspd = -lastHspd * bounce;
	}
	lastHspd = hspd;
	lastVspd = vspd;
}

vspd+=grav;
grounded = 0;
if (!place_meeting(x,y,obj_wall) and place_meeting(x, y+vspd, obj_wall)) {
	if(vspd >= 0){
		grounded = 1;
	}
	while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
		y += (sign(vspd)*.99);
	}
	vspd = 0;		
	}	
y+=vspd;
wallCollide = 0;
if (!place_meeting(x,y,obj_wall) and place_meeting(x+hspd, y, obj_wall)) {
	wallCollide = 1;
	while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
			x += (sign(hspd)*.99);
		}
		hspd = 0;
	}	
x+=hspd;


	
enemy = instance_place(x+hspd,y,obj_enemy);

if (ricochet == 0 and enemy != noone and enemy.isShootable = true) {
	if(enemy.ricochet == 1){
		scr_playNoOverlap(snd_dink);
		ricochet = 1;
		scr_network_emitter_destroybulletbyidn();
		instance_destroy();
	} else {
		if(irandom(misfireChance) == -1){ //set to -1 to disable misfire
			if(!enemy.invincible){
				enemy.hp-= enemy.dmg_hyperbombmisfire;
				enemy.hurt = 1;
			}
			scr_playNoOverlap(snd_fart);
			//need to make new network action for bullet update syncing
			scr_network_emitter_actbyidn(2); //1 is code to explode.
			instance_create_depth(x,y,depth,obj_hyperbombexplosionmisfire);
			instance_destroy();
		} else {
			if(!enemy.invincible){
				enemy.hp-= enemy.dmg_hyperbomb;
				enemy.hurt = 1;
			}
			if (audio_is_playing(snd_damage)){
				audio_stop_sound(snd_damage);	
			}
			audio_play_sound(snd_damage,11,0);
			//need to make new network action for bullet update syncing
			scr_network_emitter_actbyidn(1); //1 is code to explode.
			instance_create_depth(x,y,depth,obj_hyperbombexplosion);
			instance_destroy();
		}
	}
}




if(hspd != 0)
	image_xscale = sign(hspd);
	