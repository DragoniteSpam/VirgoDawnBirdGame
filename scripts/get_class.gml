/// Class get_class([Entity]);

if (argument_count==0){
    var obj=id;
} else {
    var obj=argument[0];
}

return all_classes[obj.class];
