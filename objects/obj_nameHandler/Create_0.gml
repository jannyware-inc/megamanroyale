alignTop = 15;
alignBottom = 200;
textBottom = "";
textTop = "enter your username:";
audio_stop_all();

if(global.oldmusic){
	audio_play_sound(mus_mm2passwordloop,100,true);
} else {
	audio_play_sound(mus_mm2PasswordRoryButler,100,true);
}
show_debug_message("username = " + string(global.username));
nameInput = instance_create_depth(camera_get_view_width(view_camera[0])/2-80,64,depth-100,obj_textInput);
with(nameInput){
	label = "Username:";
	focus = true;
	input = global.username;
}

blinkTimer = 0;

button = instance_create_depth(camera_get_view_width(view_camera[0])/2-30,128,depth-100,obj_button);
rebindButton = instance_create_depth(camera_get_view_width(view_camera[0])-155+30,40,depth-100,obj_button);
with(rebindButton){
	label = "Rebind controls";
}

singleplayerButton = instance_create_depth(camera_get_view_width(view_camera[0])-155+30,10,depth-100,obj_button);
with(singleplayerButton){
	label = "Single Player";
}

clickableTwitter = instance_create_depth(16+16+4+7,camera_get_view_height(view_camera[0])-8-32,depth-100,obj_clickable_twitter);
clickableDiscord = instance_create_depth(8+32+8+16+16+16+4+6+7,camera_get_view_height(view_camera[0])-8-32,depth-100,obj_clickable_discord);