if (!validate_boolean(argument0)){
    return false;
}

if (string_digits(argument0)==argument0){
    return real(argument0);
}

if (string_lower(argument0)=="true"){
    return true;
}

return false;
