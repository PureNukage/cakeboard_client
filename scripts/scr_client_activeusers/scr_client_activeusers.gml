var active_buffer = buffer_create(1024,buffer_fixed,1)

buffer_seek(active_buffer,buffer_seek_start,0)
buffer_write(active_buffer,buffer_u8,7)
network_send_packet(socket,active_buffer,buffer_tell(active_buffer))