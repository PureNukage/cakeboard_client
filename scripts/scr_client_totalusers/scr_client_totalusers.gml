buffer_controller_totalusers = buffer_create(1024,buffer_fixed,1)

buffer_seek(buffer_controller_totalusers,buffer_seek_start,0)
buffer_write(buffer_controller_totalusers,buffer_u8,0)
buffer_write(buffer_controller_totalusers,buffer_u32,0) //Total Users
network_send_packet(socket,buffer_controller_totalusers,buffer_tell(buffer_controller_totalusers))



