centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

//target = instance_nearest(x, y, obj_player);
scr_hurtblink();
if(hp <= 0){
	scr_dropPickups(2);
	scr_explodeSmall();
}
if(!scr_inZoneOrView()){
	instance_destroy();
}
if(scr_freezeexit()) return;


if(aliveFrames > 0){
	if (place_meeting(x,y,obj_player))
			scr_hurt(damageC,0);
	aliveFrames--;
	vspd+=grav;
	if(aliveFrames - blinkFrames < 0){
		if(aliveFrames%2 == 0){
			visible = false;
		} else {
			visible = true;
		}
	}

} else {
	instance_destroy();
}

if (instance_place(x+.5+hspd, y, obj_wall)) {
	while(!place_meeting(x+.5+(sign(hspd)*.99), y, obj_wall)) {
		x += (sign(hspd)*.99);
	}
	hspd = 0;
}

if (instance_place(x, y+vspd, obj_wall)) {
	while(!place_meeting(x, y+(sign(vspd)), obj_wall)) {
		y += (sign(vspd));
	}
	vspd = 0;
	hspd = 0;
	grounded = 1;
}
	x += hspd;
	y += vspd;