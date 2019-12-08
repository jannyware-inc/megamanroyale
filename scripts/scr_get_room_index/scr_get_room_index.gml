/// @desc scr_get_room_index(roomnum);
/// @arg room number

switch(argument[0]){
	case 0:
		return rm_initialize;
	case 1:
		return rm_start;
	case 2:
		return rm_introscreen;
	case 3:
		return rm_name;
	case 4:
		return rm_disconnect;
	case 10:
		return rm_clienttest;
	case 20:
		return rm_waitingroom;
	case 100:
		return rm_airman;
	case 101:
		return rm_woodman;
	case 102:
		return rm_snakeman;
	case 103:
		return rm_topman;
	case 104:
		return rm_metalman;
	case 105:
		return rm_cutman;
	case 106:
		return rm_hardman;
	case 107:
		return rm_crashman;
	default:
		return rm_initialize;
}
return "wtf2";