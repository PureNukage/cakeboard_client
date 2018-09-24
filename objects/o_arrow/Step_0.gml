if o_controller.drawarrow = 2
{
	var a = irandom_range(0,255)
	var b = irandom_range(100,255)
	var c = irandom_range(100,255)
	image_blend = make_color_hsv(a,b,c)
	image_alpha -= .01
	if image_alpha = 0
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