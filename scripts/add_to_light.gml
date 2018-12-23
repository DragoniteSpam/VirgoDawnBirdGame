if (render_distance_lights>5){
    if (point_distance(x, y, Camera.x, Camera.y)<RD_NEAR*render_distance_lights/8){
        ds_list_add(World.list_lights, id);
    }
}
