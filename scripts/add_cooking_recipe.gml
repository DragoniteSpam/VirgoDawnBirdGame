/// BestiaryPage add_cooking_recipe(internal name, name, outputpackage, outputitem, package0, input0, package1, input1);

with (instantiate(CookingRecipe)){
    internal_name=argument0;
    name=argument1;
    output_package=argument2;
    output=argument3;
    package[0]=argument4;
    input[0]=argument5;
    package[1]=argument6;
    input[1]=argument7;
    return id;
}
