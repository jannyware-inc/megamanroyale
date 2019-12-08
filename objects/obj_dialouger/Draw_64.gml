
	draw_set_color(c_black);
	draw_roundrect(boxX-8,boxY-8,boxX+boxW+8,boxY+boxH+8,false);
	draw_set_color(c_white);
	draw_roundrect(boxX-6,boxY-6,boxX+boxW+6,boxY+boxH+6,false);
	draw_set_color(c_black);
	draw_roundrect(boxX,boxY,boxX+boxW,boxY+boxH,false);
	draw_set_color(c_white);
	draw_set_font(fnt_comicsans);
	draw_text(boxX+indX,boxY+indY,msgCurrent);
	