//dt+=delta_time;
if(blackTimer == black1){
	//layer_y(layer_get_id("black1"),500);//WHY DOES THIS NOT WORK ON HTML5
	black1Draw = false;
}
if(blackTimer == black2){
	//layer_y(layer_get_id("black2"),500);
	black2Draw = false;
}
if(blackTimer == black3){
	///layer_y(layer_get_id("black3"),500);
	black3Draw = false;
}

blackTimer++;
if(bossY < bossEndY and (bossY+bossYSpeed< bossEndY)){
	bossY += bossYSpeed;
} else {
	bossY = bossEndY;
	if(bossWaitTimer > 0){
		bossWaitTimer--;
	} else {
		bossIndex += bossFramerate;
		if(bossIndex > 7){
			bossIndex = 7;
		}
	}
}

if(bossIndex == 7){
	//show_debug_message(bossNameIndex);
	bossNameIndex += bossNameSpeed;
}

if(blackTimer == endTime){ //blackTimer == endTime or  dt >= enddt
	audio_stop_all();
	room_goto(global.roomGoto);
}
