if(hurt and iFrameTimer <= 0){
	hurt = false;
	iFrameTimer = iFrameTimerMax;
}

if(iFrameTimer > 0){
	invincible = true;
	iFrameTimer--;
	blinking = (iFrameTimer%6 < 3);
} else {
	blinking = false;
}
if(iFrameTimer == 0){
	invincible = false;
}

hurt = false;