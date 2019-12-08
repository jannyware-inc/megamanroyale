/// @description Counting Step
if(counting){
	//time = ;
	framespassed += (delta_time/1000000)*frametime;
	//frames = passed;
	framespassed -= 1;
	if(framespassed < 0){
		framespassed = 0;
	} else if (framespassed > 60){
		framespassed = 60;
	}
	
	
    while(framespassed > 1){
           //EXECUTE HERE WHAT YOU WANT TO HAPPEN EVERY "interval" for every object you need
			/*
			with(obj_player){
				event_perform(ev_step,0);
			}
			with(obj_remotePlayer){
				event_perform(ev_step,0);
			}
			with(obj_enemy){
				event_perform(ev_step,0);
			}
			with(obj_remoteBullet){
				event_perform(ev_step,0);
			}
			with(obj_remoterush){
				event_perform(ev_step,0);
			}
			with(obj_emitter){
				event_perform(ev_step,0);
			}
			with(obj_stageIntroHandler){
				event_perform(ev_step,0);
			}
			*/
			event_perform(ev_keyboard, 0);
			event_perform(ev_keypress, 0);
			event_perform(ev_keyrelease, 0);
			with(all){
				if(id != other.id){
					event_perform(ev_step,0);
				}
			}
			
			//show_debug_message("passed");
            framespassed--;
        }
}