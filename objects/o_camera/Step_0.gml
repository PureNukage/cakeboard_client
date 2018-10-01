var edgeX = camera_get_view_width(o_controller.camera)/2
var edgeY = camera_get_view_height(o_controller.camera)/2
y = clamp(y,0,room_height-edgeY)
if mouse_wheel_down()
{
	y += 50
}
if mouse_wheel_up()
{
	y -= 50	
}
y = clamp(y,0,room_height-edgeY)
camera_set_view_pos(o_controller.camera,x,y)