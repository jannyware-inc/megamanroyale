draw_set_font(fnt_comicsans);
if(player.guide != noone){
	draw_text(10,100,string(min(abs((vh+vy)-player.y),abs(vy-player.y))) + "\n" + string("yy = " + string(player.guide.yy)) + "\nbbox left : " + string(player.guide.bbox_left));
}