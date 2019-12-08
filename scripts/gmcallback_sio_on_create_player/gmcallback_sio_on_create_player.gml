show_debug_message("This is a discontinued function. oncreateplayer");
return;
var data = json_decode(argument[0]);
global.username = data[? "username"];
show_debug_message("Your player should be created");

show_debug_message("Username = " + string(data[? "username"]) + " X: " + string(data[? "x"]) + " Y: " + string(data[? "y"]));

with(global.player){
	//x = data[? "x"];
	//y = data[? "y"];
	show_debug_message("Id is: " + id);
	uID = data[? "id"];
	username = data[? "username"];
}