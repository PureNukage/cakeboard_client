with o_client
{
	if o_controller.profile != -1{
		var buffer = buffer_create(1024,buffer_grow,1)
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,10)
		buffer_write(buffer,buffer_u32,o_controller.theme)
		buffer_write(buffer,buffer_s16,o_controller.profile)
		network_send_packet(socket,buffer,buffer_tell(buffer))
	}
}