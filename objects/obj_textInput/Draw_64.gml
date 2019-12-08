///On Text Input Draw
//draw a rectangle that represents the text box
//make sure that this rectangle and the collision one match up
draw_set_color(c_black);
//draw_rectangle(x, y, x +100, y + 20, false);
scr_draw9slice(spr_9slice_mm2,x,y,x+160,y+30);
if(focus){
	draw_set_color(c_white);
	draw_rectangle(x, y, x +160, y + 30, true);
}
//draw the text
draw_set_color(c_white);
draw_set_font(fnt_megamanSmall);
draw_set_halign(fa_center);
draw_text(x+80,y-15,label);
draw_set_halign(fa_left);
draw_set_font(fnt_joystix);
draw_text(x+6, y+6, input);