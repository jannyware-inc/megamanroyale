centerx = x;
centery = y;
if(scr_freezeexit()) return;
if(aliveFrames > 0)
	aliveFrames--;
else
	instance_destroy();
	
y+=lengthdir_y(spd,dir);
x+=lengthdir_x(spd,dir);

if(sprite_index == spr_hyperbombmisfire){
	rotSpd += rotSpd;
	image_angle = floor(rotSpd/90)*90;
}