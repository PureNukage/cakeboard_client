#region Var Init
mouseclick = 0
d = 0
b = 3
_x = 0
_y = 0
drawarrow = 0
diceroll = -1
diceorder = ds_list_create()
o_controller.debug = false
roomprevious = board_0
freshboard = false
profile = 0
admin = 0
theme = 0

#endregion

#region Themes

database_themes[5,5] = 0
database_themes[0,asset_get_index("o_nameplate")] = s_nameplate_0
database_themes[0,asset_get_index("o_arrow")] = s_arrow_0
database_themes[0,asset_get_index("o_textbox")] = s_textbox_0
database_themes[0,asset_get_index("o_dice")] = s_dice_0
database_themes[0,asset_get_index("o_header")] = s_tile_cakeboard

#endregion

#region Macros
#macro mouseover instance_position(mouse_x,mouse_y,id)
#macro menuclick instance_position(mouse_x,mouse_y,o_status_menu)
#macro f1 keyboard_check_pressed(vk_f1)
#macro f2 keyboard_check_pressed(vk_f2)
#macro control keyboard_check_pressed(vk_control)
#macro c keyboard_check_pressed(ord("C"))
#macro v keyboard_check_pressed(ord("V"))

#macro debug_on o_controller.debug = true
#macro debug_off o_controller.debug = false

#macro statusfill draw_rectangle(x+1,y+1,x+126,y+46,false)
#macro statustext draw_text(x+5,y+10,statusstatus)

#macro statusmenufill draw_rectangle(x+1,y+1,x+85,y+39,false)
#macro statusmenutext draw_text(x+8,y+8,statusmenustatus)

#macro theme_select o_controller.database_themes[o_controller.theme,object_index]

#endregion

#region Menu
//Menu Var Init
fileopen = false			//These control if the menus are open or not
toolsopen = false
adminopen = false

color_menu_highlighted = make_color_rgb(150,150,150)	//Color of the bar if its moused over
menu_barY_0 = 0
menu_barY_1 = 24							    //	Variables for the X and Y values of the 
menu_barX_0 = 0									//	menu options. 
menu_barX_1 = 52								//	Y is the verticality of the menu,
menu_barX_2 = 112								//	Multiply by 2 each row down.
menu_barX_3 = 172								//  X is the horizonalness of the menu
#macro gui_x device_mouse_x_to_gui(0)			//	
#macro gui_y device_mouse_y_to_gui(0)			//	Mouse X and Y values on the gui layer
draw_set_font(-1)								//
menu_1_text = "File"							//	
menu_2_text = "Tools"							//	Text on the menu options
menu_2_1_text = "Themes"						//	Naming convention is an array
menu_3_text = "Admin"							//	x = header options
menu_3_1_text = "Manage Users"					//	y = extended options

#macro mouseover_menu_file point_in_rectangle(gui_x,gui_y,menu_barX_0,menu_barY_0,menu_barX_1,menu_barY_1)				
#macro mouseover_menu_tools point_in_rectangle(gui_x,gui_y,menu_barX_1,menu_barY_0,menu_barX_2,menu_barY_1)
#macro mouseover_menu_admin point_in_rectangle(gui_x,gui_y,menu_barX_2,menu_barY_0,menu_barX_3,menu_barY_1)
#macro mouseover_menu_manageuser point_in_rectangle(gui_x,gui_y,menu_barX_2,menu_barY_1,menu_barX_3,menu_barY_1*2)
#macro mouseover_menu_themes point_in_rectangle(gui_x,gui_y,menu_barX_1,menu_barY_1,menu_barX_2,menu_barY_1*2)

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

