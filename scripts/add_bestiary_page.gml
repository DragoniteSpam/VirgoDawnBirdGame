/// BestiaryPage add_bestiary_page(name, height [mm], weight [mg], description, endangered?, cry, picture);

with (instantiate(BestiaryPage)){
    name=argument0;
    height=argument1;
    weight=argument2;
    summary=argument3;
    status=argument4;
    cry=argument5;
    picture=argument6;
    return id;
}
