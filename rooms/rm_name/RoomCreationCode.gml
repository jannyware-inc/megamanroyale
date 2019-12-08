ds_map_destroy(global.playerID);
global.playerID = ds_map_create();
ds_map_destroy(global.bulletID);
global.bulletID = ds_map_create();

with(obj_remotePlayer){
	instance_destroy();
}
with(obj_roomPlayers){
	instance_destroy();
}
global.invincible = 0;
global.pausePlayer = 0;
//global.player.canInput = 1;
global.boss = 0;
global.placed = noone;
global.nextLevel = "";