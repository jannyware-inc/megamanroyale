centerx = x;
centery = y-8;
var remotefreezeexit = scr_remotefreezeexit();

if(!remotefreezeexit){
	aliveTimer++;
}

if(state == "converttojet"){
	x = x+3+(sideFacing == 1)*-6;
	y = y-9;
	scr_network_emitter_actbyidn(90 - 90*global.player.sideFacing);
	with(instance_create_depth(x,y,global.player.depth+1,obj_rushjet)){
		sideFacing = global.player.sideFacing;
		dir = 90 - 90*global.player.sideFacing;
		networkSent = true; //do not send this over network, instead use bulletact.
		image_xscale = -sideFacing;
	}
	
	
	instance_destroy();
	return;
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

if(global.connected and networkSent == 0){
	networkSent = 1;
	scr_network_emitter_add_bullet();
}


if(aliveTimer == teleport){
	state = "teleport";
}

if(aliveTimer >= aliveDestroy){
	instance_destroy();
}

if(!remotefreezeexit){
	if(state == "teleport"){
		grounded = 0;
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
if(!remotefreezeexit){
	grounded = 0;
	if(state == "active" and !place_meeting(x,y,obj_wall)){
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