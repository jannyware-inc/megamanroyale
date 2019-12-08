centerx = x;
centery = y;

if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

if(!scr_inView())
	instance_destroy();
		
if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(1);
	instance_destroy();
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

	
if (state == "attack"){
	if (abs(centerx - global.playerCenterx) > abs(centery - global.playerCentery))
					dir = point_direction(centerx,global.playerCentery, global.playerCenterx, global.playerCentery); //flat line left or right
				else
					dir = point_direction(global.playerCenterx,centery, global.playerCenterx, global.playerCentery); //flat line up or down
	len = spd;
	hspd = lengthdir_x(len,dir);
	vspd = lengthdir_y(len,dir);
}
x += hspd;
y += vspd;
