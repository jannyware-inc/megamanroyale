//scr_weaponcolors(costume, id)
switch(argument0){
	case 0: //megaman
		sprite_index = spr_megaman;
		spriteprimary = spr_megamanprimary;
		spritesecondary = spr_megamansecondary;
		spriteface = spr_megamanface;
		spriteoutline = spr_megamanoutline;
		switch(argument1){
			case 0: //megabuster
				colorprimary = $EC7000;
				colorsecondary = $D8E800;
				coloroutline = $000000;
				break;
			case 1: //metalblade
				colorprimary = $20478A;
				colorsecondary = $03FEFE;
				coloroutline = $000000;
				break;
			case 2: //search snake
				colorprimary = $4A8105;
				colorsecondary = $FFFFFF;
				coloroutline = $000000;
				break;
			case 3: //airshooter
				colorprimary = $EC7000;
				colorsecondary = $FFFFFF;
				coloroutline = $000000;
				break;
			case 4: //rushcoil
			case 6: //rushjet
				colorprimary = $0028D8;
				colorsecondary = $FFFFFF;
				coloroutline = $000000;
				break;
			case 5: //hyperbomb
				colorprimary = $009400;
				colorsecondary = $03FEFE;
				coloroutline = $000000;
				break;
			case 7: //timestopper
				colorprimary = $BC00BC;
				colorsecondary = $FCC4FC;
				coloroutline = $000000;
				break;
			case 8: //rollingcutter
				colorprimary = $787878;
				colorsecondary = $FFFFFF;
				coloroutline = $000000;
				break;
		}
	break;
	case 1: //bass
		sprite_index = spr_bassface;
		spriteprimary = noone;
		spritesecondary = noone;
		spriteface = spr_bassface;
		spriteoutline = noone;
		
		switch(argument1){
			case 0: //megabuster
				colorprimary = $3898F8;
				colorsecondary = $707070;
				coloroutline = $000000;
				break;
			case 1: //metalblade
				colorprimary = $20478A;
				colorsecondary = $03FEFE;
				coloroutline = $000000;
				break;
			case 2: //search snake
				colorprimary = $4A8105;
				colorsecondary = $FFFFFF;
				coloroutline = $000000;
				break;
			case 3: //airshooter
				colorprimary = $EC7000;
				colorsecondary = $FFFFFF;
				coloroutline = $000000;
				break;
			case 4: //rushcoil
			case 6: //rushjet
				colorprimary = $0028D8;
				colorsecondary = $FFFFFF;
				coloroutline = $000000;
				break;
			case 5: //hyperbomb
				colorprimary = $009400;
				colorsecondary = $03FEFE;
				coloroutline = $000000;
				break;
			case 7: //timestopper
				colorprimary = $BC00BC;
				colorsecondary = $FCC4FC;
				coloroutline = $000000;
				break;
			case 8: //rollingcutter
				colorprimary = $787878;
				colorsecondary = $FFFFFF;
				coloroutline = $000000;
				break;
		}
	break;
}
