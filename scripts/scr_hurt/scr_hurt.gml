/// @desc hurt(damage,hurttype)
/// @arg entity damage
/// @arg damage hurttype
var player = global.player;
var damage = argument0;

if(!instance_exists(player))
	return;
if (player.dead == 0 and player.hurt == 0 and player.invulnerable == 0 and global.invincible == 0){
	scr_playNoOverlap(snd_hurt);
	instance_create_depth(player.x,player.y-player.sprite_height-6,-10,obj_sweat);
	instance_create_depth(player.x+10,player.y-player.sprite_height-2,-10,obj_sweat);
	instance_create_depth(player.x-10,player.y-player.sprite_height-2,-10,obj_sweat);
	switch(argument1){
		case 0:
			player.hurtFrames = player.maxHurtFrames;
			player.hurt = 1;
			break;
		case 1: //pvp damage
			player.hurtFrames = player.maxHurtFrames/2;
			player.hurt = 2;
			break;
	}
	player.hp -= damage;
	if(player.hp <= 0 and player.etanks > 0){ //etanks
		scr_playNoOverlap(snd_select);
		player.hpIpl = 0;
		player.etanks--;
		player.hp = player.hpMax;
	}
}