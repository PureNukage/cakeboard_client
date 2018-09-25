var active_buffer = buffer_create(1024,buffer_fixed,1)

var add_or_subtract = argument[0]

buffer_seek(active_buffer,buffer_seek_start,0)
buffer_write(active_buffer,buffer_u8,7)
buffer_write(active_buffer,buffer_string,add_or_subtract)
network_send_packet(socket,active_buffer,buffer_tell(active_buffer))