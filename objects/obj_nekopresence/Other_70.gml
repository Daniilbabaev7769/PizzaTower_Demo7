var ev_type = ds_map_find_value(async_load, "event_type")
if ((ev_type == "DiscordReady"))
{
    ready = 1
    np_setpresence_timestamps(date_current_datetime(), 0, 0)
    np_setpresence_more("moretext1", "moretext2", 0)
    np_setpresence(state, details, largeimage, smallimage)
    alarm[0] = 1
}