if (mouse_check_button(mb_left)){
    return vk_lmouse;
} else if (mouse_check_button(mb_right)){
    return vk_rmouse;
} else if (mouse_check_button(mb_middle)){
    return vk_mmouse;
}

// WASD are disabled because that would make moving around really, really weird

switch (keyboard_key){
    case ord('Q'):
//    case ord('W'):
    case ord('E'):
    case ord('R'):
    case ord('T'):
    case ord('Y'):
    case ord('U'):
    case ord('I'):
    case ord('O'):
    case ord('P'):
//    case ord('A'):
//    case ord('S'):
//    case ord('D'):
    case ord('F'):
    case ord('G'):
    case ord('H'):
    case ord('J'):
    case ord('K'):
    case ord('L'):
    case ord('Z'):
    case ord('X'):
    case ord('C'):
    case ord('V'):
    case ord('B'):
    case ord('N'):
    case ord('M'):
    case vk_escape:
    case vk_tab:
/*    case vk_lshift:
    case vk_rshift:
    case vk_lcontrol:
    case vk_rcontrol:
    case vk_lalt:
    case vk_ralt:*/
    case vk_space:
    case vk_backspace:
    case vk_enter:
    case vk_insert:
    case vk_home:
    case vk_end:
    case vk_pageup:
    case vk_pagedown:
    case vk_delete:
    case vk_up:
    case vk_down:
    case vk_left:
    case vk_right:
        return keyboard_key;
    default:
        return vk_nokey;
}
