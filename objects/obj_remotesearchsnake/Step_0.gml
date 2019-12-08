/// @desc move bullet
centerx = x;
centery = y;
if(scr_localfreezeexit()) return;
if (frames > 0){
	frames--;
}else{
	ds_map_delete(global.bulletID,ID); //remove from id list
	instance_destroy();
}
centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(state == "fall"){
	if(grounded == 1){
		state = "move";
	}
} else if (state == "move"){
	_snakeBottom = dir + -sideMoving * 90;
	_snakeFront = dir;
	
	_snakeBottomX = x + lengthdir_x(spd,_snakeBottom);
	_snakeBottomY = y + lengthdir_y(spd,_snakeBottom);
	
	_snakeFrontX = x + lengthdir_x(spd,_snakeFront);
	_snakeFrontY = y + lengthdir_y(spd,_snakeFront);
	
	if(!place_meeting(_snakeBottomX, _snakeBottomY,obj_wall)){
		dir += -sideMoving * 90;
		//show_debug_message("nothing under");
	} else if(place_meeting(_snakeFrontX+hspd, _snakeFrontY+vspd,obj_wall)){
		//show_debug_message("something in front");
		while(!place_meeting(_snakeFrontX,_snakeFrontY,obj_wall)){
			_snakeFrontX = x + lengthdir_x(spd,_snakeFront);
			_snakeFrontY = y + lengthdir_y(spd,_snakeFront);
			y+= sign(vspd)*.49;
			x+= sign(hspd)*.49;
		}
		dir += sideMoving * 90;
	}
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	x+=hspd;
	y+=vspd;
	//image_angle = 180-dir;
}


//collisions
if(state == "shoot"){
	hspd = shootHspd * sideMoving;
	vspd = shootVspd;
	state = "fall";
} else if(state == "fall"){
	if(sideMoving == -1)
		dir = 180;
	else 
		dir = 0;
	vspd += grav;
	
	if (place_meeting(x, y+vspd, obj_wall)) {
	
		if(vspd >= 0){
			grounded = 1;
			if(sideMoving == -1)
				dir = 180;
			else 
				dir = 0;
			state = "move";
		}
		while(!place_meeting(x, y+(sign(vspd)*.49), obj_wall)) {
			y += (sign(vspd)*.49);
		}
		vspd = 0;
		
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
	grounded = 1;
	if(sideMoving == -1)
		dir = 90;
	else 
		dir = 90;
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
		state = "move";
	}	
x+=hspd;

}


//destroy if moving upside down
if(state == "move" and ((sideMoving == -1 and (abs(dir) % 360 == 0)) or (sideMoving == 1 and abs(dir) % 360 == 180))){
	scr_explodeSmall();
	instance_destroy();
}

if(!global.player.inNoPvpZone and global.boss == 0 and global.pausePlayer == 0 and global.player.canInput == 1 and place_meeting(x,y,obj_player)){
	scr_hurt(2,1);
}


if(sideMoving > 0){
	sprite_index = spr_snakeman_enemy_searchsnakemirror;
} else {
	sprite_index = spr_snakeman_enemy_searchsnake;
}

image_xscale = -sideMoving;
image_yscale = -sideMoving;
image_angle = dir-180;	