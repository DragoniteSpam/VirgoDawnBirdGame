/// array array_add(size, [default value]);

// this script was created before array_create was so i might as well leave it
// in the game's code
// especially considering that array_create(n, default) doesn't actually work
// and i can magically make it work

var array=array_create(argument[0]);

if (argument_count==2){
    for (var i=0; i<argument[0]; i++){
        array[i]=argument[1];
    }
}

return array;
