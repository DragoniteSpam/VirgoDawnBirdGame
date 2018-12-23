/// String string_format_zero(n, [minimum digits]);

var s=string(argument[0]);
if (argument_count==1){
    var n=2;
} else {
    var n=argument[1];
}
while (string_length(s)<n){
    s='0'+s;
}
return s;
