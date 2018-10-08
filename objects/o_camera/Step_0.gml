var edgeX = camera_get_view_width(view_camera[0])/2
var edgeY = camera_get_view_height(view_camera[0])/2
y = clamp(y,0,room_height-edgeY)
if (mouse_wheel_down() )//or (control and mouse_wheel_down() or mouse_wheel_up() ) )
{
	y += 50
}
if mouse_wheel_up()
{
	y -= 50	
}
y = clamp(y,0,room_height-edgeY)
camera_set_view_pos(view_camera[0],x,y)

//Camera
//if control and (mouse_wheel_down() or mouse_wheel_up()){
	///scr_controller_camera_controls()
//}