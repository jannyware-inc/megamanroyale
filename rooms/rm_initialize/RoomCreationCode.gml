with(obj_screenAdjust){
	instance_destroy();
}

//global.screenAdjuster = instance_create_depth(0,0,0,obj_screenAdjust);

/*
with(obj_playerFinder){
	instance_destroy();
}
global.playerFinder = instance_create_depth(0,0,0,obj_playerFinder);
*/
with(obj_syncTimer){
	instance_destroy();
}
global.syncTimer = instance_create_depth(0,0,0,obj_syncTimer);

with(obj_playerPoller){
	instance_destroy();
}
global.playerPoller = instance_create_depth(0,0,0,obj_playerPoller);

with(obj_roomPlayers){
	instance_destroy();
}
//global.roomPlayers = instance_create_depth(0,0,0,obj_roomPlayers);

with(obj_emitter){
	instance_destroy();
}
global.emitter = instance_create_depth(0,0,0,obj_emitter);


with(obj_ping){
	instance_destroy();
}
global.ping = instance_create_depth(0,0,0,obj_ping);

randomize();
with(obj_player){
	instance_destroy();
}
with(obj_remotePlayer){
	instance_destroy();
}

global.roomPlayers = noone;
global.remotealpha = .50;
global.scale = 3;
global.developerMode = false;
global.server = 0;
global.boss = 0;
global.zone = 0;
global.pausePlayer = 0;
global.shadowX = 2;
global.shadowY = 2;
global.connected = 0;
global.tps = 10;
//global.player.canInput = 1;
global.username = "";
global.invincible = 0;
global.playerID = ds_map_create();
global.bulletID = ds_map_create();
global.playersOnline = noone;
global.roomGoto = noone;
global.lobbyCurrent = 0;
global.lobbyTarget = 0;
global.readyPercent = 0;
global.updatePosition = false;
global.bulletIDNum = 0;
global.lowgfx = false;
global.oldmusic = false;
global.placed = noone; //your win position
global.keybindsMap = ds_map_create();
global.namecensor = 0;
global.readyUp = noone;
global.nextLevel = ""; //string for level on lobby board
global.lShiftCheck = 0;
global.rush = dat_rushcoil;
global.nopvp = false;
global.bassunlocked = false;
global.costume = 0;

//global.player.x = 0;
//global.player.y = 0;
//global.playerCenterx = 0;
//global.playerCentery = 0;
global.player = noone;
scr_loadgamedata();
//global.username = "big peen";
room_goto(rm_start);