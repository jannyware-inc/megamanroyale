
if (browser_width != width || browser_height != height){
	width = browser_width;
	height = browser_height;
	camWidth = camera_get_view_width(view_camera[0]);
	camHeight = camera_get_view_height(view_camera[0]);

	scale = 0;
	for(i = 2; i<15; i++){
		if ( ((camWidth*i) < width) and ( (camHeight*i) < height) ){
		
		} else {
			window_set_size(camWidth*(i-1),camHeight*(i-1));
			break;
		}
	}
	window_set_position(((width/2)-(camWidth*(i-1))/2), ((height/2)-(camHeight*(i-1))/2));
	global.scale = i-1;

}

if(view_get_hport(0) != window_get_height() or view_get_wport(0) != window_get_width()){
	view_set_hport(0,window_get_height());
	view_set_wport(0,window_get_width());
}

if view_wport[0] != surface_get_width(application_surface) || view_hport[0] != surface_get_height(application_surface){
   surface_resize(application_surface, view_wport[0],view_hport[0]);
}