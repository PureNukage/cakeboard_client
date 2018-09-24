if mouseover and keyboard_check(vk_control)
{
		selected = !selected
		var buffer
		buffer = buffer_create(1024,buffer_fixed,1)
		buffer_write(buffer,buffer_u8,6)
		buffer_write(buffer,buffer_u32,selected)
		buffer_write(buffer,buffer_u32,ID)
		network_send_packet(o_client.socket,buffer,buffer_tell(buffer))
}