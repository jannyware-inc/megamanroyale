centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
	scr_goHome();
	state = "move";
}


if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(10);
	
	if(instance_exists(can1)){
		instance_destroy(can1);
	}
	if(instance_exists(can2)){
		instance_destroy(can2);
	}
	if(instance_exists(can3)){
		instance_destroy(can3);
	}
	if(instance_exists(mask)){
		instance_destroy(mask);
	}
	
	instance_destroy();
	return;
}
if(scr_freezeexit()) return;
if(state == "move"){
	//ricochet = 0;
	sideFacing = scr_playerSideCentered();
	
	if(hurt == 1){
		hurt = 0;
		//ricochet = 1;
		state = "shoot";
	}
	hurt = 0;
	x = mask.x;
	y = mask.y;
	if(scr_distanceToPlayer() > atkDistance or abs(y - global.player.y) > attackY){
		if(grounded){
			hspd = 0;
		}
		//sinCounter = 0;
	} else {
		with(mask){
			sideFacing = other.sideFacing;
			hspd = other.spd* other.sideFacing;
		}
	}
		
		sinCounter++;
		can1.y = y - 16;
		can1.x = x + 3*round(sin(sinCounter/8));
		can1.state = "notfree";
		can2.y = y + 16;
		can2.x = x - 3*round(sin(sinCounter/8));
		can2.state = "notfree";
		can3.y = y + 32;
		can3.x = x + 3*round(sin(sinCounter/8));
		can3.state = "notfree";
} else if (state == "shoot"){
	mask.hspd = 0;
	can1.hspd = fireHspd * sideFacing*(3.5/3);
	can1.vspd = fireVspd;
	can1.state = "free";
	can2.hspd = fireHspd * sideFacing *(3/3);
	can2.vspd = fireVspd;
	can2.state = "free";
	can3.hspd = fireHspd * sideFacing *(2/3);
	can3.vspd = fireVspd;
	can3.state = "free";
	vspd = fireVspd*2;
	state = "wait";
} else if (state == "wait"){
	mask.hspd = 0;
	if(waitTimer > 0){
		waitTimer--;
		
		vspd += grav;

		grounded = 0;
		if (place_meeting(x, y+vspd, obj_wall)) {
			_wall = instance_place(x,y+vspd,obj_wall)
			if(_wall.y > y)
				grounded = 1;
					while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
					y += (sign(vspd)*.99);
					}
				vspd = 0;
	
			}	
		y+=vspd;
		
	} else {
		waitTimer = waitTimerMax;
		state = "recollect";
		with(can1){
			scr_explodeSmall();
		}
		with(can2){
			scr_explodeSmall();
		}
		with(can3){
			scr_explodeSmall();
		}
		can1.x = x;
		can2.x = x;
		can3.x = x;
		can1.y = y + 32;
		can2.y = y + 64;
		can3.y = y + 96;
	}
} else if (state == "recollect"){
	if(recollectTimer > 0){
		recollectTimer--;
	} else {
		recollectTimer = recollectTimerMax;
		state = "move";
	}
	can1.state = "notfree";
	if(can1.y <= y){
		can1.y = y;
	} else {
		can1.y += recollectvspd;
	}
	can2.state = "notfree";
	if(can2.y <= y){
		can2.y = y;
	}else {
		can2.y += recollectvspd;
	}
	can3.state = "notfree";
	if(can3.y <= y){
		can3.y = y;
	}else {
		can3.y += recollectvspd;
	}
}

	
	
//collisions
with(mask){
	vspd += grav;

	grounded = 0;
	_wall = instance_place(x,y+vspd,obj_wall);
	if(_wall == noone){
		_wall = instance_place(x,y+vspd,obj_laddertop);
	}
	if(_wall!= noone){
		if(_wall.y > y)
			grounded = 1;
				while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall) and !place_meeting(x, y+(sign(vspd)*.99), obj_laddertop)) {
					y += (sign(vspd)*.99);
				}
			vspd = 0;
	
		}	
	y+=vspd;

	if (place_meeting(x+hspd, y, obj_wall)) {
				while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
					x += (sign(hspd)*.99);
				}
			sideFacing = -sideFacing;
			hspd = 0;
		}	
	x+=hspd;
}
image_xscale = -sideFacing;