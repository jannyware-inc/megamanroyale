centerx = x;
centery = y-sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

if(!scr_inZone()){
	with(obj_snakeman_enemy_searchsnake){
		instance_destroy();
	}
	instance_destroy();
}

scr_bossblink();
if(hp <= 0 and canDie){
	with(obj_snakeman_enemy_searchsnake){
		instance_destroy();
	}
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(vspd >= 0 and place_meeting(x,y+1,obj_wall)){
	grounded = 1;
} else {
	grounded = 0;
}
	
	
	

if(state == "fall"){
	if(grounded == 1){
		state = "sleepIntro";
	}
} else if (state == "sleepIntro"){
	if(sleepIntroTimer > 0){
		sleepIntroTimer--;
	} else {
		sleepIntroTimer = sleepIntroTimerMax;
		state = "fallSquatEntry";
	}
} else if (state == "fallSquatEntry") {
	if(fallSquatTimer > 0){
		fallSquatTimer--;
	} else {
		fallSquatTimer=fallSquatTimerMax;
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
			canDie = true;
			state = "run";
			global.player.canInput = true;
			ricochet = false;
			attack = 1;
		}
	}
}  else if (state == "run") {
	sideFacing = sideMoving;
	if(jumpOnRun){
		vspd = smallHopVspd;
		state = "jump";
		jumpOnRun = false;
	}
	if((sideMoving == -1 and x < leftBarrier) or (sideMoving == 1 and x > rightBarrier)){
		jumpOnRun = true;
		//this is what he does after he hits the ledge
		sideMoving = -sign(sideMoving);
		sideFacing = sideMoving;
		if(instance_number(obj_snakeman_enemy_searchsnake) < 1){
			if(!attacked or attack == 1){
				//instance_create_depth(x,y-10,depth,obj_snakeman_enemy_searchsnake);
				//instance_create_depth(x,y-10,depth,obj_snakeman_enemy_searchsnake);
				state = "attack";
				vspd = attackVspd;
				attacked = 1;
			}
		}
		//turn around or attack or something
		jumpIndex = 0;
		
		turnx = x;
		attacked = 0;
		attackedColumn = 0;
		attack = irandom(2);
	}
	
	if(attack == 0 and !attacked and !attackedColumn and abs(x - turnx) > abs(columnX-turnx)){ //attack on column?
		attackedColumn = true;
		//show_debug_message("column!!!");
		if(instance_number(obj_snakeman_enemy_searchsnake) < 1){
			if(irandom(10) < 5){
				//instance_create_depth(x,y-10,depth,obj_snakeman_enemy_searchsnake);
				//instance_create_depth(x,y-10,depth,obj_snakeman_enemy_searchsnake);
				state = "attack";
				vspd = attackVspd;
				attacked = 1;
			}
		}
	}
	
	if(grounded){
		hspd = spd * sideMoving;
	}else{
		hspd = 0;
		if(attack == 2 and !attacked and jumpIndex % 2 == 1){
			//jump from column
			//show_debug_message("bruh");
			vspd = columnHopVspd;
			state = "jump";
		}
	}
	if(wallCollide){
		//show_debug_message("Hit wall");
		state = "jump";		
		if(jumpIndex % 2 == 0)
			vspd = bigHopVspd;
		else 
			vspd = smallHopVspd;
		jumpIndex++;
	}
} else if (state == "jump") {
	hspd = spd* sideMoving;
	if(grounded){
		state = "run";
	}
} else if (state == "attack"){
	hspd = 0;
	if(snakes > 0){
		if(attackTimer > 0){
			attackTimer--;
		} else {
			attackTimer = attackTimerMax;
			snakes--;
			//shoot
			shootTimer = shootTimerMax;
			sideFacing = scr_playerSideCentered();
			with(instance_create_depth(x+shootOffsetX*-sign(sideFacing),y+shootOffsetY,depth,obj_snakeman_enemy_searchsnake)){
				sideMoving = other.sideFacing;
			}
		}
	}
	if(grounded){
		snakes = snakesMax;
		attackTimer = attackTimerMax;
		state = "fallSquatAtk";
	}
} else if (state == "fallSquatAtk"){
	shootTimer = 0;
	if(fallSquatAtkTimer > 0){
		fallSquatAtkTimer--;
	} else {
		fallSquatAtkTimer = fallSquatAtkTimerMax;
		state = "run";
	}
}

if(shootTimer > 0){
	shootTimer--;
	shooting = true;
} else {
	shooting = false;
}

//collisions
vspd += grav;
//grounded = 0;
wallCollide = false;
_wall = instance_place(x, y+vspd, obj_wall)
if (_wall != noone) {
	if(_wall.y > y){
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		

			vspd = 0;
		}
	}	
y+=vspd;


if (place_meeting(x+hspd, y, obj_wall)) {
	wallCollide = true;
			while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
				x += (sign(hspd)*.99);
			}
		hspd = 0;
	}	
x+=hspd;


//image_xscale = -sideFacing;


	if(state == "fall" or state == "sleep" or state == "sleepIntro"){
		sprite_index = spr_boss_snakeman_sleep;
	} else if(state == "heal"){
		sprite_index = spr_boss_snakeman_taunt;
	} else if(grounded and state == "run"){
		sprite_index = spr_boss_snakeman_run;
	} else if (!shooting and state == "jump" or (state == "attack" and vspd < 0)){
		image_index = 0;
		sprite_index = spr_boss_snakeman_jump;
	} else if ((!grounded and state == "run" ) or (!shooting and (state == "attack" and vspd > 0))){
		image_index = 1;
		sprite_index = spr_boss_snakeman_jump;
	} else if (shooting and state == "attack"){
		image_index = 2;
		sprite_index = spr_boss_snakeman_jump;
	} else if (state == "fallSquatAtk"){
		image_index = 0;
		sprite_index = spr_boss_snakeman_squat;
	}
	
		image_xscale = -sideFacing;