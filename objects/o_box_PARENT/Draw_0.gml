draw_self()
draw_set_alpha(imagealpha)

draw_set_color(color)
draw_rectangle(x+1,y+1,x+sprite_width-2,y+sprite_height-2,false)

draw_set_color(c_black)
draw_set_font(Font)
draw_text(x+(sprite_width/3),y+(sprite_height/3),text)
draw_set_font(-1)