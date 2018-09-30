var i, currentmenu, statusY, _name

statusY = o_dice.y

for (i=0;i<o_controller.totalusers;i++)
{
	currentmenu = instance_create_layer(o_dice.x+96,statusY,"Instances",o_dice_menu)
	_name = ds_list_find_value(o_controller.userlist,i)
	with currentmenu
	{
		ID = i
		name = _name
		
	}
	statusY += 40
}