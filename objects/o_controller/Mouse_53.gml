#region Top Menu Options
if mouseover_menu_file{
	fileopen = !fileopen
}
else if !mouseover_menu_settings and !mouseover_menu_exit and fileopen = true{
	fileopen = false
}

if mouseover_menu_tools{
	toolsopen= !toolsopen
	if instance_number(o_dice_menu) > 0 {	with o_dice_menu {	instance_destroy()	}}
}
else if !mouseover_menu_diceroll and !mouseover_menu_themes and !mouseover_themes_menu and toolsopen = true{
	if !instance_position(mouse_x,mouse_y,o_dice_menu){		
		show_debug_message("shmackledorf")
		toolsopen = false
		themesopen = false
		if instance_number(o_dice_menu) > 0{	with o_dice_menu{	instance_destroy()	}}
		if instance_number(o_theme_menu) > 0{	with o_theme_menu{	instance_destroy() }}
	}
}

if mouseover_menu_admin and admin = 1{
	adminopen = !adminopen
}
else if !mouseover_menu_manageuser{
	adminopen = false
}

#endregion

#region File Extended Menu

if mouseover_menu_settings and fileopen = true{
	room_goto(settings_2)
	roomprevious = room 
	fileopen = false
}
if mouseover_menu_exit and fileopen = true{
	game_end()	
}

#endregion

#region Admin Extended Menu

if mouseover_menu_manageuser and adminopen = true{
	if room = board_0
	{
		room_goto(manageuser_1)	
		roomprevious = room
		adminopen = false
		//Backgrounds
		scr_controller_background()
	}
}

else
{
//adminopen = false
//toolsopen = false
//fileopen = false
}

#endregion

#region Tools Extended Menu

if toolsopen = true
{
	if mouseover_menu_themes
	{
		scr_theme_menu(x+60,y+80)
	}
	if mouseover_menu_diceroll and admin = 1 ////
	{
		//scr_dicemenu(146,menu_barY_1*2)	
		//var cx = camera_get_view_x(view_camera);
		//var cy = camera_get_view_y(view_camera);
		/////make the adjustment to gui
		//var xx = (x-cx)*display_scalex;
		//var yy = (y-cy)*display_scaley;
		if instance_number(o_dice_menu) <= 0
		{
			if instance_number(o_theme_menu) >0 {	with o_theme_menu { instance_destroy() }}
			//scr_dicemenu(x+menu_barX_1,y+menu_barY_1*2)	
			scr_dicemenu(x+60,y+80)	
		}
		else
		{
			var list = ds_list_create()
			for (var i=0; i<o_controller.totalusers; i++)
			{
				with o_dice_menu
				{
					if ID = i
					{
						if selected = true
						{
							ds_list_add(list,i)
						}
					}
				}	
			}
			if ds_list_size(list) > 0
			{
				with o_client
				{
					scr_client_diceroll(list)
				}
				if instance_number(o_dice_menu) > 0{	with o_dice_menu{	instance_destroy()	}}
			}
		}
	}
	else if instance_position(mouse_x,mouse_y,o_dice_menu)
	{
		exit;
	}
	else
	{
		if instance_number(o_dice_menu) > 0
		{
			with o_dice_menu
			{
				instance_destroy()	
			}
		}
	}
}

#endregion