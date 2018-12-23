/// boolean scr_if(value 1, condition, value 2);

switch (argument1){
    case Misc.equal:
        return (argument0==argument2);
    case Misc.less:
        return (argument0<argument2);
    case Misc.less_equal:
        return (argument0<=argument2);
    case Misc.greater:
        return (argument0>argument2);
    case Misc.greater_equal:
        return (argument0>=argument2);
    case Misc.not_equal:
        return !(argument0==argument2);
}

return false;
