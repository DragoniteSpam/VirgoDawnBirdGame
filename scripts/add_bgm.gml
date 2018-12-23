/// BackgroundMusic add_bgm(internal name, name, internal song, song, author, summary);

with (instantiate(BackgroundMusic)){
    internal_name=argument[0];
    name=argument[1];
    internal_song=argument[2];
    song=argument[3];
    author=argument[4];
    summary=argument[5];
    
    return id;
}
