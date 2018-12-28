switch(o_controller.theme)
{
	case 0:
	case 2:
		draw_set_color(c_black)
	break;

	case 1:
		draw_set_color(c_gray)
	break;
	case 3:
		draw_set_color(c_black)
	break;
	case 4:
		draw_set_color(c_white)
	break;
	case 5:
		draw_set_color(c_white)
	break;
	case 6:
		draw_set_color(c_white)
	break;
}

draw_set_font(font1)
draw_text(x-36,y+15,time)
draw_set_font(-1)