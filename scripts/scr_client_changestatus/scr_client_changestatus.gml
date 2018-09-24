/// @function scr_client_changestatus(statusid, status)
/// @description
/// @param statusid The ID of the status from the status menu
/// @param status The ID of the status

var _statusid, _status

_statusid = argument[0]
_status = argument[1]

bufferchangestatus = buffer_create(1024,buffer_fixed,1)

buffer_seek(bufferchangestatus,buffer_seek_start,0)
buffer_write(bufferchangestatus,buffer_u8,1)
buffer_write(bufferchangestatus,buffer_u32,_statusid)
buffer_write(bufferchangestatus,buffer_u32,_status)
network_send_packet(socket,bufferchangestatus,buffer_tell(bufferchangestatus))
