//Resizing the Window
if window_has_focus()
{
	if camera_get_view_width(global.camera) != window_get_width()
	{
		camera_set_view_size(global.camera,window_get_width(),camera_get_view_height(global.camera))
		camera_set_view_pos(global.camera,window_get_width(),camera_get_view_y(global.camera))
		surface_resize(application_surface,window_get_width(),window_get_height())
		
	}
	if camera_get_view_height(global.camera) != window_get_height()
	{
		camera_set_view_size(global.camera,camera_get_view_width(global.camera),window_get_height())
		camera_set_view_pos(global.camera,camera_get_view_width(global.camera),window_get_height())
		surface_resize(application_surface,window_get_width(),window_get_height())
	}
}

//Debug
if f1{
	global.debug = !global.debug	
}

if f2{
	if room = 1
	{
		roomprevious = room
		room_goto(board_0)
	}
}		

//Mouseclick
if mouseclick > 0
{
	mouseclick--
}

//Dice Roll
if diceroll > 0
{
	d++
	if d >= b
	{
		with o_nameplate
		{
			if nameid = ds_list_find_value(other.diceorder,0)
			{
				other._x = x-80
				other._y = y
				show_debug_message("_x: " + string(other._x))
				show_debug_message("_y: " + string(other._y))
			}
		}
		drawarrow = 1
		with o_arrow
		{
			x = other._x
			y = other._y
		}
		ds_list_delete(diceorder,0)
		diceroll -= 1
		b = b + 1
		d = 0
		show_debug_message("List of Dice Rolls: " + string(diceroll))
		show_debug_message("B: " + string(b))
		show_debug_message("Draw arrow: " + string(drawarrow))
		show_debug_message("")
	}
}
else if diceroll = 0
{
	b = 3
	drawarrow = 2
	d++
	if d = 120
	{
		drawarrow = 0	
		diceroll = -1
		ds_list_clear(diceorder)
		d = 0
	}
	show_debug_message("List of Dice Rolls: " + string(diceroll))
	show_debug_message("Draw arrow: " + string(drawarrow))
}




