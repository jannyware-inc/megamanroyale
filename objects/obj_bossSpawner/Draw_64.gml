/*
if(youWin){
	draw_set_font(fnt_comicsans);
	display_set_gui_size(1280,720);
	draw_set_color(c_black);
	draw_rectangle(0,0,1280,720,0);
	draw_set_color(c_white);
	//draw_sprite(spr_youWin,0,100,0);
	draw_set_color(c_red);
	draw_text(550,200,"YOU WIN!!!!!");
} 
*/
display_set_gui_size(camW,camH);
if(drawSpectateMessage){
	draw_set_font(fnt_megamanSmall);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	_strW = string_width("Press START to exit to lobby");
	_strH = string_height("Press START to exit to lobby");
	scr_draw9slice(spr_9slice_mm2,camW/2-_strW/2-8,camH-30-8,camW/2+_strW/2+8, camH-30+_strH+18);
	draw_text_outlined(camW/2,camH-20,c_black,c_white,"Press START to exit to lobby");
	if(global.placed!= noone){
		if(global.placed%10 == 1 and global.placed != 11){
			if(global.placed == 1){
				draw_set_color($00d7ff);
			}
			draw_text(camW/2,camH-30,"You placed " + string(global.placed) +"st!");
		} else if (global.placed%10 == 2 and global.placed != 12){
			if(global.placed == 2){
				draw_set_color($c0c0c0);
			}
			draw_text(camW/2,camH-30,"You placed " + string(global.placed) +"nd!");
		} else if (global.placed%10 == 3 and global.placed != 13){
			if(global.placed == 3){
				draw_set_color($327fcd);
			}
			draw_text(camW/2,camH-30,"You placed " + string(global.placed) +"rd!");
		} else {
			draw_text(camW/2,camH-30,"You placed " + string(global.placed) +"th!");
		}
	}
	draw_set_halign(fa_left);
}
