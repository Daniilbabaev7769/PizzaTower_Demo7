var accel = 0.015
if (!fadeout)
{
    fade = Approach(fade, 0, accel)
    if (fade <= 0)
    {
        fadeout = true
        alarm[0] = 240
    }
}
else if changeroom
{
    fade = Approach(fade, 1, accel)
    if (fade >= 1)
        room_goto(Realtitlescreen)
}
