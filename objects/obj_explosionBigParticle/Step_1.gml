centerx = x;
centery = y;
if(scr_freezeexit()) return;

if(aliveFrames > 0)
	aliveFrames--;
else
	instance_destroy();