with(obj_winSign){
	if(id != other.id){
		instance_destroy();
	}
}
state = "drop";
lerpSpd = .1;
gotoY = 0;
width = 160;
height = 40;
dropTimer = 30;
displayTimer = 120;
riseTimer = 30;
text = "";
heightGen = false;
textHeightGen = false;