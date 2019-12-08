/// @desc get_shootface()
shootx = (rKey - lKey);
shooty = (dKey - uKey);

shootDir = point_direction(0,0, shootx, shooty);

if((shootx != 0) or (shooty != 0))
	shootface = round(shootDir/45);
else 
	shootface = face;
if(shootface == 8) {
	shootface = 0;
}