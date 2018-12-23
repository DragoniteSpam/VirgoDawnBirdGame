enum TextSpeeds {
    fast,
    faster,
    fastest,
    lightning,
}

text_speed_names[TextSpeeds.fast]=get_text(Text.tsFast);
text_speed_names[TextSpeeds.faster]=get_text(Text.tsFaster);
text_speed_names[TextSpeeds.fastest]=get_text(Text.tsFastest);
text_speed_names[TextSpeeds.lightning]=get_text(Text.tsLightning);

text_speed_values[TextSpeeds.fast]=2;
text_speed_values[TextSpeeds.faster]=4;
text_speed_values[TextSpeeds.fastest]=8;
text_speed_values[TextSpeeds.lightning]=16;
