
buffer_refresh = buffer_create(1024,buffer_fixed,1)

buffer_seek(buffer_refresh,buffer_seek_start,0)
buffer_write(buffer_refresh,buffer_u8,2)
network_send_packet(socket,buffer_refresh,buffer_tell(buffer_refresh))