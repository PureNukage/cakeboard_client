//Var Init
ID = 0								//Used with the server to identify which specific textbox
toggle = 0							//Toggle between 0 and 1. Starts at 0
imagealpha = 1						//Opacity
Font = font2						//Font of the text

/*

To customize the child object:

1. Right Click this parent Create event in your child object
2. Inherit Event
3. Underneath the "event_inherited()" copy the code block that is underneath this paragraph
4. Change their values as you wish 

*/


text_on = "Allowed"						//Text when toggle is 0
text_off = "Disabled"						//Text when toggle is 1
color_off = make_color_rgb(211,12,47)	//Color when toggle is 0 (could use the built-in c_ values)
color_on = make_color_rgb(35,174,0)	//Color when toggle is 1 (could use the built-in c_values)