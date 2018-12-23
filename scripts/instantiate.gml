/// Object instantiate(object, [name]);

var obj=instance_create(0, 0, argument[0]);

if (argument_count==2){
    obj.name=argument[1];
}

return obj;
