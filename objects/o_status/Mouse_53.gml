if mouseover and (o_controller.profile = statusid or o_controller.admin = 1)
{
	if !menuclick
	{
		if instance_number(o_status_menu) > 0
		{
			with o_status_menu
			{
				if statusmenuid = other.statusid
				{
					instance_destroy()	
				}
			}
		}
		else 
		{
			var whichstatus, _statusid
			whichstatus = id
			with whichstatus
			{
				_statusid = statusid
			}
			scr_status_menu(whichstatus,_statusid)	
		}
	}
}
else
{
	if !menuclick
	{
		with o_status_menu
		{
			if statusmenuid = other.statusid
			{
				instance_destroy()	
			}
		}	
	}
}