var read_buffer = argument[0]
var msgid = buffer_read(read_buffer,buffer_u8)

switch(msgid)
{
	case 0:
	#region On Connection
		global.totalusers = buffer_read(read_buffer,buffer_u32)
		var _compileduserlist = buffer_read(read_buffer,buffer_string)
		var _compiledstatuslist = buffer_read(read_buffer,buffer_string)
		var _compiledcurrentstatuslist = buffer_read(read_buffer,buffer_string)
		var _compiledtextboxlist = buffer_read(read_buffer,buffer_string)
		var _compiledtimelist = buffer_read(read_buffer,buffer_string)
		var _compiledcheckmarklist = buffer_read(read_buffer,buffer_string)
		var _compiledwindowsnamelist = buffer_read(read_buffer,buffer_string)
		var _compiledadminrightslist = buffer_read(read_buffer,buffer_string)
		
		//global.activeclients = buffer_read(read_buffer,buffer_u32)
		
		global.userlist = ds_list_create()
		global.statuslist = ds_list_create()
		global.currentstatuslist = ds_list_create()
		global.textboxlist = ds_list_create()
		global.timelist = ds_list_create()
		global.checkmarklist = ds_list_create()
		global.windowsnames = ds_list_create()
		global.adminrights = ds_list_create()
		
		ds_list_read(global.userlist,_compileduserlist)
		ds_list_read(global.statuslist,_compiledstatuslist)
		ds_list_read(global.currentstatuslist,_compiledcurrentstatuslist)
		ds_list_read(global.textboxlist,_compiledtextboxlist)
		ds_list_read(global.timelist,_compiledtimelist)
		ds_list_read(global.checkmarklist,_compiledcheckmarklist)
		ds_list_read(global.windowsnames,_compiledwindowsnamelist)
		ds_list_read(global.adminrights,_compiledadminrightslist)
		
		with o_controller
		{
			scr_controller_populateboard()
		}
		
		//with o_connection_light{
		//	connected = true
		//	sprite_index = s_connection_connected
		//}	
		
	break;
	#endregion
	case 1:
	#region Change Status
		var _statusid, _status, _time
		_statusid = buffer_read(read_buffer,buffer_u32)
		_status = buffer_read(read_buffer,buffer_u32) 
		_time = buffer_read(read_buffer,buffer_string)
		
		with o_status
		{
			if statusid = _statusid
			{
				status = _status	
			}
		}
		with o_time
		{
			if timeid = _statusid
			{
				time = _time
			}
		}
	break;
	#endregion
	case 2:
	#region Active Connection
		
	break;
	#endregion
	case 3:
	#region Textbox
		var _textboxid, __text
		
		_textboxid = buffer_read(read_buffer,buffer_u32)
		__text = buffer_read(read_buffer,buffer_string)
		
		with o_textbox
		{
			if textboxid = _textboxid
			{
				text = __text	
			}
		}
	break;
	#endregion
	case 4:
	#region Message
		var _message
		_message = buffer_read(read_buffer,buffer_string)
		
		show_message(_message)
		
	break;
	#endregion
	case 5:
	#region Dice Roll
		var compiled_order = buffer_read(read_buffer,buffer_string)
		order = ds_list_create()
		ds_list_read(order,compiled_order)
		
		if ds_list_find_value(order,0) = "On Cooldown"	//Still on cooldown?
		{
			var	cooldown = ds_list_find_value(order,1)
			show_message("It is on cooldown! " + string(cooldown) + " seconds remaining")
		}
		else											//Do the dice roll
		{
			with o_controller
			{
				diceroll = ds_list_size(other.order)	
				diceorder = other.order
				instance_create_layer(0,0,"Instances",o_arrow)
				show_debug_message("Diceroll: " + string(diceroll))
			}
		}
	
	break;
	#endregion
	case 6:
	#region Checkmarks
	var _selected = buffer_read(read_buffer,buffer_u32)
	var _ID = buffer_read(read_buffer,buffer_u32)
	
	with o_checkbox
	{
		if ID = _ID
		{
			selected = _selected	
		}
	}
	
	break;
	#endregion 
	case 7:
	#region Update Active Client Count
		//global.activeclients = buffer_read(read_buffer,buffer_u32)
	
	break;
	#endregion
	case 8:
	#region ManageUsers Update
		var _compiled_list_firstname_ID, _compiled_list_firstname_value, _compiled_list_windowsname_ID,
		_compiled_list_windowsname_value, _compiled_list_admin_ID, _compiled_list_admin_value,
		_list_firstname_ID, _list_firstname_value, _list_windowsname_ID, _list_windowsname_value,
		_list_admin_ID, _list_admin_value, u, _ID, _value

		_compiled_list_firstname_ID = buffer_read(read_buffer,buffer_string)
		_compiled_list_firstname_value = buffer_read(read_buffer,buffer_string)
		_compiled_list_windowsname_ID = buffer_read(read_buffer,buffer_string)
		_compiled_list_windowsname_value = buffer_read(read_buffer,buffer_string)
		_compiled_list_admin_ID = buffer_read(read_buffer,buffer_string)
		_compiled_list_admin_value = buffer_read(read_buffer,buffer_string)	
		
		_list_firstname_ID = ds_list_create()
		_list_firstname_value = ds_list_create()
		_list_windowsname_ID = ds_list_create()
		_list_windowsname_value = ds_list_create()
		_list_admin_ID = ds_list_create()
		_list_admin_value = ds_list_create()

		ds_list_read(_list_firstname_ID,_compiled_list_firstname_ID)
		ds_list_read(_list_firstname_value,_compiled_list_firstname_value)
		ds_list_read(_list_windowsname_ID,_compiled_list_windowsname_ID)
		ds_list_read(_list_windowsname_value,_compiled_list_windowsname_value)
		ds_list_read(_list_admin_ID,_compiled_list_admin_ID)
		ds_list_read(_list_admin_value,_compiled_list_admin_value)
		
		if !ds_list_empty(_list_firstname_ID){
			for (u=0;u<ds_list_size(_list_firstname_ID);u++)
			{
				_ID = ds_list_find_value(_list_firstname_ID,u)
				_value = ds_list_find_value(_list_firstname_value,u)
				
				ds_list_insert(global.userlist,_ID,_value)
			}
		}
		if !ds_list_empty(_list_windowsname_ID){
			show_debug_message("Windowsname list size: " + string(ds_list_size(_list_admin_ID)))
			for (u=0;u<ds_list_size(_list_windowsname_ID);u++)
			{
				_ID = ds_list_find_value(_list_windowsname_ID,u)
				_value = ds_list_find_value(_list_windowsname_value,u)
				
				ds_list_insert(global.windowsnames,_ID,_value)
			}
		}
		if !ds_list_empty(_list_admin_ID){
			show_debug_message("Admin list size: " + string(ds_list_size(_list_admin_ID)))
			for (u=0;u<ds_list_size(_list_admin_ID);u++)
			{
				_ID = ds_list_find_value(_list_admin_ID,u)
				_value = ds_list_find_value(_list_admin_value,u)
				
				ds_list_insert(global.adminrights,_ID,_value)
			}
		}
		
		//show_debug_message("6 Windowsname: " + string(ds_list_find_value(global.windowsnames,6)))
		//show_debug_message("6 Adminrights: " + string(ds_list_find_value(global.adminrights,6)))
		//show_debug_message("7 Windowsname: " + string(ds_list_find_value(global.windowsnames,7)))
		//show_debug_message("7 Adminrights: " + string(ds_list_find_value(global.adminrights,7)))
		
		
		if room = 1
		{
			with o_manageuser_controller
			{
				scr_manageuser_populate()
			}
		}
	
	break;
	#endregion
}