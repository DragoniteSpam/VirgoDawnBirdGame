/// boolean validate_double(string);

if (string_lower(argument0)=="true"){
    return true;
}

if (string_lower(argument0)=="false"){
    return true;
}

if (string_length(argument0)==0||string_length(argument0)>15)
    return false;

return regex("((\+)|(\-))?((\d)*)((\.)(\d)+)?", argument0);

// ((\+)|(\-))?
//      optional + or -
// ((\d)*)
//      0 or more digits
// ((\.)(\d)+)?
//      optional decimal point followed by 1 or more digits
