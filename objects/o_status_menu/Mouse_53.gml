if menuclick
{
	if mouseover
	{
		o_controller.mouseclick = 10
		with o_status
		{
			if statusid = other.statusmenuid
			{
				status = other.statusmenu
			}
		}				
		if statusmenu = 2{
			scr_timer_break("break",statusmenuid)
		}
		else if statusmenu = 3{
			scr_timer_break("lunch",statusmenuid)	
		}
		with o_client
		{
			scr_client_changestatus(other.statusmenuid,other.statusmenu)
		}
		with o_status_menu
		{
			instance_destroy()	
		}
	}
}
