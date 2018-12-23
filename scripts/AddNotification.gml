/// Notification AddNotification(text);

with (instantiate(Notification)){
    text=scr_escape_sequence(argument0);
    return id;
}
