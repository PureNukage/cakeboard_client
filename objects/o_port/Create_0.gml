event_inherited()

//Var Init
ID = 0							//Used with the server to identify which specific textbox
selected = false				//Did we click it or not?
_text = ""						//The text variable ONLY when selected (rough draft)
text = string(o_client.port)	//The text variable FINISHED (final draft)
maxlength = sprite_width-28		//The max length of the string inside the box
imagealpha = 1					//Opacity
color = c_gray					//Color of the box
Font = font2						//Font of the text


