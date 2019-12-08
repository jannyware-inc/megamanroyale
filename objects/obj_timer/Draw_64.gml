display_set_gui_size(camW,camH);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_mmrock9);
draw_text_outlined(camW/2,4,c_black,c_white,string(minutes) + ":" + string(seconds) + "." + string(ms));
draw_set_halign(fa_left);
draw_set_valign(fa_top);