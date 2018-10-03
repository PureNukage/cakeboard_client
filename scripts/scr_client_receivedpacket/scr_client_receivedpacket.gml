var read_buffer = argument[0]
var msgid = buffer_read(read_buffer,buffer_u8)

switch(msgid)
{
	case 0:
	#region On Connection
		var _totalusers = buffer_read(read_buffer,buffer_u32)
		var _whoami = buffer_read(read_buffer,buffer_u32)
		var _compileduserlist = buffer_read(read_buffer,buffer_string)
		var _compiledstatuslist = buffer_read(read_buffer,buffer_string)
		var _compiledcurrentstatuslist = buffer_read(read_buffer,buffer_string)
		var _compiledtextboxlist = buffer_read(read_buffer,buffer_string)
		var _compiledtimelist = buffer_read(read_buffer,buffer_string)
		var _compiledcheckmarklist = buffer_read(read_buffer,buffer_string)
		var _compiledwindowsnamelist = buffer_read(read_buffer,buffer_string)
		var _compiledadminrightslist = buffer_read(read_buffer,buffer_string)
		
		//global.activeclients = buffer_read(read_buffer,buffer_u32)
		
		//Who did I sign into
		if _whoami = -1{
			//Guest
			o_controller.profile = -1
		}
		else{
			//I signed into someone!
			o_controller.profile = _whoami
		}		
		
		show_debug_message("whoami: " + string(_whoami))
		
		with o_controller
		{
			totalusers = _totalusers
			database_names = ds_list_create()
			statuslist = ds_list_create()
			database_statuses = ds_list_create()
			database_textbox = ds_list_create()
			database_time = ds_list_create()
			database_checkmark = ds_list_create()
			database_windowsnames = ds_list_create()
			database_adminrights = ds_list_create()
		
		
			ds_list_read(database_names,_compileduserlist)
			ds_list_read(statuslist,_compiledstatuslist)
			ds_list_read(database_statuses,_compiledcurrentstatuslist)
			ds_list_read(database_textbox,_compiledtextboxlist)
			ds_list_read(database_time,_compiledtimelist)
			ds_list_read(database_checkmark,_compiledcheckmarklist)
			ds_list_read(database_windowsnames,_compiledwindowsnamelist)
			ds_list_read(database_adminrights,_compiledadminrightslist)
			
			//Do I have admin rights?
			with o_controller
			{
				var _admin = ds_list_find_value(database_adminrights,profile)
				if _admin = "undefined"{
					admin = -1 //Guest			
				}
				else admin = _admin
			}
			
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
		
		ds_list_replace(o_controller.database_statuses,_statusid,_status)
		ds_list_replace(o_controller.database_time,_statusid,_time)
		
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
	
	ds_list_replace(o_controller.database_checkmark,_ID,_selected)
	
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
			
		var _ID = buffer_read(read_buffer,buffer_u32)
		var _section = buffer_read(read_buffer,buffer_string)
		
		switch(_section)
		{
			case "names":
				var _text = buffer_read(read_buffer,buffer_string)
				ds_list_replace(o_controller.database_names,_ID,_text)
			break;
			case "windowsnames":
				var _text = buffer_read(read_buffer,buffer_string)
				ds_list_replace(o_controller.database_windowsnames,_ID,_text)
			break;
			case "adminrights":
				var _admin = buffer_read(read_buffer,buffer_u32)
				ds_list_replace(o_controller.database_adminrights,_ID,_admin)
			break;
		}
		
		if room = 0
		{
			with o_board_PARENT{	instance_destroy()	}
			with o_controller{	scr_controller_populateboard()	}
		}
		if room = 1
		{
			with o_manageuser_controller{	instance_destroy()	}
			with o_manageuser_firstname{	instance_destroy()	}
			with o_manageuser_windowsname{	instance_destroy()	}
			with o_manageuser_admin{	instance_destroy()	}
			with o_manageuser_remove{	instance_destroy()	}	
			with o_back{	instance_destroy()	}
			instance_create_layer(544,128,"Instances",o_manageuser_controller)
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
			
			ds_list_clear(database_names)
			//ds_list_clear(statuslist)
			ds_list_clear(database_statuses)
			ds_list_clear(database_textbox)
			ds_list_clear(database_time)
			ds_list_clear(database_checkmark)
			ds_list_clear(database_windowsnames)
			ds_list_clear(database_adminrights)
		
			ds_list_read(database_names,_compiled_names)
			//ds_list_read(statuslist,_compiled_status)
			ds_list_read(database_statuses,_compiled_status)
			ds_list_read(database_textbox,_compiled_textbox)
			ds_list_read(database_time,_compiled_time)
			ds_list_read(database_checkmark,_compiled_checkmark)
			ds_list_read(database_windowsnames,_compiled_windowsnames)
			ds_list_read(database_adminrights,_compiled_adminrights)
			
		}
				
		if room = board_0
		{
			with o_board_PARENT
			{
				instance_destroy()	
			}
			with o_freshboard	{	instance_destroy()	}
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
			with o_back{	instance_destroy()	}
			instance_create_layer(544,128,"Instances",o_manageuser_controller)
		}	
		
	
	break;
	#endregion
}