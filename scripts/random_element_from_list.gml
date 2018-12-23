/// value random_element_from_list(list);

var list=argument0;

return list[| irandom_range(0, ds_list_size(list)-1)];
