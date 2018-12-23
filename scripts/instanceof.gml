/// boolean instanceof([object], type);

if (argument_count==1){
    return (object_index==argument[0])||object_is_ancestor(object_index, argument[0]);
}

with (argument[0]){
    return instanceof(argument[1]);
}
