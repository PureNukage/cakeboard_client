var i, _x, _y, _nameplate, _windowsname, _admin, _remove, _add

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

for (i=0;i<=o_controller.totalusers;i++)
{
	_x = x
	_nameplate = instance_create_layer(_x,_y,"Instances",o_manageuser_firstname)
	_nameplate.ID = i
	if i < o_controller.totalusers
	{
		_nameplate.text = ds_list_find_value(o_controller.userlist,i)
		_nameplate.text_initial = ds_list_find_value(o_controller.userlist,i)
	}
	else
	{
		_nameplate.text = "First Name"
		_nameplate.text_initial = "First Name"
		_nameplate.imagealpha = .5
		_nameplate.Font = font2
		_nameplate.maxlength = 120
	}
	_x += 132
	
	_windowsname = instance_create_layer(_x,_y,"Instances",o_manageuser_windowsname)
	_windowsname.ID = i
	if i < o_controller.totalusers
	{
		_windowsname.text = ds_list_find_value(o_controller.windowsnames,i)
		_windowsname.text_initial = ds_list_find_value(o_controller.windowsnames,i)
	}
	else
	{
		_windowsname.text = "Windows Username"
		_windowsname.text_initial = "Windows Username"
		_windowsname.imagealpha = .5
		_windowsname.Font = font2
		_windowsname.maxlength = 120
	}
	_x += 132	
	
	_admin = instance_create_layer(_x,_y,"Instances",o_manageuser_admin)
	_admin.ID = i
	if i < o_controller.totalusers
	{
		_admin.toggle = ds_list_find_value(o_controller.adminrights,i)
		_admin.toggle_initial = ds_list_find_value(o_controller.adminrights,i)
	}
	else
	{
		_admin.toggle = 0
		_admin.toggle_inital = 0
		_admin.imagealpha = .5
	}
	_x += 132
	
	_remove = instance_create_layer(_x,_y,"Instances",o_manageuser_remove)
	_remove.ID = i
	if i < o_controller.totalusers{
	}
	else
	{
		_remove.imagealpha = .5
		_remove.text = "Add"
		_remove.color = make_color_rgb(30,198,26)
	}
	
	_y += 56
}

instance_create_layer(_x+200,_y+128,"Instances",o_manageuser_save)
instance_create_layer(_x+340,_y+128,"Instances",o_back)