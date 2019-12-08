var resultMap = tj_decode(argument[0]);

var array = tj_get(resultMap, "cpo"); //create other players
if(array != undefined and tj_is_array(array)){
	var size = tj_size(array);
	//show_debug_message("Size = " + string(is_array(array)) + ": " +  string(array_length_1d(array)));
	for (var n = 0; n < array_length_1d(array); n++;){
		var data = json_decode(array[n]);
		//show_debug_message(string(data[? "username"]) + " is being created");
		//show_debug_message("Player create package = " + json_encode(data) + " and is ds map " + string(ds_exists(data,ds_type_map)));
		//create player
		if(global.connected == 0){
			show_debug_message("got cpo but wasn't in server");
		} else {
			with(instance_create_depth(data[? "y"],data[? "x"],0,obj_remotePlayer)){
				y = data[? "y"];
				x = data[? "x"];
				curRoom = data[? "r"];
				gotox = x;
				gotoy = y;
				username = scr_namefilter(data[? "username"]);
				uID = data[? "id"];
				weapon = data[? "w"];
				dabbing = data[? "e"];
				costume = data[? "c"];
				ds_map_add(global.playerID,uID,id);
			}
		}
	}
}
var array = tj_get(resultMap, "p"); //update positions
if(array != undefined and instance_exists(global.player)and tj_is_array(array)){
	//show_debug_message("whole update msg is: " + string(array));
	var size = tj_size(array);
	for (var n = 0; n < array_length_1d(array); n++;){
		var _player = json_decode(array[n]);
		if(!is_undefined(global.playerID[? _player[? "id"]]) and global.playerID[? _player[? "id"]] != noone and instance_exists(global.playerID[? _player[? "id"]]) and _player[? "a"] == 1){
			global.playerID[? _player[? "id"]].gotox = real(_player[? "x"]);
			global.playerID[? _player[? "id"]].gotoy = real(_player[? "y"]);
			global.playerID[? _player[? "id"]].sliding = _player[? "s"];
			global.playerID[? _player[? "id"]].hurt = _player[? "h"];
			global.playerID[? _player[? "id"]].onLadder = _player[? "l"];
			global.playerID[? _player[? "id"]].curRoom = scr_get_room_index(_player[? "r"]);
			global.playerID[? _player[? "id"]].weapon = _player[? "w"];
			global.playerID[? _player[? "id"]].dabbing = _player[? "e"];
			global.playerID[? _player[? "id"]].targetdir = _player[? "dr"];
		} else {
			show_debug_message("2 - received pos update from nonexisting player");
		}
	}
}


var array = tj_get(resultMap, "cbo"); //create bullet other
if(array != undefined and instance_exists(global.player)and tj_is_array(array)){
	var size = tj_size(array);
	for (var n = 0; n < array_length_1d(array); n++;){
		var _bullet = json_decode(array[n]);
		scr_remote_bullet_create(_bullet);
	}
}

var array = tj_get(resultMap, "dp"); //dead player
if(array != undefined and instance_exists(global.player)and tj_is_array(array)){
	//show_debug_message("Got dead player");

	var size = tj_size(array);
	//show_debug_message("Size = " + string(array_length_1d(array)));
	for (var n = 0; n < array_length_1d(array); n++;){
		//show_debug_message("bullet package: " + string(json_encode(array[n])));
		var data = json_decode(array[n]);
		if(!is_undefined(global.playerID[? data[? "id"]]) and instance_exists(global.playerID[? data[? "id"]])){
			global.playerID[? data[? "id"]].gotox = data[? "x"];
			global.playerID[? data[? "id"]].gotoy = data[? "y"];
			global.playerID[? data[? "id"]].dead = data[? "d"];
			global.playerID[? data[? "id"]].y = data[? "y"];
			global.playerID[? data[? "id"]].x = data[? "x"];
			with(global.playerID[? data[? "id"]]){
				scr_remotePlayerDie();
			}
		}
	}
}

var array = tj_get(resultMap, "dbo"); //destroy bullet other
if(array != undefined and tj_is_array(array)){
	var size = tj_size(array);
	for (var n = 0; n < array_length_1d(array); n++;){
		//show_debug_message("got dbo");
		var data = json_decode(array[n]);
		var ids = data[? "ids"];
		if(!is_undefined(global.bulletID[? ids]) and global.bulletID[? ids] != noone and instance_exists(global.bulletID[? ids])){
			instance_destroy(global.bulletID[? ids]);
		} else {
			show_debug_message("bullet was not found");
		}
		ds_map_delete(global.bulletID, ids);
	}
}
var array = tj_get(resultMap, "abo"); //act bullet other
if(array != undefined and instance_exists(global.player)and tj_is_array(array)){
	var size = tj_size(array);
	for (var n = 0; n < array_length_1d(array); n++;){
		var data = json_decode(array[n]);
		var ids = data[? "ids"];
		var myactx = data[? "x"];
		var myacty = data[? "y"];
		var myact = data[? "act"];

		if(instance_exists(global.player) and !is_undefined(global.bulletID[? ids]) and global.bulletID[? ids] != noone and instance_exists(global.bulletID[? ids])){
			global.bulletID[? ids].actx = myactx;
			global.bulletID[? ids].acty = myacty;
			global.bulletID[? ids].act = myact;
		} 
	}
}

var dpoarray = tj_get(resultMap, "dpo"); //destroy player other
if(dpoarray != undefined and is_array(dpoarray)){
	//show_debug_message("Size = " + string(is_array(array)) + ": " +  string(array_length_1d(array)));
	for (var n = 0; n < array_length_1d(dpoarray); n++;){
		//show_debug_message("DPO : " + dpoarray[n]);
		var data = json_decode(dpoarray[n]);
		//show_debug_message("DPO ID: " + string(data[? "id"]));
		if(!is_undefined(global.playerID[? data[? "id"]]) and global.playerID[? data[? "id"]] != noone and instance_exists(global.playerID[? data[? "id"]])){
			var _player = global.playerID[? data[? "id"]];
			instance_destroy(_player);
		}
		ds_map_delete(global.playerID,data[? "id"]);
	}
}

var oarray = tj_get(resultMap, "o"); //other
if(oarray != undefined and is_array(oarray)){
	//show_debug_message("Size = " + string(is_array(oarray)) + ": " +  string(array_length_1d(oarray)));
	for (var n = 0; n < array_length_1d(oarray); n++;){
		//show_debug_message("O : " + oarray[n]);
		var dataother = json_decode(oarray[n]);
		//show_debug_message("opcode: " + string(dataother[? "op"]));
		var opcode = dataother[? "op"];
		var data = dataother[? "d"]; //this is still JSON encoded.
		if(opcode == "respawn_other"){
			gmcallback_sio_on_respawn_other(data);
		} else if (opcode == "players_online"){
			gmcallback_sio_on_players_online(data);
		} else if (opcode == "lobby_online"){
			gmcallback_sio_on_lobby_online(data);
		} else if (opcode == "room_change"){
			gmcallback_sio_on_room_change(data);
		} else if(opcode == "boss_defeated"){
			gmcallback_sio_on_boss_defeated(data);
		} else if(opcode == "lobby_timer"){
			scr_network_on_lobby_timer(data);
		} else if(opcode == "room_players"){
			gmcallback_sio_on_room_players(data);
		} else if(opcode == "ready_percent"){
			gmcallback_sio_on_ready_percent(data);
		} else if(opcode == "room_info"){
			scr_network_on_room_info(data);
		} else if (opcode == "c_chg_o"){
			scr_network_on_c_chg_o(data);
		}
	}
}