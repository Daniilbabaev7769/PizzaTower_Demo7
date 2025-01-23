font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
draw_set_font(font)
draw_set_halign(fa_center)
draw_set_color(c_white)
if (room != strongcold_endscreen)
	draw_sprite_ext(tvsprite, -1, 832, 74, 1, 1, 1, c_white, alpha)
draw_text(xi, yi, string_hash_to_newline(string_hash_to_newline(message)))
var hud_xx = 852 + (irandom_range((-comboshake), comboshake))
var hud_yy = 75 + (irandom_range((-comboshake), comboshake))
if (comboshake > 0)
	comboshake--		
if (global.combo != 0 && global.combotime != 0 && (tvsprite == spr_tvdefault or tvsprite == spr_tvcombo))
	draw_text(hud_xx, hud_yy, string_hash_to_newline(string_hash_to_newline(global.combo)))
if (tvsprite == spr_tvdefault && room != strongcold_endscreen && global.miniboss == 0)
{
	chose = 0
	if (obj_player1.spotlight == 1)
		draw_text(832, 60, string_hash_to_newline(string_hash_to_newline(global.collect)))
	else
		draw_text(832, 60, string_hash_to_newline(string_hash_to_newline(global.collectN)))
}
else if (global.miniboss == 1)
	draw_text(832, 60, string_hash_to_newline(string_hash_to_newline(global.boxhp)))
if instance_exists(obj_pizzaballOLD)
	draw_text(832, 300, string_hash_to_newline(string_hash_to_newline(((string(global.golfhit) + " ") + "GOLF HIT"))))
var barxx = -26
var baryy = 30
draw_sprite(spr_barpop, 0, (832 + barxx), (250 + baryy))
var sw = sprite_get_width(spr_barpop)
var sh = sprite_get_height(spr_barpop)
var b = global.combotime / 55
draw_sprite_part(spr_barpop, 1, 0, 0, (sw * b), sh, (832 + barxx), (250 + baryy))
