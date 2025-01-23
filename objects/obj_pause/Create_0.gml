pause = 0
var i = 0
color = make_color_rgb(121, 103, 151)
selected = 0
image_speed = 0
shroomdone = 0
cheesedone = 0
tomatodone = 0
sausagedone = 0
pineappledone = 0
depth = -998
draw_screen = 0
peppino_sprite = spr_player_idle
peppino_sprite_number = sprite_get_number(peppino_sprite)
peppino_index = 0
toppin_sprite[0] = spr_pizzakincheese
toppin_sprite[1] = spr_pizzakinpineapple
toppin_sprite[2] = spr_pizzakinsausage
toppin_sprite[3] = spr_pizzakinshroom
toppin_sprite[4] = spr_pizzakintomato
for (i = 0; i < array_length(toppin_sprite); i++)
{
    toppin_number[i] = sprite_get_number(toppin_sprite[i])
    toppin_index[i] = 0
    toppin_has[i] = false
}
