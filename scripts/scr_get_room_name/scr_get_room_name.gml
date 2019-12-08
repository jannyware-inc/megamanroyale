/// @desc scr_get_room_name(roomnum);
/// @arg roomnumber

switch(argument[0]){
	case 0:
		return "rm_initialize";
	case 1:
		return "rm_start";
	case 2:
		return "rm_introscreen";
	case 3:
		return "rm_name";
	case 4:
		return "rm_disconnect";
	case 10:
		return "Test room";
	case 20:
		return "Waiting Lobby";
	case 100:
		return "Air Man Stage";
	case 101:
		return "Wood Man Stage";
	case 102:
		return "Snake Man Stage";
	case 103:
		return "Top Man Stage";
	case 104:
		return "Metal Man Stage";
	case 105:
		return "Cut Man Stage";
	case 106:
		return "Hard Man Stage";
	case 107:
		if(irandom(1) == 0){
			return "Crash Man Stage";
		} else {
			return "Clash Man Stage";
		}
	default:
		return "wtf";
}
return "wtf2";