centerx = x;
centery = y;
if(scr_freezeexit()) return;

if(explodeTimer > 0){
	explodeTimer--;
} else {
	explodeTimer = explodeTimerMax;
	if(times > 0){
		times--;
		for(i = 0; i < explosions; i++){
			_randX = irandom(xrange);
			_randY = irandom(yrange); //ID RATHER EAT RANDY
			//show_debug_message(string(x-xrange/2+_randX) + " " + string( y-yrange/2+_randY));
			instance_create_depth(x-xrange/2+_randX,y-yrange/2+_randY,depth,obj_explosionBigParticle);
		}
	} else {
		instance_destroy();
	}
	
}