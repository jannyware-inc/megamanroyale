//external surface for time stopper

if(!surface_exists(behind_surface) or global.scale != lastscale){
	lastscale = global.scale;
	behind_surface = surface_create(300*global.scale,300*global.scale);
}
//surface_copy_part(behind_surface, 0, 0, application_surface, global.scale*(-30+floor(x) - camera_get_view_x(view_camera[0])),3*(-30+ceil(centery) - camera_get_view_y(view_camera[0])) , 60*global.scale,60*global.scale);

surface_set_target(behind_surface);
draw_clear(c_black);
surface_copy_part(behind_surface, 0, 0, application_surface, global.scale*(-150+floor(player.x) - camera_get_view_x(view_camera[0])),global.scale*(-150+ceil(player.centery) - camera_get_view_y(view_camera[0])) , 300*global.scale,300*global.scale);
//surface_copy_part(behind_surface, 0, 0, application_surface, 3*(-150+floor(global.player.x) - camera_get_view_x(view_camera[0])), 3*(-150+ceil(global.player.centery) - camera_get_view_y(view_camera[0])) , 300*3,300*3);
gpu_set_blendmode(bm_subtract);
//draw_circle(150, 150, 10, false);

draw_sprite_ext(spr_weapon_timestoppermask,0,150*global.scale,150*global.scale,global.scale*rad/radMax,global.scale*rad/radMax,0,c_black,1);
if(rad < radMax){
	draw_rectangle(0,0,global.scale*(150-(150*rad/radMax)),global.scale*300,0);
	draw_rectangle(0,0,global.scale*300,global.scale*(150-(150*rad/radMax)),0);
	draw_rectangle(global.scale*300,0,global.scale*(300-(150-(150*rad/radMax))),global.scale*300,0);
	draw_rectangle(0,global.scale*300,global.scale*(300-(150-(150*rad/radMax))),global.scale*(300-(150-(150*rad/radMax))),0);
	
}

//draw_rectangle(0,0,150*global.scale*rad/radMax,global.scale*(150-(150*rad/radMax)),0);
gpu_set_blendmode(bm_normal);
surface_reset_target();
shader_set(shd_invert);

draw_surface_ext(behind_surface, floor(player.x-150), ceil(player.centery-150),1/global.scale,1/global.scale,0,c_white,1);
shader_reset();