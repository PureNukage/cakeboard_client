if menuclick
{
	if mouseover
	{
		o_controller.mouseclick = 6
		with o_status
		{
			if statusid = other.statusmenuid
			{
				status = other.statusmenu
			}
		}				
		if statusmenu = 2{								//Break
			scr_timer_break("break",statusmenuid)
		}
		else if statusmenu = 3{							//Lunch
			scr_timer_break("lunch",statusmenuid)	
		}
		else{											//Anything thats not Break or Lunch
			if instance_number(o_timer) > 0{
				with o_timer{	instance_destroy()	}	
			}
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
