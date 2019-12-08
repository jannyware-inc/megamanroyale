var _lastNum = invNum;
if(inv1keypress){
	invNum = 0;
} else if(inv2keypress){
	invNum = 1;
} else if(inv3keypress){
	invNum = 2;
} else if(inv4keypress){
	invNum = 3;
} else if(inv5keypress){
	invNum = 4;
} else if(invfkeypress){
	invNum++;
	if(invNum > 4){
		for(var i = 0; i < 5; i++){
			if(weapons[i].selectable){
				invNum = i;
				break;
			}
		}
	} else {
		for(var i = invNum; i < 5; i++){
			if(weapons[i].selectable){
				invNum = i;
				break;
			}
		}
	}
} else if(invbkeypress){
	invNum--;
	if(invNum < 0){
		for(var i = 4; i >= 0 ; i--){
			if(weapons[i].selectable){
				invNum = i;
				break;
			}
		}
	} else {
		for(var i = invNum; i >= 0; i--){
			if(weapons[i].selectable){
				invNum = i;
				break;
			}
		}
	}
}

weapon = weapons[invNum];
if(weapon.selectable == false){
	invNum = _lastNum;
	weapon = weapons[_lastNum];
} 

if(_lastNum != invNum){
	scr_playNoOverlap(snd_select);
}