/// value random_element_from_array(array);

var array=argument0;

if (!is_array(array)){
    return array;
}

return array[@ irandom_range(0, array_length_1d(array)-1)];
