//scr_namefilter(name)
var name = argument0;
if(global.namecensor == 0){
	return name;
}
if(string_pos("nigger", name) != 0){
	return scr_namefilter(string_copy(name,1,string_pos("nigger", name)-1) + "******" + scr_namefilter(string_copy(name,string_pos("nigger", name) + string_length("nigger"),string_length(name))));
}else if(string_pos("fuck", name) != 0){
	return scr_namefilter(string_copy(name,1,string_pos("fuck", name)-1) +  "****" + scr_namefilter(string_copy(name,string_pos("fuck", name) + string_length("fuck"),string_length(name))));
}else if(string_pos("fag", name) != 0){
	return scr_namefilter(string_copy(name,1,string_pos("fag", name)-1) + scr_string_reverse("***") + scr_namefilter(string_copy(name,string_pos("fag", name) + string_length("fag"),string_length(name))));
}
return name;