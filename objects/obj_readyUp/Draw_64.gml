
display_set_gui_size(camW,camH);
draw_set_font(fnt_mmrock9);
draw_set_halign(fa_center);
if(isReady){
	draw_text_outlined(camW/2,5,c_black,c_lime,"YOU ARE MARKED AS READY!");
} else {
	draw_text_outlined(camW/2,5,c_black,c_red,"PRESS F2 TO READY UP");
}

if(global.connected == 1){
	draw_set_halign(fa_right);
	draw_text_outlined(camW-2,2,c_black,c_white,string(floor(global.readyPercent*100)) + "% READY!\n" + global.lobbyCurrent + "/" + global.lobbyTarget + " PLAYERS");
	if(countdownTimer != noone){
		if(countdownTimer > 10000000){
			draw_text_outlined(camW-2,30,c_black,c_yellow, scr_timerformat(countdownTimer));
		} else {
			draw_text_outlined(camW-2,30,c_black,c_red, scr_timerformat(countdownTimer));
		}
	}
	draw_set_halign(fa_left);
}