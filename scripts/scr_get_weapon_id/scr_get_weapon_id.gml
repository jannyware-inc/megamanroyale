/// @desc scr_get_weapon_id(name)
/// @arg name
switch(weapon.name){
	case "megabuster":
		return 0;
	case "metalblade":
		return 1;
	case "searchsnake":
		return 2;
	case "airshooter":
		return 3;
	case "rushcoil":
		return 4;
	default:
		return -1;
}
return -2;