/// int d3d_model_triangles(file);

var file=file_text_open_read(argument0);
file_text_readln(file);
var n=(file_text_read_real(file)-2) div 3;
file_text_close(file);

return n;
