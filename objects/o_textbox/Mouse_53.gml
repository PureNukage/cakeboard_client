if mouseover and o_controller.mouseclick = 0 and (o_controller.profile = textboxid or o_controller.admin = 1)
{
	selected = !selected
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
		with o_client	//Send data
		{
			scr_client_textbox(other.text,other.textboxid)
		}	
	}
}

if !mouseover //If clicking NOT on the textbox
{
	if selected = 1	//and the textbox is currently selected
	{
		selected = 0	
		text = _text
		_text = ""
		keyboard_string = ""
		with o_client	//Send data
		{
			scr_client_textbox(other.text,other.textboxid)
		}
	}
}