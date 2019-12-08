centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
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
	
if(state == "hover"){
	vspd = 0;
	sideFacing = scr_playerSideCentered();
	hspd = spd*sideFacing;
	if(scr_xDistanceToPlayerCentered() < atkDistance){
		state = "attack";
		atkx = global.player.x;
		atky = global.player.y-6;
		stx = x;

		if(abs(atkx-stx) < 50){
			//show_debug_message(stx-atkx);
			atkx = stx+50*sign(atkx-stx);
		}
		sty = y;
	}
} else if (state == "attack"){
	hspd = atkhspd*sideFacing;
	y = lerp(atky,sty,abs(x-atkx)/abs(stx-atkx));
	//show_debug_message(string(y - atky));
	if((sty<atky and y <sty) or (sty > atky and y > sty)){
		y = sty;
		state = "hover";
	}

}
x+=hspd;
image_xscale = -sideFacing;