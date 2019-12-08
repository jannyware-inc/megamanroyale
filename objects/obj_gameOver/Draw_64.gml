display_set_gui_size(camW,camH);
if(drawGameOver){
	draw_set_font(fnt_megamanSmall);
	draw_set_halign(fa_center);
	_strW = string_width("Game over! Press START to exit to lobby.");
	_strH = string_height("Game over! Press START to exit to lobby.");
	scr_draw9slice(spr_9slice_mm2,camW/2-_strW/2-8,camH-28,camW/2+_strW/2+8, camH-30+_strH+18);
	draw_text_outlined(camW/2,camH-20,c_black,c_red," Game over! Press START to exit to lobby.");
	draw_set_halign(fa_left);
}