// Increments the "spells cast" stat and the type of spell.

if (id==Player.id){
    stat_spells++;
    if (is_clamped(argument0, 0, array_length_1d(stat_spell_types)-1)){
        stat_spell_types[argument0]++;
    } else {
        print("Spell type out of range: "+string(argument0));
    }
}
