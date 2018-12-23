/// int array_search(array, target, default, [min, max]);
// Only works for arrays of items.
// Returns the index of the entry whose item power matches the target value.

var a=argument[0];

if (argument_count==3){
    var start=0;
    var finish=array_length_1d(a);
} else {
    var start=argument[3];
    var finish=argument[4];
}

if (start==0&&finish==0){
    return argument[2];
}

for (var i=start; i<finish; i++){
    if (a[i]!=noone&&a[i].item_power=argument[1]){
        return i;
    }
}

return argument[2];
