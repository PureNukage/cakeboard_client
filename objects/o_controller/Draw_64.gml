#region Debug/Console
if debug_on
{
	//draw_text(x+15,y+15,"Active Clients: " + string(global.activeclients))
	draw_set_color(c_white)
	draw_rectangle(5,5,505,250,false)
	draw_set_color(c_black)
	draw_text(15,30,"Total Users: "+string(totalusers))
	draw_text(15,45,"User: " + string(environment_get_variable("USERNAME")))
	draw_text(15,60,"Mouse_x: " + string(gui_x))
	draw_text(15,75,"Mouse_y: " + string(gui_y))
	draw_text(15,90,"Theme: " + string(theme))
	draw_text(15,105,"fileopen: " + string(fileopen))
	draw_text(15,120,"timer: "+string(timer))
	draw_text(200,30,"Freshboard: " +string(freshboard))
	draw_text(200,45,"Profile: " + string(profile))
	draw_text(200,60,"Admin: " + string(admin))
	draw_text(200,75,"clients: " + string(instance_number(o_client)))
	if instance_exists(o_client){
		//draw_text(200,90,"Socket: " + string(o_client.socket))
		//draw_text(200,105,"connected: " + string(o_client.connected))
		//draw_text(200,120,"persistence: "+string(o_client.persistent))
	}
}	
#endregion

//Menu Bar
draw_set_color(c_gray)
draw_set_alpha(1)
draw_rectangle(-1,-1,camera_get_view_width(camera),menu_barY_1,false)

if mouseover_menu_file{
	draw_set_color(color_menu_highlighted)	
}
else draw_set_color(c_gray)
draw_rectangle(menu_barX_0,menu_barY_0,menu_barX_1,menu_barY_1,false)

if mouseover_menu_tools{
	draw_set_color(color_menu_highlighted)
}
else draw_set_color(c_gray)
draw_rectangle(menu_barX_1,menu_barY_0,menu_barX_2,menu_barY_1,false)

if mouseover_menu_admin and admin = 1{
	draw_set_color(color_menu_highlighted)	
}
else draw_set_color(c_gray)
draw_rectangle(menu_barX_2,menu_barY_0,menu_barX_3,menu_barY_1,false)

if fileopen = true{
	#region Settings
	if mouseover_menu_settings{
		draw_set_color(color_menu_highlighted)	
	}
	else draw_set_color(c_gray)
	draw_rectangle(menu_barX_0,menu_barY_1,menu_barX_1+26,menu_barY_1*2,false)
	
	#endregion
	
	#region Exit
	if mouseover_menu_exit{
		draw_set_color(color_menu_highlighted)	
	}
	else draw_set_color(c_gray)
	draw_rectangle(menu_barX_0,menu_barY_1*2,48,menu_barY_1*3,false)
	
	#endregion
	
	draw_set_color(c_black)
	draw_text(2,menu_barY_1,menu_1_1_text)	//Settings
	draw_text(2,menu_barY_1*2,menu_1_2_text)	//Exit
}
if toolsopen = true{
	#region Themes
	if mouseover_menu_themes{
		draw_set_color(color_menu_highlighted)	
	}
	else draw_set_color(c_gray)
	draw_rectangle(menu_barX_1,menu_barY_1,118,menu_barY_1*2,false)
	
	if themesopen = true{
		
	}
	
	#endregion
	
	#region Diceroll
	if admin = 1{
		if mouseover_menu_diceroll{
			draw_set_color(color_menu_highlighted)	
		}
		else draw_set_color(c_gray)
		draw_rectangle(menu_barX_1,menu_barY_1*2,145,menu_barY_1*3,false)
	}
	#endregion
	
	draw_set_color(c_black)
	draw_text(58,menu_barY_1+2,menu_2_1_text)	// Themes
	if admin = 1{
		draw_text(58,menu_barY_1*2+2,menu_2_2_text)	//Dice Roll
	}
}

if adminopen = true{
	#region manageuser
	if mouseover_menu_manageuser{
		draw_set_color(color_menu_highlighted)	
	}
	else draw_set_color(c_gray)
	draw_rectangle(menu_barX_2,menu_barY_1,230,menu_barY_1*2,false)
	draw_set_color(c_black)
	draw_text(118,menu_barY_1+2,menu_3_1_text)	//Manage Users
	#endregion
	
}

draw_set_color(c_black)
draw_text(5,2,menu_1_text)
draw_text(58,2,menu_2_text)
if admin = 1{
	draw_text(118,2,menu_3_text)
}

if database_acquired = true{
	var _name
	if profile != -1
	{
		_name = ds_list_find_value(database_names,profile)
		if is_undefined(_name){
			_name = "Guest"	
		}
	}
	else _name = "Guest"
		draw_text((window_get_width()-string_width(_name)-2),2,_name)

//Active Connection
if connection = true{
	draw_sprite(s_connection_connected,0,window_get_width()-string_width(_name)-28,0)
}
else draw_sprite(s_connection_disconnected,0,window_get_width()-string_width(_name)-28,0)

}

