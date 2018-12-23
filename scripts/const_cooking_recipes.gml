enum CookingRecipes {
    bread,
    chicken,
    fish,
}

var arr=array_create(CookingRecipes.fish);

arr[CookingRecipes.bread]=add_cooking_recipe("Bread", "Bread", BASE_ASSET, Items.food_bread, BASE_ASSET, Items.cooking_yeast, BASE_ASSET, Items.cooking_flour);
arr[CookingRecipes.chicken]=add_cooking_recipe("Chicken", "Chicken", BASE_ASSET, Items.food_chicken, BASE_ASSET, Items.cooking_salt, BASE_ASSET, Items.cooking_raw_chicken);
arr[CookingRecipes.fish]=add_cooking_recipe("Fish", "Fish", BASE_ASSET, Items.food_fish, BASE_ASSET, Items.cooking_salt, BASE_ASSET, Items.cooking_raw_fish);

(ds_map_find_value(all_mod_packages, BASE_ASSET)).my_recipes=arr;
