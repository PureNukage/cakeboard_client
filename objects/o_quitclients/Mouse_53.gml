//if mouseover{
//	with o_client{
//		var buffer = buffer_create(1024,buffer_fixed,1)
//		buffer_seek(buffer,buffer_seek_start,0)
//		buffer_write(buffer,buffer_u8,66)
//		network_send_packet(socket,buffer,buffer_tell(buffer))
//	}
//}