/// int array_search(array, target, default, [min, max]);

var a=argument[0];

if (argument_count==3){
    var start=0;
    var finish=array_length_1d(a)-1;
} else {
    var start=argument[3];
    var finish=argument[4];
}

for (var i=start; i<finish; i++){
    if (a[i]==argument[1]){
        return i;
    }
}

return argument[2];
