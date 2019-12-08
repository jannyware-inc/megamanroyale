if(wasHurt and !hurt){
	visible = true;
	wasHurt = false;
}

if(hurt and !wasHurt){
	hurt = false;
	visible = false;
	wasHurt = true;
}

if(hurt and wasHurt){
	visible = true;
}