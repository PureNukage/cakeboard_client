/// @func scr_timer_break
/// @desc
/// @param break/lunch 
/// @param statusID

var whichbreak = argument[0]
var whichstatus = argument[1]

if instance_number(o_timer) > 0{
	with o_timer{
		instance_destroy()	
	}
}	

with o_status{
	if statusid = whichstatus{
		
		var _timer = instance_create_layer(x+36,y+54,"Instances",o_timer)
		
		if whichbreak = "break"{
			_timer.time = 15	
		}
		if whichbreak = "lunch"{
			_timer.time = 30	
		}
	}	
}

