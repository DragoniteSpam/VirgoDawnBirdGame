/// int GCF(a, b);
// automatically rounds to int (recursive)

if (argument0==0)
    return argument1;
return GCF(argument1%argument0, argument0);
