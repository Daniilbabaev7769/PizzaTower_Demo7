xscale = lerp(xscale, 1, 0.1)
yscale = lerp(yscale, 1, 0.1)
draw_sprite_ext(sprite_index, image_index, x, y, (xscale * image_xscale), (yscale * image_yscale), image_angle, image_blend, image_alpha)
if flash
{
	shader_set(shd_hit)
	draw_sprite_ext(sprite_index, image_index, x, y, (xscale * image_xscale), (yscale * image_yscale), image_angle, image_blend, image_alpha)
	shader_reset()
}

