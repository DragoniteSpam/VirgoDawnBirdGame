var minimum=argument[0];
var maximum=minimum;
for (var i=1; i<argument_count; i++){
    minimum=min(minimum, argument[i]);
    maximum=max(maximum, argument[i]);
}

return maximum-minimum;
