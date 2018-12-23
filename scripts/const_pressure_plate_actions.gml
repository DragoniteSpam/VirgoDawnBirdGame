enum PressurePlateActions {
    none,
    castle_give_sproing,
    castle_show_block,
    castle_give_key,
    illum_show_tc1,
    illum_show_tc2,
    illum_show_block1,
    final,
}

var arr=array_add(PressurePlateActions.final);
arr[PressurePlateActions.none]=add_pressure_plate_action("None", null, null);

arr[PressurePlateActions.castle_give_sproing]=add_pressure_plate_action("CastleGiveSproing", ppa_castle_show_sproing, ppa_castle_hide_sproing);
arr[PressurePlateActions.castle_show_block]=add_pressure_plate_action("CastleResetBlock", ppa_castle_show_block, null);
arr[PressurePlateActions.castle_give_key]=add_pressure_plate_action("CastleGiveKey", ppa_castle_show_key, ppa_castle_hide_key);

arr[PressurePlateActions.illum_show_tc1]=add_pressure_plate_action("IllumShowTC1", ppa_illum_show_tc1, ppa_illum_hide_tc1);
arr[PressurePlateActions.illum_show_tc2]=add_pressure_plate_action("IllumShowTC2", ppa_illum_show_tc2, ppa_illum_hide_tc2);
arr[PressurePlateActions.illum_show_block1]=add_pressure_plate_action("IllumResetBlock1", ppa_illum_show_block1, null);

arr[PressurePlateActions.final]=add_pressure_plate_action("Final", null, null);

(ds_map_find_value(all_mod_packages, BASE_ASSET)).my_pressure_plate_actions=arr;
