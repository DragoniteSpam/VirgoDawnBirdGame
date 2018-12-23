if (show_question("Select all hidden Entities. Continue? (This will not deselect any unhidden entities!)")){
    with (Entity){
        if (hidden){
            checked=true;
        }
    }
}
