if debug_on
{
	//draw_text(x+15,y+15,"Active Clients: " + string(global.activeclients))
	draw_text(x+15,y+30,"Total Users: "+string(totalusers))
	draw_text(x+200,y+30,"Freshboard: " +string(freshboard))
	draw_text(x+15,y+45,"User: " + string(environment_get_variable("USERNAME")))
	draw_text(x+200,y+45,"Profile: " + string(profile))
	draw_text(x+15,y+60,"Mouse_x: " + string(gui_x))
	draw_text(x+200,y+60,"Admin: " + string(admin))
	draw_text(x+15,y+75,"Mouse_y: " + string(gui_y))
	draw_text(x+15,y+90,"surface_x: " + string(surface_get_width(application_surface)))
	draw_text(x+15,y+105,"surface_y: " + string(surface_get_height(application_surface)))
	
	//Menu Debug
	draw_text(menu_barX_1,menu_barY_1*6,"themes width: " + string(string_width(menu_2_1_text)))
	draw_text(menu_barX_2,menu_barY_1*7,"manage users width: " + string(string_width(menu_3_1_text)))
}	

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

}
if toolsopen = true{
	#region themes
	if mouseover_menu_themes{
		draw_set_color(color_menu_highlighted)	
	}
	else draw_set_color(c_gray)
	draw_rectangle(menu_barX_1,menu_barY_1,118,menu_barY_1*2,false)
	draw_set_color(c_black)
	draw_text(58,menu_barY_1+2,menu_2_1_text)	// Themes
	#endregion
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