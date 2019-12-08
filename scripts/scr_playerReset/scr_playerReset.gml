global.player.hp = global.player.hpMax;
global.player.x = global.player.respawnX;
global.player.y = global.player.respawnY-1.3;
global.player.invisible = false;
global.player.iFrameTimer = 180;
global.player.invulnerable = 0;
global.player.hurt = 0;
global.player.hurtFrames = 0;
global.boss = 0;

vspd = 0;
dead = 0;
global.pausePlayer = 0;
with(obj_music_spawner){
	if(stageMusic)
		stop = 0;
}


var _focus = instance_nearest(x,y,obj_camFocus);
if(_focus!= noone){
	_focus.x = x;
	_focus.y = y;
	
	var _camguide = instance_place(x,y,obj_camGuide);
	if(_camguide!= noone){
		if(_camguide.xx != "px")
			_focus.x = _camguide.xx;
		if(_camguide.yy != "py")
			_focus.y = _camguide.yy;
	}
}


if(global.connected == 1){
	sio_emit_respawn();
}