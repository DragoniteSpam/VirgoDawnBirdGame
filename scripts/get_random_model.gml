var result=Models.none;
while (all_models[result]==all_models[Models.none]||all_models[result].save_script==model_write_header){
    result=irandom(array_length_1d(all_models)-1);
}

return result;
