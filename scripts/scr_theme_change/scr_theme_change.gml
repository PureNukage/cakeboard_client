with o_nameplate { if instance_number(o_nameplate) > 0 { sprite_index=theme_select	}}
with o_controller { sprite_index=theme_select }
with o_header { if instance_number(o_header) > 0 {	sprite_index=theme_select	}}
with o_textbox { if instance_number(o_textbox) > 0 { sprite_index=theme_select	}}
with o_arrow	{ if instance_number(o_arrow) > 0 {	sprite_index=theme_select	}}
layer_background_sprite(background,sprite_index)

