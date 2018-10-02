if mouseover
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
		//with o_client	//Send data
		//{
		//	scr_client_textbox(other.text,other.textboxid)
		//}	
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
		//with o_client	//Send data
		//{
		//	scr_client_textbox(other.text,other.textboxid)
		//}
	}
}	
