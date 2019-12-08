///Text Input Step Script
//check if box is focused
if (focus = true){
	if(!wasFocused){
		keyboard_string = input;
	}
     //if is focused, check for user hitting enter to stop input
     if (keyboard_check_pressed(vk_enter))
         {
           //stop focus on player hitting enter
              focus = false;
         }
     //Get input up to max characters.
       if (string_length(input)<maxCharacters)
         {
              input = keyboard_string;
         }
      /* If they entered max characters no longer get input unless
        it is backspace, then delete the last character and set
       the keyboard_string to the previous characters. */
       else if (keyboard_check_pressed(vk_backspace))
        {
			input = string_copy(input,1,string_length(input)-1);
			keyboard_string = input;
        }
		wasFocused = true;
 } else {
	wasFocused = false;
 }