if debug_on
{
	draw_text(x+15,y+15,"Active Clients: " + string(global.activeclients))
	draw_text(x+15,y+30,"User: " + string(environment_get_variable("USERNAME")))
	draw_text(x+15,y+45,"Mouseclick: " + string(mouseclick))
}	