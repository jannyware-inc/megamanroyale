timer++;
if(gotPing == 1){
	gotPing = 0;
	framesSinceLastUpdate = timer;
	timer = 0;
}