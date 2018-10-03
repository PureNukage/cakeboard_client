var _ID = argument[0]
var _object_index = argument[1]

var _object_name = object_get_name(_object_index)

show_debug_message("object name: " +string(_object_name))

var buffer = buffer_create(1024,buffer_fixed,1)
buffer_seek(buffer,buffer_seek_start,0)
buffer_write(buffer,buffer_u8,8)

switch(_object_name)
{
	case "o_manageuser_firstname":
		var _text = argument[2]
		buffer_write(buffer,buffer_u32,_ID)
		buffer_write(buffer,buffer_string,"names")
		buffer_write(buffer,buffer_string,_text)
		network_send_packet(socket,buffer,buffer_tell(buffer))
	break;
	case "o_manageuser_windowsname":
		var _text = argument[2]
		buffer_write(buffer,buffer_u32,_ID)
		buffer_write(buffer,buffer_string,"windowsnames")
		buffer_write(buffer,buffer_string,_text)
		network_send_packet(socket,buffer,buffer_tell(buffer))
	break;
	case "o_manageuser_admin":
		var _admin = argument[2]
		buffer_write(buffer,buffer_u32,_ID)
		buffer_write(buffer,buffer_string,"adminrights")
		buffer_write(buffer,buffer_u32,_admin)
		network_send_packet(socket,buffer,buffer_tell(buffer))
	break;
}