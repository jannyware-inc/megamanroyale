draw_set_font(fnt_5x5);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_outlined(x,y,c_black,c_white,"Lobby Progress:\n" + string(global.lobbyCurrent) + "/" + string(global.lobbyTarget) + " players\n" + string(global.nextLevel));