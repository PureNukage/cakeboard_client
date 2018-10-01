if mouseover_menu_file{
	fileopen = !fileopen
}
if mouseover_menu_tools{
	toolsopen= !toolsopen
}
if mouseover_menu_admin{
	adminopen = !adminopen
}

else if mouseover_menu_manageuser{
	room_goto(manageuser_1)	
	roomprevious = room
	adminopen = false
	//Backgrounds
	scr_controller_background()
}
else {
adminopen = false
toolsopen = false
fileopen = false
}