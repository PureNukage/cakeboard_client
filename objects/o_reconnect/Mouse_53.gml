if mouseover{
	instance_destroy(o_client)
	instance_create_layer(5,5,"Instances",o_client)
	with o_client{	
		persistent = true
		ipaddress = o_ipaddress.text
		port = o_port.text
		scr_client_network_init(ipaddress,port)
		scr_client_totalusers()
		}
}