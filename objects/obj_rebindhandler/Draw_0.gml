draw_set_halign(fa_center);
scr_draw9slice(spr_9slice_mm2,camX+camW/2-8-string_width("Click a box, then input the key to bind.   Clear binds with delete.")/2,1,camX+camW/2+8+string_width("Click a box, then input the key to bind.   Clear binds with delete.")/2,20);
draw_text_outlined(camX+camW/2,camY+6,c_black,c_white,"Click a box, then input the key to bind.   Clear binds with delete.")
draw_set_halign(fa_left);
scr_draw9slice(spr_9slice_mm2,camX+border,camY+border,camX+camW-border,camY+camH-border);