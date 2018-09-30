if mouseover
{
	if instance_number(o_dice_menu) <= 0
	{
		scr_dicemenu()	
	}
	else
	{
		var list = ds_list_create()
		for (var i=0; i<o_controller.totalusers; i++)
		{
			with o_dice_menu
			{
				if ID = i
				{
					if selected = true
					{
						ds_list_add(list,i)
					}
				}
			}	
		}
		if ds_list_size(list) > 0
		{
			with o_client
			{
				scr_client_diceroll(list)
			}
		}
	}
}
else if instance_position(mouse_x,mouse_y,o_dice_menu)
{
	exit;
}
else
{
	if instance_number(o_dice_menu) > 0
	{
		with o_dice_menu
		{
			instance_destroy()	
		}
	}
}
