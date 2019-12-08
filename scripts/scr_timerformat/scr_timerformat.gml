//scr_timerformat(microseconds);
	
var time = argument0;
var ms = floor(time/1000)%1000;
var seconds = floor(time/1000/1000)%60;
var minutes = floor(time/1000/(1000*60))%60;
if(ms <10){
	ms = "00"+string(ms);
} else if (ms < 100){
	ms = "0"+string(ms);
}
if(seconds < 10){
	seconds = "0"+string(seconds);
}
if(minutes < 10){
	minutes = "0"+string(minutes);
}
	
return string(minutes) + ":" + string(seconds) + "." + string(ms);