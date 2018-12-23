/// boolean qv_mq01_08(Entity, param);

var entity=argument0;
var param=argument1;

// Invalid param
if (abs(param)>0){
    return false;
}

return scr_GetMQ01_800_Bowls(null);
