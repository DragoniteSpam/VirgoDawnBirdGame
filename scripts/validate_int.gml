/// boolean validate_int(string);
if (string_length(argument0)==0)
    return true;

return regex("((\+)|(\-))?(\d)+", argument0);
