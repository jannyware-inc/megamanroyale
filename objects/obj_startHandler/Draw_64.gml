display_set_gui_size(camW,camH);
draw_set_color(c_white);
draw_set_font(fnt_megamanSmall);
draw_sprite_ext(spr_logotransparent, 0, camW/2+3, camH/2-50+3,1,1,0,c_black,.4);
draw_sprite(spr_logotransparent,0,camW/2,camH/2-50);

draw_set_halign(fa_center);
if(global.playersOnline == noone){
	draw_set_alpha(.2);
	draw_text_outlined(camW/2+3,camH-80+3,c_black,c_black,"Connecting to server...");
	draw_set_alpha(1);
	draw_text_outlined(camW/2,camH-80,c_black,c_white,"Connecting to server...");
} else if (global.playersOnline == 0){
	draw_set_alpha(.2);
	draw_text_outlined(camW/2+3,camH-80+3,c_black,c_black,"No players online");
	draw_set_alpha(1);
	draw_text_outlined(camW/2,camH-80,c_black,c_white,"No players online");
} else if (global.playersOnline == 1){
	
	draw_set_alpha(.2);
	draw_text_outlined(camW/2-(string_width(" Player Online!")/2)+3,camH-80+3,c_black,c_black,string(global.playersOnline));
	draw_text_outlined(camW/2+1+3,camH-80+3,c_black,c_black,"  Player Online!");
	draw_set_alpha(1);
	
	draw_text_outlined(camW/2-(string_width(" Player Online!")/2),camH-80,c_black,c_lime,string(global.playersOnline));
	draw_text_outlined(camW/2+1,camH-80,c_black,c_white,"  Player Online!");
} else if (global.playersOnline > 1){
	
	draw_set_alpha(.2);
	draw_text_outlined(camW/2-(string_width(" Players Online!")/2)-string_width(string(global.playersOnline)/2)+3,camH-80+3,c_black,c_black,string(global.playersOnline));
	draw_text_outlined(camW/2+string_width(string(global.playersOnline))+3,camH-80+3,c_black,c_black," Players Online!");
	draw_set_alpha(1);
	
	draw_text_outlined(camW/2-(string_width(" Players Online!")/2)-string_width(string(global.playersOnline)/2),camH-80,c_black,c_lime,string(global.playersOnline));
	draw_text_outlined(camW/2+string_width(string(global.playersOnline)),camH-80,c_black,c_white," Players Online!");
}
draw_set_font(fnt_megaman);
if(blinkTimer > blinkTimerMax/2){
	draw_set_alpha(.2);
	draw_text_outlined(camW/2+3,camH-100+3,c_black,c_black,"Press Enter!");
	draw_set_alpha(1);
	draw_text_outlined(camW/2,camH-100,c_black,c_lime,"Press Enter!");
}

draw_set_font(fnt_joystix);
draw_set_alpha(.2);
//draw_text_outlined(camW/2+3,camH-28+3,c_black,c_black,"A not-for-profit fan game by Jannyware");
draw_text_outlined(camW/2+3,camH-18+3,c_black,c_black,"A not-for-profit fan game by Jannyware");
draw_set_alpha(1);
//draw_text_outlined(camW/2,camH-28,c_black,c_white,"A not-for-profit fan game by Jannyware");
draw_text_outlined(camW/2,camH-18,c_black,c_white,"A not-for-profit fan game by Jannyware");
draw_set_alpha(.2);
//draw_text_outlined(camW/2+3,camH-18+3,c_black,c_black,"Follow me on twitter @Jannyware!");
draw_set_alpha(1);
//draw_text_outlined(camW/2,camH-18,c_black,$EEAC00,"Follow me on twitter @Jannyware!");
draw_set_halign(fa_right);

draw_set_alpha(.2);
draw_text_outlined(camW-18+3,camH-18+3,c_black,c_black,version);
draw_set_alpha(1);
draw_text_outlined(camW-18,camH-18,c_black,$FFFF00,version);

draw_set_halign(fa_left);