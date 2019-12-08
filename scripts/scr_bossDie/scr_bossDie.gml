/// @desc scr_bossDie(x, y)
/// @arg x
/// @arg y


explosion = instance_create_depth(argument[0],argument[1],-700,obj_explosionPlayer);
audio_play_sound(snd_playerExplosion,10,0);
global.player.canInput = false;

with(obj_music_spawner){
	stop = true;
}