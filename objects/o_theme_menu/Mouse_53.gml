if mouseover
{
	if toggle = 0{
		toggle = 1
		o_controller.theme = ID
		with o_controller
		{
			scr_theme_change()
		}
		with o_theme_menu{ if ID != other.ID { toggle = 0 }}	
	}
}	