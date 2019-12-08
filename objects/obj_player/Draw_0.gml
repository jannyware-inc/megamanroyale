//draw_sprite(spr_player_shadow, image_index, x, y);
//draw_self();
//shader_set(shd_invert);


//scr_weaponcolors(weapon.weaponid);
scr_costumeandcolors(global.costume,weapon.weaponid);

if(skipDraw){
	return;
}

if(!invisible){
	if(spriteoutline != noone)
		draw_sprite_ext(spriteoutline, image_index, floor(x), ceil(y-.01)+((sideUp == -1)*(-20)),sideFacing,sideUp,image_angle,coloroutline,1);
	if(spriteprimary != noone)
		draw_sprite_ext(spriteprimary, image_index, floor(x), ceil(y-.01)+((sideUp == -1)*(-20)),sideFacing,sideUp,image_angle,colorprimary,1);
	if(spritesecondary != noone)
		draw_sprite_ext(spritesecondary, image_index, floor(x), ceil(y-.01)+((sideUp == -1)*(-20)),sideFacing,sideUp,image_angle,colorsecondary,1);
	if(spriteface != noone)
		draw_sprite_ext(spriteface, image_index, floor(x), ceil(y-.01)+((sideUp == -1)*(-20)),sideFacing,sideUp,image_angle,c_white,1);
}

/*
if(!invisible){
	draw_sprite_ext(sprite_index, image_index, floor(x), ceil(y)+((sideUp == -1)*(-20)),sideFacing,sideUp,image_angle,c_white,1);
}
*/


draw_set_halign(fa_center);
draw_set_font(fnt_5x5);
//outline_start(2,colorsecondary);
if(!surface_exists(name_surface) or weapon != lastweapon){
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
draw_surface_ext(name_surface,floor(x) - namewidth/2, floor(y)-35-nameheight/2,1,1,0,c_white,1);
//draw_text(floor(x),floor(y)+35,shakeFrames);
//draw_text_outlined(floor(x),floor(y)-35,colorsecondary,colorprimary,username);

//outline_end();
//shader_set(sh_outline);
//draw_text(floor(x),floor(y)-35,username);
//shader_reset();


//draw_sprite(mask_index, image_index, x, y);
draw_set_halign(fa_left);

//shader_reset();