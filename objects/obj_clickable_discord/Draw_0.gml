scr_draw9slice(spr_9slice_mm2,x-16,y-16,x+16,y+16);
draw_self();
draw_set_halign(fa_center);
scr_draw9slice(spr_9slice_mm2,x-8-string_width(text)/2,y-16-2-21,x+8+string_width(text)/2,y-16-2);
draw_text(x,y-16-7-10,text);
draw_set_halign(fa_left);