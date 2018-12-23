/// array d3d_model_file_array(file);

var f=file_text_open_read(argument0);

file_text_readln(f);
var line=split(file_text_read_string(f), " ");
file_text_readln(f);
var array=array_add_2d((rdeq(line)-2)/3, ModelData.alpha, 0);
ds_queue_destroy(line);

var index=0;
while (!file_text_eof(f)){
    var line=split(file_text_read_string(f), " ");
    file_text_readln(f);
    if (rdeq(line)==9){
        array[index, ModelData.xx]=rdeq(line);
        array[index, ModelData.yy]=rdeq(line);
        array[index, ModelData.zz]=rdeq(line);
        array[index, ModelData.nx]=rdeq(line);
        array[index, ModelData.ny]=rdeq(line);
        array[index, ModelData.nz]=rdeq(line);
        array[index, ModelData.xtex]=rdeq(line);
        array[index, ModelData.ytex]=rdeq(line);
        array[index, ModelData.color]=rdeq(line);
        array[index, ModelData.alpha]=rdeq(line);
        index++;
    }
    ds_queue_destroy(line);
}

return array;
