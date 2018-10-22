draw_self()
//Draw Text
//text = string_insert("|",text,cursor)
draw_set_color(c_black)
draw_set_font(font)
draw_text(x+6,y+10,text)
draw_text(x+6,y+10,_text)
draw_set_font(-1)

//Debugging
if debug_on and mouseover
{
	draw_text(x+300,y,"keyboard_width: " + string(string_width(keyboard_string)))
	draw_text(x+300,y+15,"_text_width: " + string(string_width(_text)))
	draw_text(x+300,y+30,"text_width: " + string(string_width(text)))
}

switch (selected)
{
	case 0:
	//Not Selected
	
	break;
	case 1:
	//Selected
		draw_set_color(c_white)
		draw_rectangle(x-2,y-2,x+258,y+49,true)
		draw_rectangle(x-1,y-1,x+257,y+48,true)
		draw_set_color(c_black)
	
	break;
}