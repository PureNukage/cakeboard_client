var i, currentmenu, statusY, _name, statusX

statusX = argument[0]
statusY = argument[1]
show_debug_message("statusX: " + string(statusX))
show_debug_message("statusY: " + string(statusY))

for (i=0;i<o_controller.totalusers;i++)
{
	currentmenu = instance_create_layer(statusX+72,statusY,"Instances",o_dice_menu)
	_name = ds_list_find_value(o_controller.database_names,i)
	with currentmenu
	{
		ID = i
		name = _name
		selected = false
		
	}
	statusY += 40
}