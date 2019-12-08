if(returnButton.focus == true){	
	global.leftkey1 = rebindButtonleftkey1.bind;
	global.leftkey2 = rebindButtonleftkey2.bind;
	global.rightkey1 = rebindButtonrightkey1.bind;
	global.rightkey2 = rebindButtonrightkey2.bind;
	global.upkey1 = rebindButtonupkey1.bind;
	global.upkey2 = rebindButtonupkey2.bind;
	global.downkey1 = rebindButtondownkey1.bind;
	global.downkey2 = rebindButtondownkey2.bind;
	global.jumpkey1 = rebindButtonjumpkey1.bind;
	global.jumpkey2 = rebindButtonjumpkey2.bind;
	global.actkey1 = rebindButtonactkey1.bind;
	global.actkey2 = rebindButtonactkey2.bind;
	global.invfkey1 = rebindButtoninvfkey1.bind;
	global.invfkey2 = rebindButtoninvfkey2.bind;
	global.invbkey1 = rebindButtoninvbkey1.bind;
	global.invbkey2 = rebindButtoninvbkey2.bind;
	global.inv1key1 = rebindButtoninv1key1.bind;
	global.inv1key2 = rebindButtoninv1key2.bind;
	global.inv2key1 = rebindButtoninv2key1.bind;
	global.inv2key2 = rebindButtoninv2key2.bind;
	global.inv3key1 = rebindButtoninv3key1.bind;
	global.inv3key2 = rebindButtoninv3key2.bind;
	global.inv4key1 = rebindButtoninv4key1.bind;
	global.inv4key2 = rebindButtoninv4key2.bind;
	global.inv5key1 = rebindButtoninv5key1.bind;
	global.inv5key2 = rebindButtoninv5key2.bind;
	global.dabkey1 = rebindButtondabkey1.bind;
	global.dabkey2 = rebindButtondabkey2.bind;
	global.slidekey1 = rebindButtonslidekey1.bind;
	global.slidekey2 = rebindButtonslidekey2.bind;
	
	global.leftcon = rebindButtonleftcon.bind;
	global.rightcon = rebindButtonrightcon.bind;
	global.upcon = rebindButtonupcon.bind;
	global.downcon = rebindButtondowncon.bind;
	global.jumpcon = rebindButtonjumpcon.bind;
	global.actcon = rebindButtonactcon.bind;
	global.invfcon = rebindButtoninvfcon.bind;
	global.invbcon = rebindButtoninvbcon.bind;
	global.inv1con = rebindButtoninv1con.bind;
	global.inv2con = rebindButtoninv2con.bind;
	global.inv3con = rebindButtoninv3con.bind;
	global.inv4con = rebindButtoninv4con.bind;
	global.inv5con = rebindButtoninv5con.bind;
	global.dabcon = rebindButtondabcon.bind;
	global.slidecon = rebindButtonslidecon.bind;

	
	scr_savegamedata();
	returnButton.focus = false;
	room_goto(rm_name);
}

if(resetButton.focus == true){	
	global.rightkey1 = ord("D");
	global.rightkey2 = vk_right;
	global.leftkey1 = ord("A");
	global.leftkey2 = vk_left;
	global.downkey1 = ord("S");
	global.downkey2 = vk_down;
	global.upkey1 = ord("W");
	global.upkey2 = vk_up;
	global.jumpkey1 = ord("Z");
	global.jumpkey2 = ord("K");
	global.actkey1 = ord("X");
	global.actkey2 = ord("J");
	global.inv1key1 = ord("1");
	global.inv1key2 = noone;
	global.inv2key1 = ord("2");
	global.inv2key2 = noone;
	global.inv3key1 = ord("3");
	global.inv3key2 = noone;
	global.inv4key1 = ord("4");
	global.inv4key2 = noone;
	global.inv5key1 = ord("5");
	global.inv5key2 = ord("R");
	global.invfkey1 = ord("E");
	global.invfkey2 = noone;
	global.invbkey1 = ord("Q");
	global.invbkey2 = noone;
	global.dabkey1 = ord("F");
	global.dabkey2 = noone;
	global.slidekey1 = ord("L");
	global.slidekey2 = ord("C");
	
	
	global.rightcon = gp_padr;
	global.leftcon = gp_padl;
	global.downcon = gp_padd;
	global.upcon = gp_padu;
	global.jumpcon = gp_face2;
	global.actcon = gp_face1;
	global.inv1con = noone;
	global.inv2con = noone;
	global.inv3con = noone;
	global.inv4con = noone;
	global.inv5con = noone;
	global.invfcon = gp_shoulderr;
	global.invbcon = gp_shoulderl;
	global.dabcon = noone;
	global.slidecon = noone;
	room_restart();
}