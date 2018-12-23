#define printq
/// void printq(queue);

var q=ds_queue_create();
ds_queue_copy(q, argument0);
var str="";
while (!ds_queue_empty(q))
    str=str+deq(q)+", ";
print(str);

#define printqr
/// void printqr(queue);

var q=ds_queue_create();
ds_queue_copy(q, argument0);
var str="";
while (!ds_queue_empty(q))
    str=str+string(rdeq(q))+", ";
print(str);