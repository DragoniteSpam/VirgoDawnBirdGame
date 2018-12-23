/// array array_remove(array, index);

var len=array_length_1d(argument0);

if (len==0){
    return argument0;
} else if (len==1){
    return array_create(0);
}

var array;
array[len-2]=noone;

for (var i=0; i<argument1; i++){
    array[i]=argument0[i];
}

for (var i=argument1+1; i<len; i++){
    array[i-1]=argument0[i];
}

return array;
