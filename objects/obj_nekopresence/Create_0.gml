var app_id = "1329953982629810189"
ready = 0
if (!(np_initdiscord(app_id, 1, 0)))
{
    show_message("Failed to initiate Discord presence. Ensure NekoPresence_x64.dll is installed.")
    instance_destroy()
}
largeimage = ""
moretexta = ""
moretextb = ""
state = ""
details = ""
smallimage = ""