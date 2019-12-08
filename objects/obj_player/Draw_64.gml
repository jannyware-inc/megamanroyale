display_set_gui_size(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
draw_set_font(fnt_mmrock9);
draw_text_outlined(4,4,c_black,c_white,string_upper(username));


if(inNoPvpZone or global.boss != 0 or global.nopvp){
	draw_sprite(spr_noPVP,0,2,170);
}
/*
display_set_gui_size(window_get_width(), window_get_height());
draw_set_color(c_white);
draw_rectangle(10,200,500,300,0);
draw_set_color(c_red);
draw_text(10,200, "Y pos = " + string(y) + " X pos = " + string(x) + "\nHspd = " + string(hspd) +" Vspd = " +string(vspd) + "\nFace = " + string(face)+ "Grounded = " + string(grounded) + "\nHurt = " + string(hurt) 
+ " HurtFrames = " + string(hurtFrames) + "\niFrameTimer = " + string(iFrameTimer)
+ "\nCan Grab ladders = " + string(canGrabLadders) + " ladderY = " + string(ladderY) + "\nRunTimer = " + string(runTimer) + " onLadder = " + string(onLadder) 
+ "\nHP = " + string(hp) + " Zone = " + string(global.zone)
+"\nglobal boss = " + string(global.boss) + "JumpFrames = " + string(jumpFrames));
*/

display_set_gui_size(window_get_width(),window_get_height());

draw_set_halign(fa_left);
draw_set_font(fnt_megamanSmall);
draw_set_color(c_red);
//draw_text_outlined(2,2,c_black,c_white,"Move: WASD\nJump: K\nFire: J\nInventory: Q and E");

draw_set_font(fnt_5x5);
draw_set_color(c_red);
//draw_text(500,10,
//draw_text(60, 10, json_encode(global.playerID));

if(global.developerMode){
	display_set_gui_size(window_get_width(), window_get_height());
	draw_set_color(c_white);
	draw_rectangle(10,250,300,400,0);
	draw_set_color(c_red);
	draw_text(10,250, "Y pos = " + string(y) + " X pos = " + string(x) + "\nHspd = " + string(hspd) +" Vspd = " +string(vspd) + "\nFace = " + string(face)+ "Grounded = " + string(grounded) + "\nHurt = " + string(hurt) 
	+ " HurtFrames = " + string(hurtFrames) + "\niFrameTimer = " + string(iFrameTimer)
	+ "\nglobal nopvp" + string(global.nopvp) + " ladderY = " + string(ladderY) + "\nRunTimer = " + string(runTimer) + " onLadder = " + string(onLadder) 
	+ "\nHP = " + string(hp) + " Zone = " + string(global.zone) + "Slide Frames = " + string(slideFrames)
	+"\nglobal boss = " + string(global.boss) + "JumpFrames = " + string(jumpFrames) + "Vcollis = " + string(vCollision) + "hcollis = " + string(hCollision));
}
