//ideal_width=0
//ideal_height=247
//zoom=1
//max_zoom=1
//display_width=display_get_width()
//display_height=display_get_height()

//aspect_ratio=display_width/display_height





view_enabled = true

///application_surface_draw_enable(false)

window_w = window_get_width()
window_h = window_get_height()

//offset = (window_w

view_set_visible(0,true)

camera = camera_create_view(0,0,1024,800,0,-1,-1,-1,1024,800)

aspect_ration = 1024/800

zoom_level = 1
default_zoom_width = camera_get_view_width(view_camera[0])
default_zoom_height = camera_get_view_height(view_camera[0])

///grab the width and height of view
var cw = camera_get_view_width(view_camera);
var ch = camera_get_view_height(view_camera);
///set some variables to hold the value and div that by width and height
display_scalex = display_get_gui_width()/cw;
display_scaley = display_get_gui_height()/ch;


//view_wport[0] *= aspect_ratio
//view_hport[0] *= aspect_ratio

view_set_camera(0,camera)

camera_set_view_pos(camera,o_camera.x,o_camera.y)