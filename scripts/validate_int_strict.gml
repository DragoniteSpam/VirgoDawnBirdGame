/// boolean validate_int_strict(string);

// I don't know if there's actually a use for this or not.

if (string_length(argument0)==0){
    return true;
}

return regex("(\d)+", argument0);
