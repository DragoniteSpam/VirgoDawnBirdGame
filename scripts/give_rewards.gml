if (loot!=Items.NONE){
    AddItem(loot_package, loot, loot_quantity);
}

// @todo some form of reward, possibly heart drops if needed

if (Player.hp_current<get_max_hp(Player.exp_hp)){
    var chance, duration, full_heal_chance;
    switch (difficulty){
        case DifficultyModes.noob:
            chance=35;
            duration=-1;
            full_heal_chance=10;
            break;
        case DifficultyModes.easy:
            chance=20;
            duration=30;
            full_heal_chance=5;
            break;
        case DifficultyModes.regular:
            chance=10;
            duration=15;
            full_heal_chance=4;
            break;
        case DifficultyModes.hard:
            chance=5;
            duration=10;
            full_heal_chance=3;
            break;
        case DifficultyModes.masochist:
            chance=2;
            duration=5;
            full_heal_chance=2;
            break;
    }
    if (irandom(100)<chance){
        var ev=instance_create(x, y, EventRestoreHP);
        ev.z=z;
        ev.lifespan=duration;
        if (ev.lifespan>-1){
            ev.lifespan=ev.lifespan*60;
        }
        if (irandom(100)<full_heal_chance){
            ev.heal_full=true;
        }
        with (ev){
            script_execute(collision_adder, id);
        }
    }
}
