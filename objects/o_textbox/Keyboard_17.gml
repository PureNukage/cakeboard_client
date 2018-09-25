if selected = true{
	if c{
		clipboard_set_text(_text)		
	}
	if v{
		keyboard_string = clipboard_get_text()
		_text = clipboard_get_text()	
	}
}