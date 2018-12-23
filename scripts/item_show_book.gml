/// void item_show_book(base item, [atob?]);

ValidateAllQuests(argument[0]);

var atob=false;
switch (argument_count){
    case 2:
        atob=argument[1];
        break;
}

with (instantiate(ItemBook)){
    index=ds_map_find_value(all_mod_packages, argument[0].mod_package).my_items[argument[0]].item_power;
    var f=file_text_open_read(".\books\"+string(index)+".txt");
    // Read the file into a single variable, line by line. If a line begins
    // with an @ then it's probably a variable of some sort.
    var contents="";
    while (!file_text_eof(f)){
        var line=file_text_read_string(f);
        file_text_readln(f);
        if (string_char_at(line, 1)=='@'){
            var q=split(line, '=')
            switch (deq(q)){
                case "@cover":
                    cover_image=asset_get_index(deq(q));
                    break;
                case "@pages":
                    page_image=asset_get_index(deq(q));
                    break;
                case "@author":
                    author=deq(q);
                    if (atob){
                        author=string_atob_cipher(author);
                    }
                    break;
                case "@title":
                    title=deq(q);
                    if (atob){
                        title=string_atob_cipher(title);
                    }
                default:
                    // basically, an @ that isn't followed by anything important is a comment
                    break;
            }
            ds_queue_destroy(q);
        } else {
            contents=contents+line+" ";
        }
    }
    file_text_close(f);
    // Create the pages.
    draw_set_font(Font16);
    spl=split(contents, " ");
    var word=deq(spl);
    var color=c_black;
    var scale=2.5;
    do {            // While there is still text
        var page=ds_list_create();
        var page_c=ds_list_create();
        do {        // While there is still space on the page
            var line="";
            var width=0;
            do {    // While there is still space on the line
                if (string_char_at(word, 1)=="\"){
                    switch (string_char_at(word, 2)){
                        case "b":   // Page break
                            ds_list_add(page, string_strip(line));
                            ds_list_add(page_text, page);
                            ds_list_add(page_c, color);
                            ds_list_add(page_colors, page_c);
                            page=ds_list_create();
                            page_c=ds_list_create();
                            total_pages++;
                            line="";
                            width=0;
                            word=string_copy(word, 3, string_length(word)-2);
                            break;
                        case "n":   // Newline
                            ds_list_add(page, string_strip(line));
                            ds_list_add(page_c, color);
                            line="";
                            width=0;
                            if (ds_list_size(page)>=floor(18*scale)){
                                ds_list_add(page_text, page);
                                ds_list_add(page_colors, page_c);
                                page=ds_list_create();
                                page_c=ds_list_create();
                                total_pages++;
                            }
                            word=string_copy(word, 3, string_length(word)-2);
                            break;
                        case "c":   // Color: \c000 for black, \c999 for white
                            var rr=real(string_char_at(word, 3));
                            var gg=real(string_char_at(word, 4));
                            var bb=real(string_char_at(word, 5));
                            var f=255/9;
                            color=make_color_rgb(floor(f*rr), floor(f*gg), floor(f*bb));
                            word=string_copy(word, 6, string_length(word)-5);
                            break;
                        default:
                            break;
                    }
                }
                if (atob){
                    line=line+string_atob_cipher(word)+" ";
                    width=width+string_width(string_atob_cipher(word)+" ");
                } else {
                    line=line+word+" ";
                    width=width+string_width(word+" ");
                }
                word=deq(spl);
            } until(width+string_width(word)>floor(172*scale)||ds_queue_empty(spl));
            // Add the line to the page
            ds_list_add(page, string_strip(line));
            ds_list_add(page_c, color);
        } until(ds_list_size(page)>=floor(18*scale)||ds_queue_empty(spl));
        // Add the page to the book
        ds_list_add(page_text, page);
        ds_list_add(page_colors, page_c);
        total_pages++;
    } until(ds_queue_empty(spl));
    ds_queue_destroy(spl);
    // if there's an odd number of pages, add a blank one as padding
    if (total_pages%2==1){
        total_pages++;
        ds_list_add(page_text, ds_list_create());
        ds_list_add(page_colors, ds_list_create());
    }
    // add another blank page, since the last one is the back cover
    total_pages++;
    ds_list_add(page_text, ds_list_create());
    ds_list_add(page_colors, ds_list_create());
}

World.pause_is_hidden=true;
