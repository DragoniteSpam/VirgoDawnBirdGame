if (string_lower(argument0)=="true"||string(argument0)=="1"){
    return true;
}

if (string_lower(argument0)=="false"||string(argument0)=="0"){
    return false;
}

eval_boolean_error("Not a boolean value! "+string(argument0));
return false;
