if o_controller.drawarrow = 2
{
	if sprite_index == s_arrow_3{
		sprite_index = s_explosion
		image_speed = 1
	}
	else if sprite_index != s_explosion {
		var a = irandom_range(0,255)
		var b = irandom_range(100,255)
		var d = irandom_range(100,255)
		image_blend = make_color_hsv(a,b,d)
		image_alpha -= .01
		if (image_alpha = 0) or (sprite_index == s_explosion and image_index > image_number - 2)
		{
			if instance_number(o_arrow) > 0
			{
				with o_arrow
				{
					instance_destroy()	
				}
			}
		}
	}
	if (sprite_index == s_explosion and image_index > image_number - 1){
		instance_destroy()	
	}
}



