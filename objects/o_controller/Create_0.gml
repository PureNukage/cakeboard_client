#region Var Init
mouseclick = 0
d = 0
b = 3
_x = 0
_y = 0
drawarrow = 0
diceroll = -1
diceorder = ds_list_create()
global.debug = false
roomprevious = board_0

#endregion

#region Macros
#macro mouseover instance_position(mouse_x,mouse_y,id)
#macro menuclick instance_position(mouse_x,mouse_y,o_status_menu)
#macro f1 keyboard_check_pressed(vk_f1)
#macro f2 keyboard_check_pressed(vk_f2)
#macro control keyboard_check_pressed(vk_control)
#macro c keyboard_check_pressed(ord("C"))
#macro v keyboard_check_pressed(ord("V"))

#macro debug_on global.debug = true
#macro debug_off global.debug = false

#macro statusfill draw_rectangle(x+1,y+1,x+126,y+46,false)
#macro statustext draw_text(x+5,y+10,statusstatus)

#macro statusmenufill draw_rectangle(x+1,y+1,x+85,y+39,false)
#macro statusmenutext draw_text(x+8,y+8,statusmenustatus)

#endregion

#region Menu
//Menu Var Init
fileopen = false

adminopen = false


color_menu_highlighted = make_color_rgb(150,150,150)
#macro menu_barY 24
#macro gui_x device_mouse_x_to_gui(0)
#macro gui_y device_mouse_y_to_gui(0)
menu_1_text = "Tools"

#macro mouseover_menu_file point_in_rectangle(gui_x,gui_y,0,0,48,menu_barY)
#macro mouseover_menu_tools point_in_rectangle(gui_x,gui_y,52,0,108,menu_barY)
#macro mouseover_menu_admin point_in_rectangle(gui_x,gui_y,112,0,168,menu_barY)
#macro mouseover_menu_manageuser point_in_rectangle(gui_x,gui_y,112,menu_barY,224,menu_barY*2)

#endregion


#region Colors
in = make_color_rgb(255,226,225);
out = make_color_rgb(255,175,190);
meeting = make_color_rgb(190,190,190);
quickbreak = make_color_rgb(128,240,152);
__break = make_color_rgb(255,0,143);
lunch = make_color_rgb(178,17,55);

#macro black draw_set_color(c_black)
#macro _in draw_set_color(o_controller.in)
#macro _out draw_set_color(o_controller.out)
#macro _meeting draw_set_color(o_controller.meeting)
#macro _quickbreak draw_set_color(o_controller.quickbreak)
#macro _break draw_set_color(o_controller.__break)
#macro _lunch draw_set_color(o_controller.lunch)

#endregion


