var _length, i, _x, _y, _time, b

var _order = argument[0]

_length = ds_list_size(_order)

for (i=0;i<_length;i++)
{
	with o_nameplate
	{
		if nameid = ds_list_find_value(_order,i)
		{
			_x = x
			_y = y
		}
	}
	draw_sprite(s_arrow_0,0,_x-48,_y)
	show_message("drawing arrow")
	_time = irandom_range(20,60)
	for (b=_time;b>0;b = b-1)
	{
		
	}
	
}



