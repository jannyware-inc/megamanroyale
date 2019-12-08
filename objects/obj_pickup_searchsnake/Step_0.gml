centerx = x;
centery = y-4;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}
if(place_meeting(x,y,obj_player)){
	scr_addWeapon(instance_create_depth(0,0,0,dat_searchsnake));
	//audio_play_sound(snd_1up,100,0);
	//instance_destroy();
}
if(scr_freezeexit()) return;
if(selfdestroy){
	if(aliveFrames > 0){
		aliveFrames--;
	} else {
		instance_destroy();
	}
	if(aliveFrames - blinkFrames < 0){
		visible = (aliveFrames %4 < 1);
	}
}


vspd += grav;

_wall = instance_place(x, y+vspd, obj_wall)
if (_wall != noone) {
	if(_wall.y > y){
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
			vspd = 0;
		}
	}	
y+=vspd;

