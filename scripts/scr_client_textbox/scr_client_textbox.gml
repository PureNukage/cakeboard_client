text = argument[0]
textboxid = argument[1]

textboxbuffer = buffer_create(1024,buffer_fixed,1)

buffer_seek(textboxbuffer,buffer_seek_start,0)
buffer_write(textboxbuffer,buffer_u8,3)
buffer_write(textboxbuffer,buffer_u32,textboxid)
buffer_write(textboxbuffer,buffer_string,text)
network_send_packet(socket,textboxbuffer,buffer_tell(textboxbuffer))