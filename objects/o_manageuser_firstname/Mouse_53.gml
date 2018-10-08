if mouseover and !instance_position(mouse_x,mouse_y,o_dice_menu)
{
	selected = !selected
	if imagealpha < 1{
		text = ""	
	}
	if selected = 1
	{
		keyboard_string = text
		_text = text
		text = ""
	}
	if selected = 0
	{
		text = _text
		_text = ""
		keyboard_string = ""
		if imagealpha = 1
		{
			with o_client	//Send data
			{
				scr_client_manageusers_change(other.ID,other.object_index,other.text)
			}
		}
	}
}
else
{
	if selected = 1	//and the textbox is currently selected
	{
		selected = 0	
		text = _text
		_text = ""
		keyboard_string = ""
		if imagealpha = 1
		{
			with o_client	//Send data
			{
				scr_client_manageusers_change(other.ID,other.object_index,other.text)
			}
		}
	}
}	
