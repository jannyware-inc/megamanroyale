camX = camera_get_view_x(view_camera[0]);
camY = camera_get_view_y(view_camera[0]);
camW = camera_get_view_width(view_camera[0]);
camH = camera_get_view_height(view_camera[0]);
border = 20;



buttonCol1 = 40;
buttonCol2 = 90;
buttonCol2c = 140;
buttonCol3 = 200;
buttonCol4 = 250;
buttonCol4c = 300;
buttonCol5 = 360;
buttonCol6 = 410;
buttonCol6c = 460;

buttonRow1 = 50;
buttonRow2 = 85;
buttonRow3 = 120;
buttonRow4 = 155;
buttonRow5 = 190

buttonRow1i = 50;
buttonRow2i = 85;
buttonRow3i = 120;
buttonRow4i = 155;
buttonRow5i = 190;

returnButton = instance_create_depth(camX+camW/2-60,camY+camH-25,depth-100,obj_button);
with(returnButton){
	label = "return";
}


buttonWoodman = instance_create_depth(camX + buttonCol2, camY + buttonRow1, depth-100, obj_button);
with(buttonWoodman){
	label = "Wood Man";
	gotostage = rm_woodman;
}

buttonAirman = instance_create_depth(camX + buttonCol2, camY + buttonRow2, depth-100, obj_button);
with(buttonAirman){
	label = "Air Man";
	gotostage = rm_airman;
}


buttonSnakeman = instance_create_depth(camX + buttonCol2, camY + buttonRow3, depth-100, obj_button);
with(buttonSnakeman){
	label = "Snake Man";
	gotostage = rm_snakeman;
}


buttonTopman = instance_create_depth(camX + buttonCol2, camY + buttonRow4, depth-100, obj_button);
with(buttonTopman){
	label = "Top Man";
	gotostage = rm_topman;
}

buttonMetalman = instance_create_depth(camX + buttonCol2, camY + buttonRow5, depth-100, obj_button);
with(buttonMetalman){
	label = "Metal Man";
	gotostage = rm_metalman;
}


buttonCutman = instance_create_depth(camX + buttonCol4, camY + buttonRow1, depth-100, obj_button);
with(buttonCutman){
	label = "Cut Man";
	gotostage = rm_cutman;
}

buttonHardman = instance_create_depth(camX + buttonCol4, camY + buttonRow2, depth-100, obj_button);
with(buttonHardman){
	label = "Hard Man";
	gotostage = rm_hardman;
}

buttonCrashman = instance_create_depth(camX + buttonCol4, camY + buttonRow3, depth-100, obj_button);
with(buttonCrashman){
	if(irandom(1)){
		label = "Crash Man";
	} else {
		label = "Clash Man";
	}
	gotostage = rm_crashman;
}

