newtime = date_get_minute(date_current_datetime())

if newtime = oldtime{
	oldtime = newtime	
}
else{
	time = time - 1
	oldtime = newtime
}	

if time = 0{
	instance_destroy()
}	