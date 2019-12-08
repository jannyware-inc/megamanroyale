if(!inRoom){
	return;
}
scr_costumeandcolors(costume,weapon);
if(!invisible){
	//draw_sprite_ext(sprite_index, image_index, floor(x), ceil(y),sideDraw,image_yscale,image_angle,c_white,.5);
	if(spriteoutline != noone)
		draw_sprite_ext(spriteoutline, image_index, floor(x), ceil(y-.01)+((sideUp == -1)*(-20)),sideDraw,sideUp,image_angle,coloroutline,global.remotealpha);
	if(spriteprimary != noone)
		draw_sprite_ext(spriteprimary, image_index, floor(x), ceil(y-.01)+((sideUp == -1)*(-20)),sideDraw,sideUp,image_angle,colorprimary,global.remotealpha);
	if(spritesecondary)
		draw_sprite_ext(spritesecondary, image_index, floor(x), ceil(y)+((sideUp == -1)*(-20)),sideDraw,sideUp,image_angle,colorsecondary,global.remotealpha);
	if(spriteface != noone)
		draw_sprite_ext(spriteface, image_index, floor(x), ceil(y-.01)+((sideUp == -1)*(-20)),sideDraw,sideUp,image_angle,c_white,global.remotealpha);
}
draw_set_alpha(global.remotealpha*.66);
//nametag
draw_set_halign(fa_center);
draw_set_font(fnt_5x5);
draw_set_color(c_red);

if(!surface_exists(name_surface) or weapon != lastweapon){
	draw_set_alpha(1);
	namewidth = string_width(username) + 4;
	nameheight = string_height(username) + 4;
	name_surface = surface_create(namewidth, nameheight);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top); 
	surface_set_target(name_surface);
	//show_debug_message("nw= " + string(namewidth) + " nh = " + string(nameheight));
	draw_text_outlined(2, 2, colorsecondary, colorprimary, username);
	surface_reset_target();
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
draw_surface_ext(name_surface,floor(x) - namewidth/2, floor(y)-35-nameheight/2,1,1,0,c_white,global.remotealpha*.66);
lastweapon = weapon;
draw_text(x,y-55,inRoom);


//draw_text_outlined(floor(x),floor(y)-35,colorsecondary,colorprimary,username);
//shader_set(sh_outline);
//draw_text(floor(x),floor(y)-35,username);
//shader_reset();
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_alpha(1);