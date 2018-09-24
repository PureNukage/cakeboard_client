//Draw Self
if statusmenu != 5
{
	draw_self()
}

draw_set_font(font1)
//Status Switch
switch statusmenu
{
	case 0:
	//In
		_in
		statusmenufill
		black
		statusmenutext
	break;
	case 1:
	//Out
		_out
		statusmenufill
		black
		statusmenutext
	break;
	case 2:
	//Break
		_break
		statusmenufill
		black
		statusmenutext
	break;
	case 3:
	//Lunch
		_lunch
		statusmenufill
		black
		statusmenutext
	break;
	case 4:
	//Assembly
		_quickbreak
		statusmenufill
		black
		statusmenutext
	break;
	case 5:
	//Chipotle
		//draw_sprite(s_chipotle_menu,0,x,y)
	break;
}
draw_set_font(-1)