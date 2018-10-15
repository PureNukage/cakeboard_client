draw_self()
draw_set_alpha(imagealpha)

if toggle = 0{
	draw_set_color(color_off)	
}
else draw_set_color(color_on)

draw_rectangle(x+1,y+1,x+sprite_width-2,y+sprite_height-2,false)

draw_set_color(c_black)
draw_set_font(Font)
if toggle = 0{
	draw_text(x+(sprite_width/3),y+(sprite_height/3),text_off)
}
else draw_text(x+(sprite_width/3),y+(sprite_height/3),text_on)

if debug_on
{
	draw_text(x+30,y+30,"ID: " + string(ID))
}	

draw_set_font(-1)
draw_set_alpha(1)

