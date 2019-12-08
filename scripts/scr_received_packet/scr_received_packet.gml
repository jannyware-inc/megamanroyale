//scr_received_packet(buffer,socket)
var buffer = argument[0];
var socket = argument[1];

var message_id = buffer_read(buffer, buffer_u8);
	
switch(message_id){
	case 1:
		clientID = socket;
		rx = buffer_read(buffer, buffer_s16);
		ry = buffer_read(buffer, buffer_s16);
	//show_debug_message(string(rx) + string(socket));
		if(rx != noone and ry != noone)
			//show_debug_message(string(global.clientID[? socket]));
			global.clientID[? socket].y = ry;
			global.clientID[? socket].x = rx;
		break;
	case 2:
		
		bulletx = buffer_read(buffer,buffer_s16);
		bullety = buffer_read(buffer,buffer_s16);
		bulletDir = buffer_read(buffer,buffer_s16);
		show_debug_message("bulletdir = " + string(bulletDir));
		remoteBullet = instance_create_depth(bulletx,bullety,"instances",obj_remoteBullet);
		with(remoteBullet){
			dir = other.bulletDir;
		}
		global.clientID[? socket].shootFrames = 15;
}