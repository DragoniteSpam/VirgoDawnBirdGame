/// int get_text_speed([Entity]);

if (argument_count==0){
    return World.text_speed_values[text_speed];
}

return get_text_speed()*argument[0].text_speed_modifier;
