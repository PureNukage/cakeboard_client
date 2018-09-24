var _list = argument[0]
var _listcompiled = ds_list_write(_list)

var buffer, i 

buffer = buffer_create(1024,buffer_fixed,1)

buffer_seek(buffer,buffer_seek_start,0)
buffer_write(buffer,buffer_u8,5)
buffer_write(buffer,buffer_string,_listcompiled)
network_send_packet(socket,buffer,buffer_tell(buffer))

