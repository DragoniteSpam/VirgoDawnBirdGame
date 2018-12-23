/// int array_max(array);

var array=argument0;
var greatest=0;

for (var i=0; i<array_length_1d(argument0); i++){
    if (array[@ i]>array[@ greatest]){
        greatest=i;
    }
}

return greatest;
