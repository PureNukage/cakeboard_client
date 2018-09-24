//Draw Self
if status != 5
{
	draw_self()
}
draw_set_font(font)
//draw_text_transformed(x,y+7,string(status),1,1,0)
//draw_set_font(-1)

//Switch Status Statement
switch status 
{
	case 0:
	//In
		_in
		statusfill
		black
		statusstatus = "In"
		statustext
	break;
	case 1:
	//Out
		_out
		statusfill
		black
		statusstatus = "Out"
		statustext
	break;
	case 2:
	//Break
		_break
		statusfill
		black
		statusstatus = "Break"
		statustext
	break;
	case 3:
	//Lunch
		_lunch
		statusfill
		black
		statusstatus = "Lunch"
		statustext
	break;
	case 4:
	//Assembly
		_quickbreak
		statusfill
		black
		statusstatus = "Assembly"
		statustext
	break;
	case 5:
	//Chipotle
		draw_sprite(s_chipotle,0,x,y)
		statusstatus = ""
	break;
}
draw_set_font(-1)