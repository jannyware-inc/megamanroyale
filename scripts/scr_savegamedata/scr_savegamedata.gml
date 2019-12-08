if(file_exists("mmroyale.ini")){
	file_delete("mmroyale.ini");
}
  ini_open("mmroyale.ini");
  ini_write_real("keybinds","rightkey1",global.rightkey1);
  ini_write_real("keybinds","rightkey2",global.rightkey2);
  ini_write_real("keybinds","leftkey1 ",global.leftkey1);
  ini_write_real("keybinds","leftkey2 ",global.leftkey2);
  ini_write_real("keybinds","downkey1",global.downkey1);
  ini_write_real("keybinds","downkey2",global.downkey2);
  ini_write_real("keybinds","upkey1",global.upkey1);
  ini_write_real("keybinds","upkey2",global.upkey2);
  ini_write_real("keybinds","jumpkey1",global.jumpkey1);
  ini_write_real("keybinds","jumpkey2",global.jumpkey2);
  ini_write_real("keybinds","actkey1",global.actkey1);
  ini_write_real("keybinds","actkey2",global.actkey2);
  ini_write_real("keybinds","inv1key1",global.inv1key1);
  ini_write_real("keybinds","inv1key2",global.inv1key2);
  ini_write_real("keybinds","inv2key1",global.inv2key1);
  ini_write_real("keybinds","inv2key2",global.inv2key2);
  ini_write_real("keybinds","inv3key1",global.inv3key1);
  ini_write_real("keybinds","inv3key2",global.inv3key2);
  ini_write_real("keybinds","inv4key1",global.inv4key1);
  ini_write_real("keybinds","inv4key2",global.inv4key2);
  ini_write_real("keybinds","inv5key1",global.inv5key1);
  ini_write_real("keybinds","inv5key2",global.inv5key2);
  ini_write_real("keybinds","invfkey1",global.invfkey1);
  ini_write_real("keybinds","invfkey2",global.invfkey2);
  ini_write_real("keybinds","invbkey1",global.invbkey1);
  ini_write_real("keybinds","invbkey2",global.invbkey2);
  ini_write_real("keybinds","dabkey1",global.dabkey1);
  ini_write_real("keybinds","dabkey2",global.dabkey2);
  ini_write_real("keybinds","slidekey1",global.slidekey1);
  ini_write_real("keybinds","slidekey2",global.slidekey2);
  
  ini_write_real("keybinds","rightcon",global.rightcon);
  ini_write_real("keybinds","leftcon ",global.leftcon);
  ini_write_real("keybinds","downcon",global.downcon);
  ini_write_real("keybinds","upcon",global.upcon);
  ini_write_real("keybinds","jumpcon",global.jumpcon);
  ini_write_real("keybinds","actcon",global.actcon);
  ini_write_real("keybinds","inv1con",global.inv1con);
  ini_write_real("keybinds","inv2con",global.inv2con);
  ini_write_real("keybinds","inv3con",global.inv3con);
  ini_write_real("keybinds","inv4con",global.inv4con);
  ini_write_real("keybinds","inv5con",global.inv5con);
  ini_write_real("keybinds","invfcon",global.invfcon);
  ini_write_real("keybinds","invbcon",global.invbcon);
  ini_write_real("keybinds","invbcon",global.invbcon);
  ini_write_real("keybinds","dabcon",global.dabcon);
  ini_write_real("keybinds","slidecon",global.slidecon);
  
  
  ini_write_string("online","username",global.username);
  ini_write_real("unlocks","bass",global.bassunlocked);
ini_close();