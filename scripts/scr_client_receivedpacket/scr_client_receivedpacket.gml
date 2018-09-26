var read_buffer = argument[0]
var msgid = buffer_read(read_buffer,buffer_u8)

switch(msgid)
{
	case 0:
	//Total Users
		global.totalusers = buffer_read(read_buffer,buffer_u32)
		compileduserlist = buffer_read(read_buffer,buffer_string)
		compiledstatuslist = buffer_read(read_buffer,buffer_string)
		compiledcurrentstatuslist = buffer_read(read_buffer,buffer_string)
		compiledtextboxlist = buffer_read(read_buffer,buffer_string)
		compiledtimelist = buffer_read(read_buffer,buffer_string)
		compiledcheckmarklist = buffer_read(read_buffer,buffer_string)
		
		//global.activeclients = buffer_read(read_buffer,buffer_u32)
		
		global.userlist = ds_list_create()
		global.statuslist = ds_list_create()
		global.currentstatuslist = ds_list_create()
		global.textboxlist = ds_list_create()
		global.timelist = ds_list_create()
		global.checkmarklist = ds_list_create()
		
		ds_list_read(global.userlist,compileduserlist)
		ds_list_read(global.statuslist,compiledstatuslist)
		ds_list_read(global.currentstatuslist,compiledcurrentstatuslist)
		ds_list_read(global.textboxlist,compiledtextboxlist)
		ds_list_read(global.timelist,compiledtimelist)
		ds_list_read(global.checkmarklist,compiledcheckmarklist)
		
		with o_controller
		{
			scr_controller_populateboard()
		}
		
		//with o_connection_light{
		//	connected = true
		//	sprite_index = s_connection_connected
		//}	
		
	break;
	case 1:
	//Change Status
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
	case 2:
	//Active Connection
		
	break;
	case 3:
	//Textbox
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
	case 4:
	//Message
		var _message
		_message = buffer_read(read_buffer,buffer_string)
		
		show_message(_message)
		
	break;
	case 5:
	//Dice Roll
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
	case 6:
	//Checkmarks
	//var _selected = buffer_read(read_buffer,buffer_u32)
	//var _ID = buffer_read(read_buffer,buffer_u32)
	
	//with o_checkbox
	//{
	//	if ID = _ID
	//	{
	//		selected = _selected	
	//	}
	//}
	
	break;
	case 7:
	//Update Active Client Count
		//global.activeclients = buffer_read(read_buffer,buffer_u32)
	
	break;
}