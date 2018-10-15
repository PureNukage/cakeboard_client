var _x = argument[0]
var _y = argument[1]

for(var i=0;i<theme_count;i++)
{
	var _theme = instance_create_layer(_x,_y,"Menu",o_theme_menu)
	if theme = i{
		_theme.toggle = 1	
	}
	_theme.ID = i
	_theme.text_on = theme_name[i]
	_theme.text_off = theme_name[i]
	_x += 102
}