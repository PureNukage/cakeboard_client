var i, _x, _y, _nameplate, _windowsname, _admin, _remove

_x = x
_y = y

if instance_number(o_manageuser_firstname) > 0
{
	with o_manageuser_firstname
	{
		instance_destroy()
	}
	with o_manageuser_windowsname
	{
		instance_destroy()
	}
	with o_manageuser_admin
	{
		instance_destroy()	
	}
}

for (i=0;i<o_controller.totalusers;i++)
{
	_x = x
	_nameplate = instance_create_layer(_x,_y,"Instances",o_manageuser_firstname)
	_nameplate.ID = i
	_nameplate.text = ds_list_find_value(o_controller.userlist,i)
	_nameplate.text_initial = ds_list_find_value(o_controller.userlist,i)
	_x += 132
	
	_windowsname = instance_create_layer(_x,_y,"Instances",o_manageuser_windowsname)
	_windowsname.ID = i
	_windowsname.text = ds_list_find_value(o_controller.windowsnames,i)
	_windowsname.text_initial = ds_list_find_value(o_controller.windowsnames,i)
	_x += 132
	
	_admin = instance_create_layer(_x,_y,"Instances",o_manageuser_admin)
	_admin.ID = i
	_admin.toggle = ds_list_find_value(o_controller.adminrights,i)
	_admin.toggle_initial = ds_list_find_value(o_controller.adminrights,i)
	_x += 132
	
	_remove = instance_create_layer(_x,_y,"Instances",o_manageuser_remove)
	
	_y += 56
}

instance_create_layer(_x+200,_y+128,"Instances",o_manageuser_save)
instance_create_layer(_x+340,_y+128,"Instances",o_back)