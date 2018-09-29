var _firstname, _windowsname, _admin, i, _ID, _list_firstname_ID, _list_firstname_value, _list_windowsname_ID,
_list_windowsname_value, _list_admin_ID, _list_admin_value, _compiled_list_firstname_ID, 
_compiled_list_firstname_value, _compiled_list_windowsname_ID, _compiled_list_windowsname_value, 
_compiled_list_admin_ID, _compiled_list_admin_value

_list_firstname_ID = ds_list_create()
_list_firstname_value = ds_list_create()
_list_windowsname_ID = ds_list_create()
_list_windowsname_value = ds_list_create()
_list_admin_ID = ds_list_create()
_list_admin_value = ds_list_create()

for (i=0;i<global.totalusers;i++)
{
	with o_manageuser_firstname
	{
		if ID = i
		{
			if text_initial != text
			{
				ds_list_add(_list_firstname_ID,ID)
				ds_list_add(_list_firstname_value,text)
				show_debug_message(string(ID))
				show_debug_message(string(text))
			}
		}
	}
	//show_debug_message("i : " + string(i))
	//show_debug_message("Firstname ID: " + string(ds_list_find_value(_list_firstname_ID,i)))
	//show_debug_message("Firstname Value: " + string(ds_list_find_value(_list_firstname_value,i)))
	with o_manageuser_windowsname
	{
		if ID = i
		{
			if text_initial != text
			{
				ds_list_add(_list_windowsname_ID,ID)
				ds_list_add(_list_windowsname_value,text)	
			}
		}
	}
	//show_debug_message("Windowsname ID: " + string(ds_list_find_value(_list_windowsname_ID,i)))
	//show_debug_message("Windowsname Value: " + string(ds_list_find_value(_list_windowsname_value,i)))	
	with o_manageuser_admin
	{
		if ID = i
		{
			if toggle_initial != toggle
			{
				ds_list_add(_list_admin_ID,ID)
				ds_list_add(_list_admin_value,toggle)	
			}
		}
	}
	//show_debug_message("Adminrights ID: " + string(ds_list_find_value(_list_admin_ID,i)))
	//show_debug_message("Adminrights Value: " + string(ds_list_find_value(_list_admin_value,i)))	
	//show_debug_message("")
}

//for(i=0;i<instance_number(o_manageuser_firstname);i++)
//{
//	show_message(string(ds_list_find_value(_list_firstname,i)))
//}

if !ds_list_empty(_list_firstname_ID) or !ds_list_empty(_list_windowsname_ID) or !ds_list_empty(_list_admin_ID)
{
	//IF THERE IS ANY CHANGE WHAT SO EVER
	//Now we need to compile the list of changes		
	
	_compiled_list_firstname_ID = ds_list_write(_list_firstname_ID)
	_compiled_list_firstname_value = ds_list_write(_list_firstname_value)
	_compiled_list_windowsname_ID = ds_list_write(_list_windowsname_ID)
	_compiled_list_windowsname_value = ds_list_write(_list_windowsname_value)
	_compiled_list_admin_ID = ds_list_write(_list_admin_ID)	
	_compiled_list_admin_value = ds_list_write(_list_admin_value)
	
	with o_client
	{
		var buffer = buffer_create(2048,buffer_grow,1)
		
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,8)
		buffer_write(buffer,buffer_string,_compiled_list_firstname_ID)
		buffer_write(buffer,buffer_string,_compiled_list_firstname_value)
		buffer_write(buffer,buffer_string,_compiled_list_windowsname_ID)
		buffer_write(buffer,buffer_string,_compiled_list_windowsname_value)
		buffer_write(buffer,buffer_string,_compiled_list_admin_ID)
		buffer_write(buffer,buffer_string,_compiled_list_admin_value)
		network_send_packet(socket,buffer,buffer_tell(buffer))		
		
	}	
}