centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}
if(scr_freezeexit()) return;

if(hp <= 0){
	scr_randomGoodDrop();
	scr_explodeSmall();
	instance_destroy();
}