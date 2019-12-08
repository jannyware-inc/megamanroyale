centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "move";
	moves = movesMax;
	moveTimer = moveTimerMax;
	return;
}
scr_hurtblink();
if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}

var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	if(visible){
		image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	}
	return;
}
with(obj_remotetimestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	if(visible){
		image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	}
	return;
}



if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "move"){
	ricochet = true;
	image_index = 0;
	hspd = sideFacing * moveSpd;
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = moveTimerMax;
		state = "shoot";
	}
}else if (state == "shoot"){
	hspd = 0;
	ricochet = false;
	image_index = 1;
	if(shootTimer > 0){
		shootTimer--;
		if(shootTimer == floor(shootTimerMax/2)){
			scr_playNoOverlap(snd_sentryfire);
			for(i = 0; i <= 360; i+=45){
				with(instance_create_depth(centerx,centery,depth+1,obj_cutman_enemy_flyingmetoolprojectile)){
					dir = other.i;
				}
			}
		}
	} else {
		shootTimer=shootTimerMax;
		if(moves >1){
			moves--;
			state = "move";
		} else {
			state = "return";
			moves = movesMax;
		}
	}
	
} else if (state == "return"){
	ricochet = true;
	image_index = 0;
	if((sideFacing == -1 and x >= homeX) or (sideFacing == 1 and x <= homeX)){
		x = homeX;
		state = "shoot";
		moves++;
		hspd = sideFacing*.0001; //this is to correct the sacle
	} else {
		hspd = sideFacing * returnSpd;
	}
}
x+=hspd;
y+=vspd;
if(sign(hspd) != 0)
	image_xscale = -sign(hspd);