scr_draw9slice(spr_9slice_mm2,x-12,y-12,x+4+string_width(text)+16,y+12);
draw_self();
draw_set_font(fnt_megamanSmall);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_valign(fa_center);
draw_text(x+8+4,y,text);
draw_set_valign(fa_top);