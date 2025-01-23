if (pause == 1)
{
	draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false)
	font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
	draw_set_font(font)
	draw_set_halign(fa_center)
	draw_set_color(c_white)
	shader_set(global.Pal_Shader)
    pal_swap_set(spr_palette, paletteselect, false)
    draw_sprite(peppino_sprite, peppino_index, 256, 242)
    shader_reset()
	if (selected == 0)
		draw_text_color(589, 200, "CONTINUE", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_color(589, 200, "CONTINUE", c_white, c_white, c_white, c_white, 0.5)
	if (selected == 1)
		draw_text_color(589, 250, "RETRY THE LEVEL", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_color(589, 250, "RETRY THE LEVEL", c_white, c_white, c_white, c_white, 0.5)
	if (selected == 2)
		draw_text_color(589, 300, "EXIT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_color(589, 300, "EXIT", c_white, c_white, c_white, c_white, 0.5)
	if (global.timeattack == 0)
	{
		for (i = 0; i < array_length(toppin_sprite); i++)
			draw_sprite_ext(toppin_sprite[i], toppin_index[i], (172 + 40 * i), 404, 1, 1, 0, c_white, (toppin_has[i] ? 1 : 0.5))
	}
}
