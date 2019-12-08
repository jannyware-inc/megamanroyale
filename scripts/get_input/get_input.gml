/// @desc get_input()
dabKey = keyboard_check(global.dabkey1)||keyboard_check(global.dabkey2)||gamepad_button_check(0, global.dabcon)|| gamepad_button_check(4, global.dabcon);
rKey = keyboard_check(global.rightkey1)|| keyboard_check(global.rightkey2)|| gamepad_button_check(0, global.rightcon)||gamepad_button_check(4, global.rightcon);
lKey = keyboard_check(global.leftkey1)|| keyboard_check(global.leftkey2)|| gamepad_button_check(0, global.leftcon)|| gamepad_button_check(4, global.leftcon);
dKey = keyboard_check(global.downkey1)|| keyboard_check(global.downkey2)|| gamepad_button_check(0, global.downcon)|| gamepad_button_check(4, global.downcon);
dKeyPress = keyboard_check_pressed(global.downkey1)||keyboard_check_pressed(global.downkey2)||gamepad_button_check_pressed(0, global.downcon)||gamepad_button_check_pressed(4, global.downcon);
uKey = keyboard_check(global.upkey1)|| keyboard_check(global.upkey2)||gamepad_button_check(0, global.upcon)|| gamepad_button_check(4, global.upcon);
uKeyPress = keyboard_check_pressed(global.upkey1)|| keyboard_check_pressed(global.upkey2)||gamepad_button_check_pressed(0, global.upcon)|| gamepad_button_check_pressed(4, global.upcon);
slideKeyPress = keyboard_check_pressed(global.slidekey1)|| keyboard_check_pressed(global.slidekey2)||gamepad_button_check_pressed(0, global.slidecon)|| gamepad_button_check_pressed(4, global.slidecon);

jumpKey = keyboard_check(global.jumpkey1)||keyboard_check(global.jumpkey2)||gamepad_button_check(0, global.jumpcon)||gamepad_button_check(4, global.jumpcon);
jumpKeyPress = keyboard_check_pressed(global.jumpkey1) || keyboard_check_pressed(global.jumpkey2) ||gamepad_button_check_pressed(0, global.jumpcon)||gamepad_button_check_pressed(4, global.jumpcon);


actKeyHold = keyboard_check(global.actkey1)||keyboard_check(global.actkey2)||gamepad_button_check(0, global.actcon)||gamepad_button_check(4, global.actcon);
actKeyPress = keyboard_check_pressed(global.actkey1) || keyboard_check_pressed(global.actkey2)||gamepad_button_check_pressed(0, global.actcon)||gamepad_button_check_pressed(4, global.actcon);
//global.lShiftCheck = keyboard_check_direct(vk_lshift);
xaxis = (rKey - lKey);
//yaxis = (dKey - uKey);
yaxis = 0;

//inventory
inv1keypress = keyboard_check_pressed(global.inv1key1) || keyboard_check_pressed(global.inv1key2)||gamepad_button_check_pressed(0, global.inv1con)||gamepad_button_check_pressed(4, global.inv2con);
inv2keypress = keyboard_check_pressed(global.inv2key1)|| keyboard_check_pressed(global.inv2key2)||gamepad_button_check_pressed(0, global.inv2con)||gamepad_button_check_pressed(4, global.inv2con);
inv3keypress = keyboard_check_pressed(global.inv3key1)|| keyboard_check_pressed(global.inv2key2)||gamepad_button_check_pressed(0, global.inv3con)||gamepad_button_check_pressed(4, global.inv3con);
inv4keypress = keyboard_check_pressed(global.inv4key1)|| keyboard_check_pressed(global.inv2key2)||gamepad_button_check_pressed(0, global.inv4con)||gamepad_button_check_pressed(4, global.inv4con);
inv5keypress = keyboard_check_pressed(global.inv5key1)||keyboard_check_pressed(global.inv5key2)||gamepad_button_check_pressed(0, global.inv5con)||gamepad_button_check_pressed(4, global.inv5con);
invfkeypress = keyboard_check_pressed(global.invfkey1)||keyboard_check_pressed(global.invfkey2)||gamepad_button_check_pressed(0, global.invfcon)||gamepad_button_check_pressed(4, global.invfcon);
invbkeypress = keyboard_check_pressed(global.invbkey1)||keyboard_check_pressed(global.invbkey2)||gamepad_button_check_pressed(0, global.invbcon)||gamepad_button_check_pressed(4, global.invbcon);