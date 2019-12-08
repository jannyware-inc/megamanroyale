centerx = x;
centery = y;
if(!dirgen){
	dirgen = true;
	
}
if(aliveFrames > 0)
	aliveFrames--;
else
	instance_destroy();
	
y+=lengthdir_y(spd,dir);
x+=lengthdir_x(spd,dir);