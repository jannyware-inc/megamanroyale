player = global.player;
cameraSpeed = .125;

yPlatform = global.player.y;

with(global.player){
	other.x = x;
	other.y = centery;
	
	var _focus = instance_nearest(x,y,obj_camFocus);
	if(_focus!= noone){
	_focus.x = x;
	_focus.y = y;
	
	var _camguide = instance_place(x,y,obj_camGuide);
	if(_camguide!= noone){
		with(_camguide)
			//event_perform(ev_create,0);
		if(_camguide.xx != "px")
			_focus.x = _camguide.xx;
		if(_camguide.yy != "py")
			_focus.y = _camguide.yy;
	}
	}
}
//x = player.x;
//y = player.y;
lerpx = x;
lerpy = y;

viewleft = 0;
viewright = 0;