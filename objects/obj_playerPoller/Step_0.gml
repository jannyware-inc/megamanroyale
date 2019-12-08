
if(global.server){
	if(lobbyTimer > 0){
		lobbyTimer--;
	} else {
		lobbyTimer = lobbyTimerMax;
		sio_emit_get_lobby_online();
	}
}