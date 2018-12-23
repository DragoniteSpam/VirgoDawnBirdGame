/// SoundEffect add_se(name, effect, summary);

with (instantiate(SoundEffect)){
    name=argument[0];
    audio=argument[1];
    summary=argument[2];
    
    return id;
}
