centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "move"
	return;
}

scr_hurtblink();
if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(5);
	instance_destroy(reflector);
	instance_destroy(grounder);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

with(reflector){
	if (place_meeting(x,y,obj_player))
		scr_hurt(other.damageC,0);
}

if(state == "move"){
	hspd = spd * sideFacing;
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = MOVETIMERMAX;
		state = "idle";
	}
} else if(state == "idle"){
	hspd = 0;
	if(idleTimer > 0){
		idleTimer--;
	} else {
		idleTimer = IDLETIMERMAX;
		state = "move";
	}
} 

if(instance_exists(id)){
	reflector.x = x;
	reflector.y = y;

	grounder.x = x + (sideFacing*grounderX);
	grounder.y = y;
}
//collisions
with(reflector){
	if (place_meeting(x+other.hspd, y, obj_wall)) {
				while(!place_meeting(x+(sign(other.hspd)*.99), y, obj_wall)) {
					x += (sign(other.hspd)*.99);
				}
			other.sideFacing = -other.sideFacing;
			other.hspd = 0;
		}	
}
x+=hspd;

with(grounder){
	if(!place_meeting(x,y,obj_wall)){
		other.sideFacing = -other.sideFacing;
	}
}

image_xscale = -sideFacing;