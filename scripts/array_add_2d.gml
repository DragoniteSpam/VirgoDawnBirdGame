/// array array_add_2d(i, j, [default value]);

var array;
if (argument_count==3){
    var def=argument[2];
} else {
    var def=noone;
}
for (var i=argument[0]; i>=0; i--){
    for (var j=argument[1]; j>=0; j--){
        array[i, j]=def;
    }
}

return array;
