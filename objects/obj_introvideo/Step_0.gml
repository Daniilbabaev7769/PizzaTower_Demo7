scr_getinput()
if ((!showText) && keyboard_check_pressed(global.key_slap))
{
    showText = true
    alarm[0] = 120
}
else if (showText && key_slap2)
{
    event_user(0)
    video_close()
    alarm[0] = -1
}
