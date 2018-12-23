/// ds_list_create_with(a, b, c, .. n);

var l=ds_list_create();
for (var i=0; i<argument_count; i++){
    ds_list_add(l, argument[i]);
}
return l;
