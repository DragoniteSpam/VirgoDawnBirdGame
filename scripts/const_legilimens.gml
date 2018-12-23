enum Legilimens {
    none,
    def,
    final,
}

globalvar all_legilimens_text, all_legilimens_text_names;
all_legilimens_text=array_create(Legilimens.final);
all_legilimens_names=array_add(Legilimens.final, "");

all_legilimens_names[Legilimens.none]="None";
all_legilimens_text[Legilimens.none]=legilimens_none;
all_legilimens_names[Legilimens.def]="Default";
all_legilimens_text[Legilimens.def]=legilimens_default;
