if(!scr_inView()){
	instance_destroy();	
}
	
if(place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
}

if(hp <= 0){
	scr_explodeSmall();
	instance_destroy();
}

if(scr_freezeexit()) return;


if(state == "scatter"){
	if(scatterTimer > 0){
		scatterTimer--;
		if(!scatterSpdGen){
			scatterSpdGen = true;
			vspd = lengthdir_y(spd,dir);
			hspd = lengthdir_x(spd,dir);
		}
	} else {
		state = "sleep";
		hspd = 0;
		vspd = 0;
	}
	/*
} 
else if (state == "sleep"){
	if (sleepTimer > 0){
		sleepTimer--;
	} else {
		state = "blow";
	}
*/
} else if (state == "blow"){
	hspd += blowAccel *sign(sideFacing);
}

x += hspd;
y += vspd;

if(sideFacing < 0){
	sprite_index = spr_boss_airman_tornadoleft;
} else {
	sprite_index = spr_boss_airman_tornadoright;
}