/*
rebindButtoninvfkey1 = instance_create_depth(camX + buttonCol3, camY + buttonRow4, depth-100, obj_rebindbutton);
with(rebindButtoninvfkey1){
	toplabel = "                    ";
	bind = global.invfkey1;
}
rebindButtoninvfkey2 = instance_create_depth(camX + buttonCol4, camY + buttonRow4, depth-100, obj_rebindbutton);
with(rebindButtoninvfkey2){
	toplabel = "Inv.Forward";
	bind = global.invfkey2;
}
rebindButtoninvfcon = instance_create_depth(camX + buttonCol4c, camY + buttonRow4, depth-100, obj_rebindconbutton);
with(rebindButtoninvfcon){
	toplabel = "";
	bind = global.invfcon;
}
rebindButtoninvbkey1 = instance_create_depth(camX + buttonCol3, camY + buttonRow5, depth-100, obj_rebindbutton);
with(rebindButtoninvbkey1){
	toplabel = "                     ";
	bind = global.invbkey1;
}
rebindButtoninvbkey2 = instance_create_depth(camX + buttonCol4, camY + buttonRow5, depth-100, obj_rebindbutton);
with(rebindButtoninvbkey2){
	toplabel = "Inv.Back";
	bind = global.invbkey2;
}
rebindButtoninvbcon = instance_create_depth(camX + buttonCol4c, camY + buttonRow5, depth-100, obj_rebindconbutton);
with(rebindButtoninvbcon){
	toplabel = "";
	bind = global.invbcon;
}
rebindButtoninv1key1 = instance_create_depth(camX + buttonCol5, camY + buttonRow1i, depth-100, obj_rebindbutton);
with(rebindButtoninv1key1){
	toplabel = "                       ";
	bind = global.inv1key1;
}
rebindButtoninv1key2 = instance_create_depth(camX + buttonCol6, camY + buttonRow1i, depth-100, obj_rebindbutton);
with(rebindButtoninv1key2){
	toplabel = "Inv.1";
	bind = global.inv1key2;
}
rebindButtoninv1con = instance_create_depth(camX + buttonCol6c, camY + buttonRow1i, depth-100, obj_rebindconbutton);
with(rebindButtoninv1con){
	toplabel = "";
	bind = global.inv1con;
}
rebindButtoninv2key1 = instance_create_depth(camX + buttonCol5, camY + buttonRow2i, depth-100, obj_rebindbutton);
with(rebindButtoninv2key1){
	toplabel = "                       ";
	bind = global.inv2key1;
}
rebindButtoninv2key2 = instance_create_depth(camX + buttonCol6, camY + buttonRow2i, depth-100, obj_rebindbutton);
with(rebindButtoninv2key2){
	toplabel = "Inv.2";
	bind = global.inv2key2;
}
rebindButtoninv2con = instance_create_depth(camX + buttonCol6c, camY + buttonRow2i, depth-100, obj_rebindconbutton);
with(rebindButtoninv2con){
	toplabel = "";
	bind = global.inv2con;
}
rebindButtoninv3key1 = instance_create_depth(camX + buttonCol5, camY + buttonRow3i, depth-100, obj_rebindbutton);
with(rebindButtoninv3key1){
	toplabel = "                        ";
	bind = global.inv3key1;
}
rebindButtoninv3key2 = instance_create_depth(camX + buttonCol6, camY + buttonRow3i, depth-100, obj_rebindbutton);
with(rebindButtoninv3key2){
	toplabel = "Inv.3";
	bind = global.inv3key2;
}
rebindButtoninv3con = instance_create_depth(camX + buttonCol6c, camY + buttonRow3i, depth-100, obj_rebindconbutton);
with(rebindButtoninv3con){
	toplabel = "";
	bind = global.inv3con;
}
rebindButtoninv4key1 = instance_create_depth(camX + buttonCol5, camY + buttonRow4i, depth-100, obj_rebindbutton);
with(rebindButtoninv4key1){
	toplabel = "                       ";
	bind = global.inv4key1;
}
rebindButtoninv4key2 = instance_create_depth(camX + buttonCol6, camY + buttonRow4i, depth-100, obj_rebindbutton);
with(rebindButtoninv4key2){
	toplabel = "Inv.4";
	bind = global.inv4key2;
}
rebindButtoninv4con = instance_create_depth(camX + buttonCol6c, camY + buttonRow4i, depth-100, obj_rebindconbutton);
with(rebindButtoninv4con){
	toplabel = "";
	bind = global.inv4con;
}
rebindButtoninv5key1 = instance_create_depth(camX + buttonCol5, camY + buttonRow5i, depth-100, obj_rebindbutton);
with(rebindButtoninv5key1){
	toplabel = "                       ";
	bind = global.inv5key1;
}
rebindButtoninv5key2 = instance_create_depth(camX + buttonCol6, camY + buttonRow5i, depth-100, obj_rebindbutton);
with(rebindButtoninv5key2){
	toplabel = "Inv.5";
	bind = global.inv5key2;
}
rebindButtoninv5con = instance_create_depth(camX + buttonCol6c, camY + buttonRow5i, depth-100, obj_rebindconbutton);
with(rebindButtoninv5con){
	toplabel = "";
	bind = global.inv5con;
}
*/