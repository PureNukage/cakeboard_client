//Zooming Up and Down
zoom_level = clamp((zoom_level + (mouse_wheel_down()-mouse_wheel_up())*0.1),0.1,1.5)

camera_set_view_pos(o_controller.camera,
        clamp( camera_get_view_x(o_controller.camera), 0, room_width - camera_get_view_width(o_controller.camera) ),
        clamp( camera_get_view_y(o_controller.camera), 0, room_height - camera_get_view_height(o_controller.camera) ));

var view_w = camera_get_view_width(view_camera[0])
var view_h = camera_get_view_height(view_camera[0])

var rate = 0.2

var new_w = lerp(view_w, zoom_level *  default_zoom_width, rate)
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate)

camera_set_view_size(view_camera[0], new_w, new_h)

//ReAlignment
var shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5
var shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5

camera_set_view_pos(view_camera[0],shift_x, shift_y)
