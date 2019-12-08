//scr_keycharacter(value)
switch (argument0)
{
    case 8: return "BACKSPACE"; break;
    case 9: return "TAB"; break;
   
    case 13: return "ENTER"; break;
	case 16: return "SHIFT"; break;
	case 17: return "CTRL"; break;
	case 18: return "ALT"; break;
	
    case 19: return "PAUSE/BREAK"; break;
    case 20: return "CAPS LOCK"; break;
   
    case 27: return "ESC"; break;
   
    case 32: return "SPACE"; break;
    case 33: return "PAGEUP"; break;
    case 34: return "PAGEDOWN"; break;
    case 35: return "END"; break;
    case 36: return "HOME"; break;  
    case 37: return "LEFT"; break;
    case 38: return "UP"; break;
    case 39: return "RIGHT"; break;
    case 40: return "DOWN"; break;
   
    case 45: return "INSERT"; break;
    case 46: return "DELETE"; break;
   
    case 48: return "0"; break;
    case 49: return "1"; break;
    case 50: return "2"; break;
    case 51: return "3"; break;
    case 52: return "4"; break;
    case 53: return "5"; break;
    case 54: return "6"; break;
    case 55: return "7"; break;
    case 56: return "8"; break;
    case 57: return "9"; break;
   
    case 65: return "A"; break;
    case 66: return "B"; break;
    case 67: return "C"; break;
    case 68: return "D"; break;
    case 69: return "E"; break;
    case 70: return "F"; break;
    case 71: return "G"; break;
    case 72: return "H"; break;
    case 73: return "I"; break;
    case 74: return "J"; break;
    case 75: return "K"; break;
    case 76: return "L"; break;
    case 77: return "M"; break;
    case 78: return "N"; break;
    case 79: return "O"; break;
    case 80: return "P"; break;
    case 81: return "Q"; break;
    case 82: return "R"; break;
    case 83: return "S"; break;
    case 84: return "T"; break;
    case 85: return "U"; break;
    case 86: return "V"; break;
    case 87: return "W"; break;
    case 88: return "X"; break;
    case 89: return "Y"; break;
    case 90: return "Z"; break;
    case 91: return "LEXPLORER"; break;
    case 92: return "REXPLORER"; break;
   
    case 96: return "NUM0"; break;
    case 97: return "NUM1"; break;
    case 98: return "NUM2"; break;
    case 99: return "NUM3"; break;
    case 100: return "NUM4"; break;
    case 101: return "NUM5"; break;
    case 102: return "NUM6"; break;
    case 103: return "NUM7"; break;
    case 104: return "NUM8"; break;
    case 105: return "NUM9"; break;
   
    case 106: return "*"; break;
    case 107: return "+"; break;
    case 109: return "-"; break;
    case 110: return "."; break;
    case 111: return "/"; break;
   
    case 112: return "F1"; break;
    case 113: return "F2"; break;
    case 114: return "F3"; break;
    case 115: return "F4"; break;
    case 116: return "F5"; break;
    case 117: return "F6"; break;
    case 118: return "F7"; break;
    case 119: return "F8"; break;
    case 120: return "F9"; break;
    case 121: return "F10"; break;
    case 122: return "F11"; break;
    case 123: return "F12"; break;
   
    case 144: return "NUM LOCK"; break;
    case 145: return "SCROLL LOCK"; break;
   
    case 160: return "LSHIFT"; break;
    case 161: return "RSHIFT"; break;
    case 162: return "LCTRL"; break;
    case 163: return "RCTRL"; break;
    case 164: return "LALT"; break;
    case 165: return "RALT"; break;
   
    case 186: return ";"; break;
    case 187: return "="; break;
    case 188: return ","; break;
    case 189: return "_"; break;
    case 190: return "."; break;
    case 191: return "/"; break;
    case 192: return "~"; break;
   
    case 219: return "["; break;
    case 220: return "|"; break;
    case 221: return "]"; break;
    case 222: return "'"; break;
	
	case gp_padu: return "gp.U"; break;
	case gp_padl: return "gp.L"; break;
	case gp_padr: return "gp.R"; break;
	case gp_padd: return "gp.D"; break;
	case gp_face1: return "gp.F1"; break;
	case gp_face2: return "gp.F2"; break;
	case gp_face3: return "gp.F3"; break;
	case gp_face4: return "gp.F4"; break;
	case gp_start: return "gp.ST"; break;
	case gp_select: return "gp.SL"; break;
	case gp_shoulderr: return "gp.R1"; break;
	case gp_shoulderrb: return "gp.R2"; break;
	case gp_shoulderl: return "gp.L1"; break;
	case gp_shoulderlb: return "gp.L2"; break;
   
    default: 
		//show_debug_message("Invalid key: " + string(argument0));
		return "INVALID"
}