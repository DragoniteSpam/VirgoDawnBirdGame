/// int te_gradient(value, value low, value high, value buffer, target, target low, target high);

var value=argument0;
var low=argument1;
var high=argument2;
var buffer=argument3;
var t=argument4;
var tlow=argument5;
var thigh=argument6;

if (value<low+buffer){
    if (random(100)<lerp(0, 100, (value-low)/buffer))
        return tlow;
} else if (value>high-buffer){
    if (random(100)<lerp(0, 100, (high-value)/buffer))
        return thigh;
}

return t;
