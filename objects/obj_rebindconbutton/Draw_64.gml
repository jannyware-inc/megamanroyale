display_set_gui_size(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
///On Text Input Draw
//draw a rectangle that represents the text box
//make sure that this rectangle and the collision one match up
draw_set_color(c_gray);
//draw_rectangle(x, y, x +20, y + 20, false);
scr_draw9slice(spr_9slice_mm2, x-10, y, x +30, y + 20);

//draw the text
draw_set_color(c_white);
draw_set_font(fnt_megamanSmall);
draw_set_halign(fa_center);
if(label != noone){
	if(label == "??"){
		draw_text(x+10,y+5,label);
	} else {
		draw_text(x+10,y+5,scr_keycharacter(label));
	}
}
draw_text(x+10,y-10,toplabel);
//draw_set_halign(fa_left);
//draw_text(x+3, y+3, input);