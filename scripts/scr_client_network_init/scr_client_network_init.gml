network_set_config(network_config_connect_timeout, 1000)
network_set_config(network_config_use_non_blocking_socket, 0)
network_type = network_socket_tcp
//file = get_open_filename_ext(".txt","server.txt",program_directory,"Please select the server file")
//if file != ""
//{
//	file2 = file_text_open_read(file)	
//	ipaddress = file_text_read_string(file2)
//	file_text_close(file2)
//}
ipaddress =  "10.82.100.45" //"192.168.0.100"   "10.82.134.41"
port = 64198 //64198
socket = network_create_socket(network_type)
connected = network_connect(socket,ipaddress,port)

var size, type, alignment
size = 1024
type = buffer_wrap
alignment = 1
buffer = buffer_create(size,type,alignment)


