#region Top Menu Options
if mouseover_menu_file{
	fileopen = !fileopen
}
else fileopen = false

if mouseover_menu_tools{
	toolsopen= !toolsopen
}
else toolsopen = false

if mouseover_menu_admin{
	adminopen = !adminopen
}
else if !mouseover_menu_manageuser{
	adminopen = false
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
fileopen = false
}

#endregion

#region Tools Extended Menu

if toolsopen = true
{
	if mouseover_menu_themes
	{
		// to do	
	}
}

#endregion