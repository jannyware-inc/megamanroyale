var data = json_decode(argument[0]);
//show_debug_message("Got lobby_timer");
var timer = data[? "timer"];
if(timer == -1){
	if(instance_exists(global.readyUp)){
		global.readyUp.countdownTimer = noone;
	}
} else {
	if(instance_exists(global.readyUp)){
		//show_debug_message("Readyup exists");
		global.readyUp.countdownTimer = timer*1000; //converting milliseconds to microseconds to use with delta time
	}
}