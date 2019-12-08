centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}


if(hp <= 0){
	scr_dropPickups(20);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "moveDown"){
	y += spd;
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = moveTimerMax;
		state = "moveUp";
	}
} else if (state == "moveUp"){
	y-= spd;
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = moveTimerMax;
		state = "moveDown";
	}
}
