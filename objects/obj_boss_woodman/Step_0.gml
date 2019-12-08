centerx = x + sprite_width/2;
centery = y + sprite_height/2;

if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(!scr_inZone()){
	if(instance_exists(currentLeafShield)){
		instance_destroy(currentLeafShield);
	}
	instance_destroy();
}

scr_bossblink();
if(hp <= 0 and state != "fall" and state != "heal" and state != "squareTheFuckUpBitch" and state != "fallSquatEntry"){
	if(instance_exists(currentLeafShield))
		instance_destroy(currentLeafShield);
	if(instance_exists(leaf1))
		instance_destroy(leaf1);
	if(instance_exists(leaf2))
		instance_destroy(leaf2);
	if(instance_exists(leaf3))
		instance_destroy(leaf3);
	if(instance_exists(leaf4))
		instance_destroy(leaf4);
	instance_destroy();
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,global.player))
	scr_hurt(damageC,0);

if(state == "fall"){
	if(grounded == 1){
		state = "fallSquatEntry";
		x -= 1;
	}
} else if (state == "fallSquatEntry") {
	if(fallSquatIntroTimer > 0){
		if(fallSquatIntroTimer == fallSquatIntroTimerMax-5)
			audio_play_sound(snd_landing,10,0);
		fallSquatIntroTimer--;
	} else {
		fallSquatTimer=fallSquatIntroTimerMax;
		state = "squareTheFuckUpBitch";
	}
} else if (state == "squareTheFuckUpBitch") {
	if(thumpTimer > 0){
		thumpTimer--;
	} else {
		thumpTimer=thumpTimerMax;
		state = "heal";
	}
	
} else if (state == "heal") {
	if(hpTimer > 0){
		hpTimer--;
	} else {
		hpTimer = hpTimerMax;
		if (hp < hpMax){
			hp++;
			scr_playNoOverlap(snd_heal1hp);
		} else {
			state = "spawnShield"
			scr_mirror();
			global.player.canInput = true;
		}
	}
} else if (state == "spawnShield") {
	currentLeafShield = instance_create_depth(x-8,y-12,-5,obj_woodman_leafshield);
	state = "leafSpit";
	scr_mirror();
} else if (state == "leafSpit"){
	if(leafSpitTimer > 0){
	leafSpitTimer--;
	} else {
		leafSpitTimer = leafSpitTimerMax;
		if(leaves > 0){
			leaves--;
			lastUpLeaf = instance_create_depth(x+10,y+10,-4,obj_woodman_upLeaf);
		}
		if (!instance_exists(lastUpLeaf)){
			state = "dropLeaves";
			leaves = maxLeaves;
		}
	}
} else if (state == "dropLeaves") {
	cameraCenter = (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2);
	cameraY = camera_get_view_y(view_camera[0]);
	leaf1 = instance_create_depth(cameraCenter+downLeafDeltaX/2,cameraY+downLeafDeltaY,-5,obj_woodman_downLeaf);
	leaf2 = instance_create_depth(cameraCenter+downLeafDeltaX*1.5,cameraY+downLeafDeltaY,-5,obj_woodman_downLeaf);
	leaf3 = instance_create_depth(cameraCenter-downLeafDeltaX/2,cameraY+downLeafDeltaY,-5,obj_woodman_downLeaf);
	leaf4 = instance_create_depth(cameraCenter-downLeafDeltaX*1.5,cameraY+downLeafDeltaY,-5,obj_woodman_downLeaf);
	state = "leafShieldWindUp";
	scr_mirror();
} else if (state == "leafShieldWindUp") {
	image_index = 0;
	if(leafShieldWindUpTimer > 0){
		leafShieldWindUpTimer--;
	}else{
		ricochet = 0;
		leafShieldWindUpTimer = leafShieldWindUpTimerMax;
		with(currentLeafShield){
			ricochet = false;
			isShootable = false;
			hspd = spd * scr_playerSide();
		}
		state = "leafShieldThrow";
		scr_mirror();
	}
} else if (state == "leafShieldThrow") {
	image_index = 1;
	if(leafShieldWindUpTimer > 0){
		leafShieldWindUpTimer--;
	}else{
		leafShieldWindUpTimer = leafShieldWindUpTimerMax;
		state = "sleep1";
		sleepTimer = 40;
		scr_mirror();
	}
} else if (state == "sleep1"){
	if (sleepTimer > 0){
		sleepTimer--;
	} else {
		sleepTimer = sleepTimerMax; 
		//hop
		vspd = hopVspd;
		hopHspd = abs(hopHspd) * scr_playerSide();
		hspd = hopHspd;
		state = "hop";
		grounded = 0;
		scr_mirror();
	}
} else if (state == "hop"){
	hspd = hopHspd;
	//hopping
	if (grounded == 1){
		hspd = 0;
		state = "fallSquat";
	}	
} else if (state == "fallSquat") {
	if(fallSquatTimer > 0){
		if(fallSquatTimer == fallSquatTimerMax-5)
			audio_play_sound(snd_landing,10,0);
		fallSquatTimer--;
	} else {
		fallSquatTimer=fallSquatTimerMax;
		ricochet = 1;
		state = "spawnShield";
		scr_mirror();
	}
} 


//collisions
vspd += grav;

if (place_meeting(x, y+vspd, obj_wall)) {
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
		grounded = 1;
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
	}	
x+=hspd;





if(mirror > 0){
	if(state == "fall" or state == "hop"){
		sprite_index = spr_boss_woodman_jump;
	} else if(state == "thump" or state == "squareTheFuckUpBitch" or state == "leafSpit"){
		sprite_index = spr_boss_woodman_thump;
	} else if(state == "sleep" or state == "sleep1" or state == "heal" or state == "fallSquatEntry" or state == "fallSquat"){
		sprite_index = spr_boss_woodman_sleep;
	} else if (state == "leafShieldThrow" or state == "leafShieldWindUp"){
		sprite_index = spr_boss_woodman_throw;
	}
} else {
	if(state == "fall" or state == "hop"){
		sprite_index = spr_boss_woodman_jumpmirror;
	} else if(state == "thump" or state == "squareTheFuckUpBitch" or state == "leafSpit"){
		sprite_index = spr_boss_woodman_thumpmirror;
	} else if(state == "sleep" or state == "sleep1" or state == "heal" or state == "fallSquatEntry" or state == "fallSquat"){
		sprite_index = spr_boss_woodman_sleepmirror;
	} else if (state == "leafShieldThrow" or state == "leafShieldWindUp"){
		sprite_index = spr_boss_woodman_throwmirror;
	}
}