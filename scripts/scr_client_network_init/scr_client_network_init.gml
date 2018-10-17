var _ip = argument[0]
var _port = argument[1]

network_set_config(network_config_connect_timeout, 1000)
network_set_config(network_config_use_non_blocking_socket, 0)
network_type = network_socket_tcp


socket = network_create_socket(network_type)
connected = network_connect(socket,_ip,_port)



