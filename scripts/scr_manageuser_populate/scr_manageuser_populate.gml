var i, _x, _y, _nameplate, _windowsname, _admin, _remove, _add

_x = x
_y = y

//if instance_number(o_manageuser_firstname) > 0
//{
//	with o_manageuser_firstname
//	{
//		instance_destroy()
//	}
//	with o_manageuser_windowsname
//	{
//		instance_destroy()
//	}
//	with o_manageuser_admin
//	{
//		instance_destroy()	
//	}
//}

if o_controller.freshboard = false
{
for (i=0;i<o_controller.totalusers+1;i++)
{
	_x = x
	_nameplate = instance_create_layer(_x,_y,"Instances",o_manageuser_firstname)
	_nameplate.ID = i
	if i < o_controller.totalusers
	{
		_nameplate.text = ds_list_find_value(o_controller.database_names,i)
		_nameplate.text_initial = ds_list_find_value(o_controller.database_names,i)
	}
	else
	{
		_nameplate.y += 30
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
		_windowsname.text = ds_list_find_value(o_controller.database_windowsnames,i)
		_windowsname.text_initial = ds_list_find_value(o_controller.database_windowsnames,i)
	}
	else
	{
		_windowsname.y += 30
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
		_admin.toggle = ds_list_find_value(o_controller.database_adminrights,i)
		_admin.toggle_initial = ds_list_find_value(o_controller.database_adminrights,i)
	}
	else
	{
		_admin.y += 30
		_admin.toggle = 0
		_admin.toggle_inital = 0
		_admin.imagealpha = .5
	}
	_x += 132
	
	_remove = instance_create_layer(_x,_y,"Instances",o_manageuser_remove)
	_remove.ID = i
	_remove.x += 30
	if i < o_controller.totalusers{
	}
	else
	{
		_remove.y += 30
		//_remove.imagealpha = .5
		_remove.text = "Add"
		_remove.color = make_color_rgb(30,198,26)
	}
	
	_y += 56
}
}
if o_controller.freshboard = true
{
	var _firstname = instance_create_layer(_x,_y,"Instances",o_manageuser_firstname)
	_firstname.ID = 0
	_firstname.text = "First Name"
	_firstname.text_initial = "First Name"
	_firstname.imagealpha = .5
	_firstname.Font = font2
	_firstname.maxlength = 120
	_x += 132

	var _windowsname = instance_create_layer(_x,_y,"Instances",o_manageuser_windowsname)
	_windowsname.ID = 0
	_windowsname.text = "Windows Username"
	_windowsname.text_initial = "Windows Username"
	_windowsname.imagealpha = .5
	_windowsname.Font = font2
	_windowsname.maxlength = 120	
	_x += 132
	
	var _admin = instance_create_layer(_x,_y,"Instances",o_manageuser_admin)
	_admin.ID = 0
	_admin.toggle = 0
	_admin.toggle_inital = 0
	_admin.imagealpha = .5	
	_x += 132
	
	var _remove = instance_create_layer(_x,_y,"Instances",o_manageuser_remove)
	_remove.ID = 0
	_remove.text = "Add"
	_remove.color = make_color_rgb(30,198,26)
	_y += 56
}

instance_create_layer(_x+340,_y+128,"Instances",o_back)