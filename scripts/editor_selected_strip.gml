if (show_question("This will remove all Name and Cutscene data from the checked entities. Are you sure about that?")){
    with (Entity){
        if (object_index==Entity){
            if (checked){
                name="";
                cutscene_index=get_cutscene_from_name("No", 0);
                checked=false;
            }
        }
    }
}
