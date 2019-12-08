//show_debug_message(string(x) + ": " + string(y));
vh = camera_get_view_height(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);

vx = camera_get_view_x(view_camera[0]);
vw = camera_get_view_width(view_camera[0]);

viewleft = x - vw/2;
viewright = x + vw/2;

if (player.guide != noone){
	if(player.grounded){
		if(abs(yPlatform - player.y) > 25)
			yPlatform = player.y-25;
	}
	 if(abs((vh+vy)-player.y) < 60){
		yPlatform = player.y - 60;
	 }
	 if(abs(vy-player.y) < 90){
		yPlatform = player.y + 30;
	 }
	 
	 if(abs((vh+vy)-player.y) < 60){
		yPlatform = player.y - 60;
	 }
	 if(abs(vy-player.y) < 90){
		yPlatform = player.y + 30;
	 }
	
	//x follow
	//if(point_distance(x,y,global.player.x,y) > 80){
	if (player.guide.xx == "px"){
		yPlatform = player.y;
		lerpx = lerp(floor(lerpx),player.x,cameraSpeed);
		x = floor(lerpx);
		viewleft = x - vw/2;
		viewright = x + vw/2;
	
		if(player.guide.lockleft and viewleft < player.guide.bbox_left){
			x = player.guide.bbox_left + vw/2;
		}
		if(player.guide.lockright and viewright > player.guide.bbox_right){
			x = player.guide.bbox_right - vw/2;
		}
		
	}else{
		lerpx = lerp(floor(lerpx),player.guide.xx,cameraSpeed);
		x = floor(lerpx);
	}
	
	//}
	//y follow
	if (player.guide.yy == "py"){
		lerpy = lerp(lerpy,yPlatform,cameraSpeed);
		if(abs(lerpy - yPlatform) < .25){
			lerpy = yPlatform;
		}
		y = floor(lerpy);
	}else{
		yPlatform = player.y;
		lerpy = lerp(lerpy,real(player.guide.yy),cameraSpeed);
		if(abs(lerpy - player.guide.yy) < .25){
			lerpy = player.guide.yy;
		}
		y = floor(lerpy);
	}
	if (player.guide.bossRoom == 1 and global.boss != 2)
		global.boss = 1;
	else if (player.guide.bossRoom == 0)
		global.boss = 0;
	global.zone = player.guide.zone;
	
} else {
	
	global.boss = 0;
	//if(point_distance(x,y,global.player.x,y) > 80){
		x = floor(lerp(x,player.x,cameraSpeed));
		y = ceil(lerp(y,player.y,cameraSpeed));
	//}
	lerpy = y;
	lerpx = x;
}
