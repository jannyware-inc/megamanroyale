/// @desc scr_randomDropWeapon(id)
/// @arg (chance)
global.player.dropChance += argument[0];
if(global.player.dropChance > 100){
	global.player.dropChance = 100;
}
randomdrop = irandom(100);

if(randomdrop <= global.player.dropChance){
	switch(irandom(5)){
		case 0:
			instance_create_depth(centerx,centery,depth-2,obj_pickup_metalblade);
			global.player.dropChance = 0;
			return true;
			break;
		case 1:
			instance_create_depth(centerx,centery,depth-2,obj_pickup_searchsnake);
			global.player.dropChance = 0;
			return true;
			break;
		case 2:
			instance_create_depth(centerx,centery,depth-2,obj_pickup_airshooter);
			global.player.dropChance = 0;
			return true;
			break;
		case 3:
			instance_create_depth(centerx,centery,depth-2,obj_pickup_hyperbomb);
			global.player.dropChance = 0;
			return true;
			break;
		case 4:
			instance_create_depth(centerx,centery,depth-2,obj_pickup_timestopper);
			global.player.dropChance = 0;
			return true;
			break;
		case 5:
			instance_create_depth(centerx,centery,depth-2,obj_pickup_rollingcutter);
			global.player.dropChance = 0;
			return true;
			break;
	}
}
return false;

