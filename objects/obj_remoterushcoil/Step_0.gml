centerx = x;
centery = y-8;

if(act != noone){
	with(instance_create_depth(actx,acty,global.player.depth+1,obj_remoterushjet)){
		sideFacing = act;
		dir = 90 - 90*act;
		image_xscale = -sideFacing;
		owneruID = other.owneruID;
	}
	instance_destroy();
	return;
}

var localfreezeexit = scr_localfreezeexit();

if(!localfreezeexit){
	aliveTimer++;
}

	if(state == "active"){
	if(!dirSpd){
		if(dir > 90 and dir < 270){
			sideFacing = -1;
		} else {
			sideFacing = 1;
		}
		hspd = sideFacing*shootHspd;
		vspd = shootVspd;
		dirSpd = true;
	}

	_player = instance_place(x,y,obj_player);
	if(bounceTimer > 0){
		bounceTimer--;
	}

	if(bounceTimer == 0 and _player != noone and _player.vspd > 0 and _player.y < y-13){
		scr_playNoOverlap(snd_rushbounce);
		_y = _player.y;
		_player.y = y - 13;
		_pCollide = false;
		with(_player){
			other._pCollide = place_meeting(x,y,obj_wall);
		}
		if(_pCollide){
			_player.y = _y;
		}
		_player.vspd = bounceVspd;
		_player.jumpFrames = 0;
		_player.disableJumpGravity = true;
		_player.currentJumpHeight = -bounceVspd;
		_player.canCancelJump = false;
		bounceTimer = bounceTimerMax;
	} 
}



if(aliveTimer == teleport){
	state = "teleport";
}

if(aliveTimer >= aliveDestroy){
	instance_destroy();
}

if(!localfreezeexit){
	if(state == "teleport"){
		grounded = false;
		teleportTimer++;
		if(teleportTimer == tele1){
			telestate = "tele1";
		} else if (teleportTimer == tele2){
			telestate = "tele2";
		} 
		if(telestate == "tele2"){
			vspd +=teleportgrav;
			y+=vspd;
		}
	}
}


//collisions
if(!localfreezeexit){
	if(state == "active" and !place_meeting(x, y, obj_wall)){
		vspd += grav;

		if (place_meeting(x, y+vspd, obj_wall)) {
			_wall = instance_place(x,y+vspd,obj_wall)
			if(_wall.y > y){
				grounded = 1;
				hspd = 0;
			}
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
			vspd = 0;	
	
			}	
		y+=vspd;


		if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
			}	
		x+=hspd;
	}
}
image_xscale = sideFacing;
if(state == "active"){
	if(bounceTimer > 0){
		sprite_index = spr_weapon_rushcoil_bounce;
	} else {
		sprite_index = spr_weapon_rushcoil;
	}
} else if (state == "teleport"){
	sprite_index = spr_weapon_rushcoil_teleport;
	if(telestate == "tele0"){
		image_index = 2;
	} else if(telestate == "tele1"){
		image_index = 1;
	} else if(telestate == "tele2"){
		image_index = 0;
	}
}