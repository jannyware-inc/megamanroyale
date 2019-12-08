display_set_gui_size(camW,camH);
draw_set_alpha(1);
draw_set_font(fnt_megamanSmall);
draw_set_halign(fa_right);
if(alivePlayers == 1){
	draw_text_outlined(camW-2,4,c_black,c_white,"1 Player Remaining");
} else {
	draw_text_outlined(camW-2,4,c_black,c_white,string(alivePlayers) + " Players Remaining");
}
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_set_font(fnt_joystix);
if(first != ""){
	draw_text_outlined(camW-2,camH-2-winDeltaY*2,c_black,$00d7ff,first);
}
if(second != ""){
	draw_text_outlined(camW-2,camH-2-winDeltaY*1,c_black,$c0c0c0,second);
}
if(third != ""){
	draw_text_outlined(camW-2,camH-2-winDeltaY*0,c_black,$327fcd,third);
}
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);