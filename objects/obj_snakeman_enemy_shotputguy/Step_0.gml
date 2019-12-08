centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "waitInView"
	return;
}
scr_hurtblink();

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(5);
	instance_destroy();
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "waitInView"){
	if(scr_inView()){
		state = "dirGen";
	}
}
else if(state == "dirGen"){
	sideFacing = scr_playerSide();
	state = "swing";
} else if (state == "swing"){
	ricochet = true;
	eyeOpen = false;
	if(swingTimer > 0){
		swingTimer--;
	} else {
		swingTimer = swingTimerMax;
		//open eye
		ricochet = false;
		eyeOpen = true;
		eyeIndex = 0;
		state = "swingEye";
	}
} else if (state == "swingEye"){
	if(swingEyeTimer > 0){
		swingEyeTimer--;
		if(swingEyeTimerMax - 3 < swingEyeTimer){
			eyeIndex = 0;
		} else {
			eyeIndex = 1;
		}
	} else {
		sideFacing = scr_playerSide();
		swingEyeTimer = swingEyeTimerMax;
		state = "attack";
		eyeOpen = false;
		//spawn ball
		if(sideFacing > 0){
			_ball = instance_create_depth(x+sprite_width+rightSpriteOffsetX,y+throwOffsetY,depth,obj_snakeman_enemy_shotput);
		} else {
			_ball = instance_create_depth(x,y+throwOffsetY,depth,obj_snakeman_enemy_shotput);
		}
		with(_ball){
			sideFacing = other.sideFacing;
		}
	}
} else if (state == "attack"){
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		state = "dirGen";
	}
}


if(sideFacing > 0){
	eyeSprite = spr_snakeman_enemy_shotputguyeyeright;
	if(eyeOpen){
		switch(floor(image_index)){
			case 0:
				eyeX = 36+rightSpriteOffsetX;
				break;
			case 1:
				eyeX = 35+rightSpriteOffsetX;
				break;
			case 2:
				eyeX = 34+rightSpriteOffsetX;
				break;
			case 3:
				eyeX = 35+rightSpriteOffsetX;
				break;
		}
	}
	if(state == "swing"){
		sprite_index = spr_snakeman_enemy_shotputguyswingright;
	} else if (state == "attack"){
		sprite_index = spr_snakeman_enemy_shotputguythrowright;
	}
} else {
	eyeSprite = spr_snakeman_enemy_shotputguyeyeleft;
	if(eyeOpen){
		switch(floor(image_index)){
			case 0:
				eyeX = sprite_width-sprite_get_width(spr_snakeman_enemy_shotputguyeyeleft)-36;
				break;
			case 1:
				eyeX = sprite_width-sprite_get_width(spr_snakeman_enemy_shotputguyeyeleft)-35;
				break;
			case 2:
				eyeX = sprite_width-sprite_get_width(spr_snakeman_enemy_shotputguyeyeleft)-34;
				break;
			case 3:
				eyeX = sprite_width-sprite_get_width(spr_snakeman_enemy_shotputguyeyeleft)-35;
				break;
		}
	}
	if(state == "swing"){
		sprite_index = spr_snakeman_enemy_shotputguyswingleft;
	} else if (state == "attack"){
		sprite_index = spr_snakeman_enemy_shotputguythrowleft;
	}
}