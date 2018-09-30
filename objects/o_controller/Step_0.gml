//Resizing the Window
if window_has_focus()
{
	if camera_get_view_width(camera) != window_get_width()
	{
		camera_set_view_size(camera,window_get_width(),camera_get_view_height(camera))
		camera_set_view_pos(camera,window_get_width(),camera_get_view_y(camera))
		surface_resize(application_surface,window_get_width(),window_get_height())
		
	}
	if camera_get_view_height(camera) != window_get_height()
	{
		camera_set_view_size(camera,camera_get_view_width(camera),window_get_height())
		camera_set_view_pos(camera,camera_get_view_width(camera),window_get_height())
		surface_resize(application_surface,window_get_width(),window_get_height())
	}
}

//Debug
if f1{
	o_controller.debug = !o_controller.debug	
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
		if (instance_number(o_arrow) = 0) and room = board_0	//If returning to board room
		{														//and dice roll is happening
			instance_create_layer(x,y,"Instances",o_arrow)	
		}
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




