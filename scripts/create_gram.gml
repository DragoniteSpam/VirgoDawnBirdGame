var gramme_limit=56;

if (instance_number(Gram)>gramme_limit){
    return noone;
}

var gram_origin=32768*2;
var gram_spread=65536*2;
var xx=Camera.x+gram_spread*dcos(weather.direction+180)+random_range(-gram_origin, gram_origin);
var yy=Camera.y-gram_spread*dsin(weather.direction+180)+random_range(-gram_origin, gram_origin);

with (instance_create(xx, yy, Gram)){
    z=random_range(gram_origin*0.1, gram_origin*0.125);
//    xrot=random(360);
//    yrot=random(360);
    direction=random(360);
    scale=random_range(120, 136);
    model=random_element_from_list(World.all_clouds);
    return id;
}
