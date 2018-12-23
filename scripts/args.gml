/// Arguments args(object, script, arg0, arg1..argn);
// for creating scripting things, mainly, but I guess you can
// also use this to index other things too
var a=instantiate(Arguments);

a.object=argument[0];
a.script=argument[1];
ds_list_clear(a.a);

for (var i=2; i<argument_count; i++){
    ds_list_add(a.a, argument[i]);
}

return a;
