display_set_gui_size(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
///On Text Input Draw
//draw a rectangle that represents the text box
//make sure that this rectangle and the collision one match up
draw_set_color(c_gray);
draw_rectangle(x-30, y, x +90, y + 20, false);

//draw the text
draw_set_color(c_white);
draw_set_font(fnt_megamanSmall);
draw_set_halign(fa_center);
draw_text(x+30,y+5,label);
//draw_set_halign(fa_left);
//draw_text(x+3, y+3, input);