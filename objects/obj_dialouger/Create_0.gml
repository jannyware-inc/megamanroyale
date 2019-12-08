/// @description Insert description here
// You can write your code in this editor
ltrIndex = 1;
ltrNext = 0;
ltrSpeed = .333;
msgIndex = 0;
waitForAct = 0;
sndSpeedIndex = 1;
msgCurrent = "";
msgLength = 0;
ltrCurrent = "";
ltrSnd = snd_shake;
ltrTimer = 0;
dialogue[0] = "uwu u shouldnt see dis onii chaaaannn";
boxX = 30/2;
boxY = 300/2;
boxW = 580/2;
boxH = 150/2;
indX = 10/2;
indY = 10/2;
	var _vx = camera_get_view_width(view_camera[0]);
	var _vy = camera_get_view_height(view_camera[0]);
	display_set_gui_size(_vx, _vy);
	