/// @func scr_client_manageusers_addremove
/// @desc
/// @param ID

var _ID, _name, _windowsname, _admin

_ID = argument[0]

with o_manageuser_firstname{
	if ID = _ID{
		_name = text	
	}
}
with o_manageuser_windowsname{
	if ID = _ID{
		_windowsname = text	
	}
}
with o_manageuser_admin{
	if ID = _ID{
		_admin = toggle	
	}
}

var buffer = buffer_create(1024,buffer_fixed,1)
buffer_seek(buffer,buffer_seek_start,0)
buffer_write(buffer,buffer_u8,9)
buffer_write(buffer,buffer_u32,_ID)
buffer_write(buffer,buffer_string,_name)
buffer_write(buffer,buffer_string,_windowsname)
buffer_write(buffer,buffer_u32,_admin)

with o_client
{
	network_send_packet(socket,buffer,buffer_tell(buffer))
}