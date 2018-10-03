//Draw Self
draw_self()
//draw_text(x+10,y+10,string(nameid))

//Draw Color
draw_set_color(c_gray)
draw_rectangle(x+1,y+1,x+126,y+46,false)
draw_set_color(c_black)

//Draw Name
draw_set_font(font)
draw_text_transformed(x+10,y+10,string(username),1,1,0)
draw_set_font(-1)
