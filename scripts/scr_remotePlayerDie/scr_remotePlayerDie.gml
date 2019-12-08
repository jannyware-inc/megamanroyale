invisible = true;
explosion = instance_create_depth(x,centery,-650,obj_explosionPlayer);
audio_play_sound(snd_playerExplosion,10,0);
instance_create_depth(centerx,y,-700,obj_deathmarkersmall);