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

resetButton = instance_create_depth(camX+camW/2-220,camY+camH-25,depth-100,obj_button);
with(resetButton){
	label = "Restore Defaults";
}


rebindButtonleftkey1 = instance_create_depth(camX + buttonCol1, camY + buttonRow1, depth-100, obj_rebindbutton);
with(rebindButtonleftkey1){
	toplabel = "                       ";
	bind = global.leftkey1;
}
rebindButtonleftkey2 = instance_create_depth(camX + buttonCol2, camY + buttonRow1, depth-100, obj_rebindbutton);
with(rebindButtonleftkey2){
	toplabel = "Left";
	bind = global.leftkey2;
}

rebindButtonleftcon = instance_create_depth(camX + buttonCol2c, camY + buttonRow1, depth-100, obj_rebindconbutton);
with(rebindButtonleftcon){
	toplabel = "";
	bind = global.leftcon;
}

rebindButtonrightkey1 = instance_create_depth(camX + buttonCol1, camY + buttonRow2, depth-100, obj_rebindbutton);
with(rebindButtonrightkey1){
	toplabel = "                       ";
	bind = global.rightkey1;
}
rebindButtonrightkey2 = instance_create_depth(camX + buttonCol2, camY + buttonRow2, depth-100, obj_rebindbutton);
with(rebindButtonrightkey2){
	toplabel = "Right";
	bind = global.rightkey2;
}
rebindButtonrightcon = instance_create_depth(camX + buttonCol2c, camY + buttonRow2, depth-100, obj_rebindconbutton);
with(rebindButtonrightcon){
	toplabel = "";
	bind = global.rightcon;
}

rebindButtonupkey1 = instance_create_depth(camX + buttonCol1, camY + buttonRow3, depth-100, obj_rebindbutton);
with(rebindButtonupkey1){
	toplabel = "                       ";
	bind = global.upkey1;
}
rebindButtonupkey2 = instance_create_depth(camX + buttonCol2, camY + buttonRow3, depth-100, obj_rebindbutton);
with(rebindButtonupkey2){
	toplabel = "Up";
	bind = global.upkey2;
}
rebindButtonupcon = instance_create_depth(camX + buttonCol2c, camY + buttonRow3, depth-100, obj_rebindconbutton);
with(rebindButtonupcon){
	toplabel = "";
	bind = global.upcon;
}

rebindButtondownkey1 = instance_create_depth(camX + buttonCol1, camY + buttonRow4, depth-100, obj_rebindbutton);
with(rebindButtondownkey1){
	toplabel = "                       ";
	bind = global.downkey1;
}
rebindButtondownkey2 = instance_create_depth(camX + buttonCol2, camY + buttonRow4, depth-100, obj_rebindbutton);
with(rebindButtondownkey2){
	toplabel = "Down";
	bind = global.downkey2;
}
rebindButtondowncon = instance_create_depth(camX + buttonCol2c, camY + buttonRow4, depth-100, obj_rebindconbutton);
with(rebindButtondowncon){
	toplabel = "";
	bind = global.downcon;
}
rebindButtonslidekey1 = instance_create_depth(camX + buttonCol1, camY + buttonRow5, depth-100, obj_rebindbutton);
with(rebindButtonslidekey1){
	toplabel = "";
	bind = global.slidekey1;
}

rebindButtonslidekey2 = instance_create_depth(camX + buttonCol2, camY + buttonRow5, depth-100, obj_rebindbutton);
with(rebindButtonslidekey2){
	toplabel = "Slide";
	bind = global.slidekey2;
}
rebindButtonslidecon = instance_create_depth(camX + buttonCol2c, camY + buttonRow5, depth-100, obj_rebindconbutton);
with(rebindButtonslidecon){
	toplabel = "";
	bind = global.slidecon;
}
rebindButtonjumpkey1 = instance_create_depth(camX + buttonCol3, camY + buttonRow1, depth-100, obj_rebindbutton);
with(rebindButtonjumpkey1){
	toplabel = "                       ";
	bind = global.jumpkey1;
}
rebindButtonjumpkey2 = instance_create_depth(camX + buttonCol4, camY + buttonRow1, depth-100, obj_rebindbutton);
with(rebindButtonjumpkey2){
	toplabel = "Jump";
	bind = global.jumpkey2;
}
rebindButtonjumpcon = instance_create_depth(camX + buttonCol4c, camY + buttonRow1, depth-100, obj_rebindconbutton);
with(rebindButtonjumpcon){
	toplabel = "";
	bind = global.jumpcon;
}
rebindButtonactkey1 = instance_create_depth(camX + buttonCol3, camY + buttonRow2, depth-100, obj_rebindbutton);
with(rebindButtonactkey1){
	toplabel = "                       ";
	bind = global.actkey1;
}
rebindButtonactkey2 = instance_create_depth(camX + buttonCol4, camY + buttonRow2, depth-100, obj_rebindbutton);
with(rebindButtonactkey2){
	toplabel = "Shoot";
	bind = global.actkey2;
}
rebindButtonactcon = instance_create_depth(camX + buttonCol4c, camY + buttonRow2, depth-100, obj_rebindconbutton);
with(rebindButtonactcon){
	toplabel = "";
	bind = global.actcon;
}

rebindButtondabkey1 = instance_create_depth(camX + buttonCol3, camY + buttonRow3, depth-100, obj_rebindbutton);
with(rebindButtondabkey1){
	toplabel = "                    ";
	bind = global.dabkey1;
}
rebindButtondabkey2 = instance_create_depth(camX + buttonCol4, camY + buttonRow3, depth-100, obj_rebindbutton);
with(rebindButtondabkey2){
	toplabel = "Dab";
	bind = global.dabkey2;
}
rebindButtondabcon = instance_create_depth(camX + buttonCol4c, camY + buttonRow3, depth-100, obj_rebindconbutton);
with(rebindButtondabcon){
	toplabel = "";
	bind = global.dabcon;
}

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