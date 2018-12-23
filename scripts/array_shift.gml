/// void array_shift(array, n);

var array=argument0;

for (var i=-argument1; i<array_length_1d(argument0); i++){
    array[@ i-argument1]=array[i];
    array[@ i]=0;
}
