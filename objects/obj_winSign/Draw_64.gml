display_set_gui_size(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));

draw_set_color(c_white);
scr_draw9slice(spr_9slice_mm2,x-width/2,y,x+width/2,y+height);
draw_set_font(fnt_joystix);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x , y + height/2, text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);