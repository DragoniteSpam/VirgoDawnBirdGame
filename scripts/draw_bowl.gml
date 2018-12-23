/// void Entity.draw_bowl([texture]);

if (state=Misc.empty){
    if (size==Misc.small){
        model=Models.gen_bowl_empty_s;
    } else if (size==Misc.large){
        model=Models.gen_bowl_empty_l;
    }
} else if (state==Misc.feed){
    if (size==Misc.small){
        model=Models.gen_bowl_feed_s;
    } else if (size==Misc.large){
        model=Models.gen_bowl_feed_l;
    }
} else if (state==Misc.water){
    if (size==Misc.small){
        model=Models.gen_bowl_water_s;
    } else if (size==Misc.large){
        model=Models.gen_bowl_water_l;
    }
}

if (argument_count>0){
    draw_model(argument[0]);
} else {
    draw_model(tex_default);
}
