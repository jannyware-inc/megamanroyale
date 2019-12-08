
centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(!scr_inZoneAndView() and x < player.y){
	instance_destroy();
	return;
}

if(hp <= 0){
	centery+=-16;
	scr_explodeSmall();
	instance_destroy();
}

scr_hurtblink();

if(scr_freezeexit()) return;

if (place_meeting(x,y,global.player))
	scr_hurt(damageC,0);

hspd = -hopHspd;

if(state == "run"){
	if(runTimer > 0){
		if(grounded){
			runTimer--;
		}
	} else {
		runTimer = runTimerMax;
		state = "hop";
		vspd = hopVspd;
		grounded = false;
	} 
} else if (state == "hop") {
	if(grounded){
		state = "run";
	}
}


vspd += grav;






if (place_meeting(x, y+12+vspd, obj_wall)) {
			while(!place_meeting(x, y+12+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
		
	}	
y+=vspd;
if(place_meeting(x,y+12+.5,obj_wall))
			grounded = 1;
		else
			grounded = 0;

/*
if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
	}	
*/
x+=hspd;



if(state == "hop"){
	image_index = 1;
}
