/// @desc scr_refillAmmo(amount)
/// @arg amt
global.player.weapon.ammoCur += argument[0];
if (global.player.weapon.ammoCur > global.player.weapon.ammoMax){
	global.player.weapon.ammoCur = global.player.weapon.ammoMax;
}