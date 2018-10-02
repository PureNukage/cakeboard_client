var read_buffer = argument[0]
var msgid = buffer_read(read_buffer,buffer_u8)

switch(msgid)
{
	case 0:
	#region On Connection
		var _totalusers = buffer_read(read_buffer,buffer_u32)
		var _compileduserlist = buffer_read(read_buffer,buffer_string)
		var _compiledstatuslist = buffer_read(read_buffer,buffer_string)
		var _compiledcurrentstatuslist = buffer_read(read_buffer,buffer_string)
		var _compiledtextboxlist = buffer_read(read_buffer,buffer_string)
		var _compiledtimelist = buffer_read(read_buffer,buffer_string)
		var _compiledcheckmarklist = buffer_read(read_buffer,buffer_string)
		var _compiledwindowsnamelist = buffer_read(read_buffer,buffer_string)
		var _compiledadminrightslist = buffer_read(read_buffer,buffer_string)
		
		//global.activeclients = buffer_read(read_buffer,buffer_u32)
		
		with o_controller
		{
			totalusers = _totalusers
			userlist = ds_list_create()
			statuslist = ds_list_create()
			currentstatuslist = ds_list_create()
			textboxlist = ds_list_create()
			timelist = ds_list_create()
			checkmarklist = ds_list_create()
			windowsnames = ds_list_create()
			adminrights = ds_list_create()
		
		
			ds_list_read(userlist,_compileduserlist)
			ds_list_read(statuslist,_compiledstatuslist)
			ds_list_read(currentstatuslist,_compiledcurrentstatuslist)
			ds_list_read(textboxlist,_compiledtextboxlist)
			ds_list_read(timelist,_compiledtimelist)
			ds_list_read(checkmarklist,_compiledcheckmarklist)
			ds_list_read(windowsnames,_compiledwindowsnamelist)
			ds_list_read(adminrights,_compiledadminrightslist)
			
			if totalusers = 0{
				freshboard = true
			}
				
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
		
		ds_list_replace(o_controller.currentstatuslist,_statusid,_status)
		ds_list_replace(o_controller.timelist,_statusid,_time)
		
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
		
		ds_list_replace(o_controller.textboxlist,_textboxid,__text)
		
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
	
	ds_list_replace(o_controller.checkmarklist,_ID,_selected)
	
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
				
				ds_list_replace(o_controller.userlist,_ID,_value)
			}
		}
		if !ds_list_empty(_list_windowsname_ID){
			show_debug_message("Windowsname list size: " + string(ds_list_size(_list_admin_ID)))
			for (u=0;u<ds_list_size(_list_windowsname_ID);u++)
			{
				_ID = ds_list_find_value(_list_windowsname_ID,u)
				_value = ds_list_find_value(_list_windowsname_value,u)
				
				ds_list_replace(o_controller.windowsnames,_ID,_value)
			}
		}
		if !ds_list_empty(_list_admin_ID){
			show_debug_message("Admin list size: " + string(ds_list_size(_list_admin_ID)))
			for (u=0;u<ds_list_size(_list_admin_ID);u++)
			{
				_ID = ds_list_find_value(_list_admin_ID,u)
				_value = ds_list_find_value(_list_admin_value,u)
				
				ds_list_replace(o_controller.adminrights,_ID,_value)
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
	case 9:
	#region ManageUsers Add/Remove
	
		var _totalusers_new = buffer_read(read_buffer,buffer_u32)
		var _compiled_names = buffer_read(read_buffer,buffer_string)
		var _compiled_windowsnames = buffer_read(read_buffer,buffer_string)
		var _compiled_adminrights = buffer_read(read_buffer,buffer_string)
		var _compiled_status = buffer_read(read_buffer,buffer_string)
		var _compiled_textbox = buffer_read(read_buffer,buffer_string)
		var _compiled_time = buffer_read(read_buffer,buffer_string)
		var _compiled_checkmark = buffer_read(read_buffer,buffer_string)
		
		with o_controller
		{
			totalusers = _totalusers_new
			if totalusers = 0{
				freshboard = true	
			}
			else freshboard = false
			
			ds_list_clear(userlist)
			//ds_list_clear(statuslist)
			ds_list_clear(currentstatuslist)
			ds_list_clear(textboxlist)
			ds_list_clear(timelist)
			ds_list_clear(checkmarklist)
			ds_list_clear(windowsnames)
			ds_list_clear(adminrights)
		
			ds_list_read(userlist,_compiled_names)
			//ds_list_read(statuslist,_compiled_status)
			ds_list_read(currentstatuslist,_compiled_status)
			ds_list_read(textboxlist,_compiled_textbox)
			ds_list_read(timelist,_compiled_time)
			ds_list_read(checkmarklist,_compiled_checkmark)
			ds_list_read(windowsnames,_compiled_windowsnames)
			ds_list_read(adminrights,_compiled_adminrights)
			
		}
				
		if room = board_0
		{
			with o_board_PARENT
			{
				instance_destroy()	
			}
			with o_controller
			{
				scr_controller_populateboard()
			}
		}
		if room = manageuser_1
		{
			with o_manageuser_controller
			{
				instance_destroy()	
			}
			with o_manageuser_firstname{	instance_destroy()	}
			with o_manageuser_windowsname{	instance_destroy()	}
			with o_manageuser_admin{	instance_destroy()	}
			with o_manageuser_remove{	instance_destroy()	}	
			with o_manageuser_save{	instance_destroy()	}
			with o_back{	instance_destroy()	}
			instance_create_layer(544,128,"Instances",o_manageuser_controller)
		}	
		
	
	break;
	#endregion
}