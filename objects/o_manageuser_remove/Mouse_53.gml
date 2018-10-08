if mouseover
{
	scr_client_manageusers_addremove(ID)
	if text = "Add"{
		o_controller.roomheight += 80
		room_height += 80
	}
	else{ 
		o_controller.roomheight -= 80
		room_height -= 80
	}
}