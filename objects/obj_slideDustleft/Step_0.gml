centerx = x+4;
centery = y+4;
if(scr_freezeexit()) return;

if(aliveFrames > 0)
	aliveFrames--;
else
	instance_destroy();