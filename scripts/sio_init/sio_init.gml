gml_pragma("global", "sio_init()");

#region macros
	#macro IP "127.0.0.1"
	#macro PORT 25560
#endregion

#region SocketIO
		sio_connect(IP, PORT);
#endregion

#region SocketIO:Events
	sio_addEvent("create_player");
	//sio_addEvent("create_player_other");
	//sio_addEvent("destroy_player");
	//sio_addEvent("position_update");
	//sio_addEvent("position_create");
	//sio_addEvent("bullet_create");
	//sio_addEvent("die_other");
	sio_addEvent("respawn_other");
	sio_addEvent("room_change");
	sio_addEvent("pong");
	sio_addEvent("players_online");
	sio_addEvent("lobby_online");
	sio_addEvent("boss_defeated");
	sio_addEvent("room_players");
	sio_addEvent("bullet_delete");
	sio_addEvent("ready_percent");
	sio_addEvent("you_placed");
	sio_addEvent("updateall");
#endregion
