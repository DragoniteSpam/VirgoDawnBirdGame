/// boolean array_contains(array, value);

var array=argument0;

for (var i=0; i<array_length_1d(array); i++){
    if (array[i]==argument1){
        return true;
    }
}

return false;
