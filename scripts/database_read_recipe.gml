#define database_read_recipe
/// database_read_recipe(ModPackage, map);

database_read_generic(argument0, argument1, 'recipe',
    database_get_recipe, database_set_recipe,
    database_read_recipe_thanks, get_cooking_recipe_from_name, database_set_required_recipe);

#define database_read_recipe_thanks
with (instantiate(CookingRecipe)){
    internal_name=argument1[? argument0+"internal_name"];
    name=argument1[? argument0+"name"];
    flag=argument1[? argument0+"flag"];
    summary=argument1[? argument0+"summary"];
    
    package[1]=argument1[? argument0+"package1"];
    package[0]=argument1[? argument0+"package0"];
    input[1]=argument1[? argument0+"input1"];
    input[0]=argument1[? argument0+"input0"];
    output_package=argument1[? argument0+"output_package"];
    output=argument1[? argument0+"output"];
    
    return id;
}