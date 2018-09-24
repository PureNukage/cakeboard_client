view_enabled = true
view_set_visible(0,true)

view_set_wport(0,1024)
view_set_hport(0,768)

global.camera = camera_create_view(0,0,1024,800,0,o_camera,-1,-1,1024,800)

view_set_camera(0,global.camera)