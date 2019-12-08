centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "sleep";
	return;
}

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "sleep"){
	hspd = 0;
	vspd = 0;
	if(scr_distanceToPlayer() < attackDistance and abs(y - global.player.y) < attackY){
		state = "move";
		dir = point_direction(x,y,global.player.x,global.player.centery);
		moveSpd = min(2,abs(y - global.player.centery)/25);
	}
} else if (state == "move"){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(moveSpd,dir);
	if(moveTimer > 0){
		moveTimer--;
	} else {
		moveTimer = moveTimerMax;
		state = "vertical";
		dir = 90;
	}
}  else if (state == "vertical"){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd*.55,dir);
	if(verticalTimer > 0){
		verticalTimer--;
	} else {
		verticalTimer = verticalTimerMax;
		state = "move";
		dir = point_direction(x,y,global.player.x,global.player.centery);
	}
}

y+=vspd;	
x+=hspd;




if(scr_playerSideCentered() != 0){
	sideFacing = scr_playerSideCentered();
}
image_xscale = -sideFacing;

if(state != "sleep"){
	if(shootTimer > 0){
		shootTimer--;
	} else {
		shootTimer = shootTimerMax;
		var playerdir = point_direction(x,y,global.player.x,global.player.centery);
		if (playerdir <= 180){
			with(instance_create_depth(x+14*sideFacing,y+11,depth-1,obj_napalm_helijoeshot)){
				dir = 270 + 90*other.sideFacing;
			}
		} else if (playerdir > 245 and playerdir < 295){
			with(instance_create_depth(x,y+19,depth-1,obj_napalm_helijoeshot)){
				dir = 270;
			}
		} else if (playerdir > 180 and playerdir < 360){
			with(instance_create_depth(x+11*sideFacing,y+23,depth-1,obj_napalm_helijoeshot)){
				dir = 270 + 45*other.sideFacing;
			}
		}
	}
}

var playerdir = point_direction(x,y,global.player.x,global.player.centery);
if (playerdir <= 180){
	sprite_index = spr_napalm_helijoe_0;
} else if (playerdir > 245 and playerdir < 295){
	sprite_index = spr_napalm_helijoe_90;
} else if (playerdir > 180 and playerdir < 360){
	sprite_index = spr_napalm_helijoe_45;
}