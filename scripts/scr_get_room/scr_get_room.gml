/// @desc scr_get_room (index)

switch(argument[0]){
	case rm_initialize:
		return 0;
	case rm_start:
		return 1;
	case rm_introscreen:
		return 2;
	case rm_name:
		return 3;
	case rm_disconnect:
		return 4;
	case rm_clienttest:
		return 10;
	case rm_waitingroom:
		return 20;
	case rm_airman:
		return 100;
	case rm_woodman:
		return 101;
	case rm_snakeman:
		return 102;
	case rm_topman:
		return 103;
	case rm_metalman:
		return 104;
	case rm_cutman:
		return 105;
	case rm_hardman:
		return 106;
	case rm_crashman:
		return 107;
	default:
		return -1;
}
return -2;