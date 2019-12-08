/// @desc scr_addWeapon(id)
/// @arg amt
player = global.player;
weapon = argument[0];
//if player's inventory is full, then....

for(i = 1; i < 4; i++;){
	if(player.weapons[i].name == "nothing"){
		player.weapons[i] = weapon;
		audio_play_sound(snd_weaponGet,50,0);
		instance_destroy();
		return;
	}
}
if(player.invNum = 0 or player.weapon.transportItem){
	instance_destroy(argument[0]);
	return;
} else {
	player.weapons[player.invNum] = weapon;
	audio_play_sound(snd_weaponGet,50,0);
	instance_destroy();
	return;
}
/*
if(player.weapons[1].name != "nothing" and player.weapons[2].name != "nothing" and player.weapons[3] != "nothing"){
	fo
}*/