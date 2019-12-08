display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

draw_set_halign(fa_center);	
draw_set_color(c_black);
draw_rectangle(0,boxHeight,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0);

//text
draw_set_font(fnt_megamanSmall);
draw_set_color(textColor);


if(singleMessage)
	draw_text(floor(camera_get_view_width(view_camera[0])/2),textCenter,message1);
else {
	draw_text(floor(camera_get_view_width(view_camera[0])/2),textTop,message1);
	draw_text(floor(camera_get_view_width(view_camera[0])/2),textBottom,message2);
}
draw_set_color(c_white);
if(drawStartText){
	draw_text(startTextX,startTextY,startText);
	draw_set_color($EEAC00);
	//draw_text(startBottomTextX,startBottomTextY,startBottomText);
	draw_set_color(c_white);
	if(global.playersOnline == 0)
		draw_text(playersOnlineTextX,playersOnlineTextY,"no players online :c");
	else if (global.playersOnline > 1)
		draw_text(playersOnlineTextX,playersOnlineTextY,string(round(global.playersOnline)) +" players online!");
	else if (global.playersOnline == 1)
		draw_text(playersOnlineTextX,playersOnlineTextY,"1 player online!");
	}
if(drawLogo){
	draw_sprite(spr_logo,0,logoX,logoY);
}
