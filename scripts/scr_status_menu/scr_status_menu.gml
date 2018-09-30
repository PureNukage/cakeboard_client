var numberofstatuses, a, whichstatus, statusmenuX, statusmenuY, _statusid, currentstatusmenu, searchstatus

whichstatus = argument[0]
_statusid = argument[1]
numberofstatuses = ds_list_size(o_controller.statuslist)
statusmenuX = whichstatus.x + 128
statusmenuY = whichstatus.y - 60


//Assemble the Menu
for (a = 0; a<numberofstatuses; a++)
{
	currentstatusmenu = instance_create_layer(statusmenuX,statusmenuY,"Menu",o_status_menu)
	searchstatus = ds_list_find_value(o_controller.statuslist,a)
	with currentstatusmenu
	{
		statusmenu = a
		statusmenustatus = searchstatus
		statusmenuid = _statusid
	}
	statusmenuY += 40
}