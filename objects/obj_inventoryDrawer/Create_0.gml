camH = camera_get_view_height(view_camera[0]);
camW = camera_get_view_width(view_camera[0]);

boxH = 20;
boxW = 102;
boxX = 2;
boxY = camH-2;
itemStartX = 12;
itemStartY = 8;
itemDeltaX = 20;
numHeight = -20;
//numX = -3;
numX = 0;

livesX = 2+sprite_get_width(spr_pickup_1up)/2;
livesY = camH - 34;
dropX = 2;
dropY = camH - 58;