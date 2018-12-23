/// int get_struct_from_name(array, name, default, [use internal name]);
// This can work for any object that has a "name" variable.

var array=argument[0];
if (argument[1]==""){
    return argument[2];
}
if (string_digits(argument[1])==argument[1]){
    if (real(argument[1])<array_length_1d(array)){
        return real(argument[1]);
    }
}

var use_internal_name=false;
switch (argument_count){
    case 4:
        use_internal_name=argument[3];
        break;
}

var name=string_minimal(argument[1]);

for (var i=0; i<array_length_1d(array); i++){
    if (array[i]>0){
        if (use_internal_name){
            if (string_minimal(array[i].internal_name)==name){
                return i;
            }
        } else {
            if (string_minimal(array[i].name)==name){
                return i;
            }
        }
    }
}

return argument[2];
