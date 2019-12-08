///On Text Input Global MB Click
/* The second set of coords in rectangle are size of collision box and should be
set to the size of the text box. This text box is 100x20 (x + 100, y + 20) */
//check if user has clicked the text box
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + 160, y + 30))
  {
     focus = true;
     keyboard_string = input;
  }
//if user clicked outside text box make the text box lose focus
else if (focus = true)
  {
     focus = false;
  }