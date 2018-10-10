cakeboard_client


How to add a new theme:

Inside of o_controller Create -> Section Themes, we are going to add our theme to the Array database

database_themes[x, y]
x = themes
y = object that we want affected by themes functionality

current themes:
0 = default
1 = 

current objects affected by themes:
o_nameplate
o_arrow
o_textbox
o_dice
o_header

Maybe copy paste the current section of Themes. Replace the X value with your theme value
Replace the sprite with your own sprites once uploaded. Please use the following naming convention:

ex o_nameplate_[theme number]






How to make a new object get affected by themes:

Inside of o_controller Create -> Section themes - 

We have to add the object to ALL themes even if the sprite will not change. At the very least make it return
to the default sprite

Inside of the object we wanted affected, add the following in the Create event:

sprite_index=theme_select

THEME SPRITE RESOLUTIONS
s_tile_cakeboard (header) 580x120
s_nameplate_0 128x48
s_status 128x48
s_textbox 257x48
s_arrow_0 64x48
