centerx = x;
centery = y;
visible = true; //gets disabled if out of view at bottom.
if(!networkSent){
	scr_network_emitter_add_bullet();
	networkSent = true;
}

//laddertop = instance_create_depth(x-28,y,depth-100,obj_laddertop);
if(laddertop == noone){
	laddertop = instance_create_depth(centerx-14+3*sideFacing,y,depth-100,obj_laddertop);
	with(laddertop){
		//visible = true;
		canDescend = false;
		image_xscale = 28/16;
	}
}


if(scr_remotefreezeexit()) return;

laddertop.x = centerx-14+3*sideFacing;
laddertop.y = centery;

if(aliveTimer > 0){
	aliveTimer--;
	if(aliveTimer - blinkFrames <= 0){
		visible = aliveTimer % 4 < 2;
	}
} else {
	instance_destroy(laddertop);
	instance_destroy();
	instance_create_depth(x,y+8,depth,obj_rushcoil_teleportaway);
	return;
}


if (state == "deploy"){
	hspd = 0;
	vspd = 0;
	if(image_index > 1){
		image_index = 1;
	} 
	if(deployTimer > 0){
		deployTimer--;
	} else {
		state = "move";
	}
} else if(state == "move"){
	spd += accelSpd;
	if(spd > maxSpd){
		spd = maxSpd;
	}
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
} 


/*
if(global.player.y <= y){
	laddertop.mask_index = spr_laddertop;
} else {
	laddertop.mask_index = spr_mask_empty;
}
*/


y+=vspd;
x+=hspd;

if(true){
	with(laddertop){
		image_yscale = (16+2.5)/16;
		if(place_meeting(x,y-3.5,obj_player)){
			var _y = global.player.y;
			var _x = global.player.x;
			
			if(global.player.y <= y){
				mask_index = spr_laddertop;
				if(global.player.vspd >= 0){
					global.player.externalhspd += other.hspd;
					var pcollide = false;
					with(global.player.y){
						pcollide = place_meeting(x,other.y-1.5,obj_wall);
					}
					if(!pcollide){
						global.player.y = y-1.5;
					}
				}
			} else if(place_meeting(x,y,obj_wall)){
				mask_index = spr_mask_empty;
			} else {
				if(global.player.onLadder){
					global.player.externalhspd += other.hspd;
				}
				mask_index = spr_laddertop;
			}
			
			
			var _pCollide = false;
			with(global.player){
				var _wallfp = instance_place(x,y+.4998,obj_wall);
				if(_wallfp != noone){
					other._pCollide = true;
				}
			}
			if(_pCollide){
				//global.player.x = _x;
				global.player.y = _y;
				mask_index = spr_mask_empty;
			} else {
		
			}
		}
		image_yscale = 1;
	}
	
	var list, length = 0;
	var result, n = 0;
	var cid;

	while true {
	    cid = instance_place(x, y-3.5, obj_hyperbomb);
		
		if (cid == noone){
			cid = instance_place(x, y-3.5, obj_remotehyperbomb);
		}
	    if(cid) {
	        result[n++] = cid;
	        instance_deactivate_object(cid);
	    } else {
	        break;
		}
	}

	for(var i = 0; i < n; i++){
	    instance_activate_object(result[i]);
		result[i].hspd = other.hspd;
		result[i].vspd = -result[i].grav;
		result[i].y = y-8;
	}
		
}

if(state == "deploy"){
	sprite_index = spr_weapon_rushjet_deploy;
} else if (state == "move"){
	sprite_index = spr_weapon_rushjet_move;
}

if(dir < 90){
	image_xscale = -1;
} else {
	image_xscale = 1;
}

if(!scr_inView()){
	visible = false;
}