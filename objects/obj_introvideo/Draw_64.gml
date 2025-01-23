draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if showText
    draw_text(230, 490, string_hash_to_newline("PRESS " + scr_keyname(global.key_slap) + " TO SKIP"))
