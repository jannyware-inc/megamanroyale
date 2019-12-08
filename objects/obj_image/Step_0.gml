centerx = x;
centery = y;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
if(scr_freezeexit()) return;

if(!genMask){
	genMask = true;
	sprite_index = sprite;
}