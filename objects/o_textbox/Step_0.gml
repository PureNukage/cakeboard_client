switch (selected)
{
	case 0:
	//Not Selected
	
	break;
	case 1:
	//Selected
		_text = keyboard_string
		
		//Max Character Length	
		draw_set_font(font)
		if string_width(_text) > maxlength 
		{
			_text = string_copy(_text,1,string_length(_text)-1)	
		}
		if string_width(text) > maxlength
		{
			text = string_copy(text,1,string_length(text)-1)	
		}
		if string_width(keyboard_string) > maxlength
		{
			keyboard_string = string_copy(keyboard_string,1,string_length(keyboard_string)-1)	
		}
		
		//Cursor
		//_text = string_insert(_text,text,cursor)
		
		//Enter
		if keyboard_check_pressed(vk_enter)
		{
			selected = !selected
			text = _text	
			_text = ""
			keyboard_string = ""
			with o_client	//Send data
			{
				scr_client_textbox(other.text,other.textboxid)
			}
		}
	
	break;
}