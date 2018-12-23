enum Birds {
    Robin,          // 0
    Catbird,        // 1
    Mockingbird,    // 2
    Waxwing,        // 3
    SparrowT,       // 4
    SparrowS,       // 5
    Cardinal,       // 6
    Blackbird,      // 7
    Oriole,         // 8
    Siskin,         // 9
    Goldfinch,      // 10
    Dove,           // 11
    WoodpeckerRB,   // 12
    WoodpeckerD,    // 13
    WoodpeckerH,    // 14
    WoodpeckerP,    // 15
    Flicker,        // 16
    Kingbird,       // 17
    Bluejay,        // 18
    Crow,           // 19
    Chickadee,      // 20
    Titmouse,       // 21
    Nuthatch,       // 22
    Creeper,        // 23
    Bluebird,       // 24
    Pigeon,         // 25
    Chicken         // 26
}

globalvar all_birds;

all_birds=array_add(Birds.Chicken, noone);

all_birds[Birds.Robin]=add_bestiary_page("American Robin", 280, 765, "An orange and gray migratory songbird of North America. They're all over the freaking place in the summer.", false, -1, b_bird_robin);
all_birds[Birds.Catbird]=add_bestiary_page("Gray Catbird", 400, 220, "A medium-sized perching bird of North and Central America. It's named for its cat-like call.", false, -1, -1);
all_birds[Birds.Mockingbird]=add_bestiary_page("Northern Mockingbird", 250, 500, "The only mockingbird commonly found in North America. Their tails are almost as long as their bodies.", false, -1, -1);
all_birds[Birds.Waxwing]=add_bestiary_page("Cedar Waxwing", 0, 0, "", false, -1, -1);
all_birds[Birds.SparrowT]=add_bestiary_page("American Tree Sparrow", 0, 0, "", false, -1, -1);
all_birds[Birds.SparrowS]=add_bestiary_page("Song Sparrow", 0, 0, "", false, -1, -1);
all_birds[Birds.Cardinal]=add_bestiary_page("Northern Cardinal", 0, 0, "", false, -1, -1);
all_birds[Birds.Blackbird]=add_bestiary_page("Red-Winged Blackbird", 0, 0, "", false, -1, -1);
all_birds[Birds.Oriole]=add_bestiary_page("Baltimore Oriole", 0, 0, "", true, -1, -1);
all_birds[Birds.Siskin]=add_bestiary_page("Pinen Siskin", 0, 0, "", false, -1, -1);
all_birds[Birds.Goldfinch]=add_bestiary_page("American Goldfinch", 0, 0, "", false, -1, -1);
all_birds[Birds.Dove]=add_bestiary_page("Morning Dove", 0, 0, "", false, -1, -1);
all_birds[Birds.WoodpeckerRB]=add_bestiary_page("Red-Bellied Woodpecker", 0, 0, "", false, -1, -1);
all_birds[Birds.WoodpeckerD]=add_bestiary_page("Downy Woodpecker", 0, 0, "", false, -1, -1);
all_birds[Birds.WoodpeckerH]=add_bestiary_page("Hairy Woodpecker", 0, 0, "", false, -1, -1);
all_birds[Birds.WoodpeckerP]=add_bestiary_page("Pliated Woodpecker", 0, 0, "", false, -1, -1);
all_birds[Birds.Flicker]=add_bestiary_page("Northern Flicker", 0, 0, "", false, -1, -1);
all_birds[Birds.Kingbird]=add_bestiary_page("Eastern Kingbird", 0, 0, "", false, -1, -1);
all_birds[Birds.Bluejay]=add_bestiary_page("Blue Jay", 0, 0, "", false, -1, -1);
all_birds[Birds.Crow]=add_bestiary_page("American Crow", 0, 0, "", false, -1, -1);
all_birds[Birds.Chickadee]=add_bestiary_page("Black-Capped Chickadee", 0, 0, "", false, -1, -1);
all_birds[Birds.Titmouse]=add_bestiary_page("Tufted Titmouse", 0, 0, "", false, -1, -1);
all_birds[Birds.Nuthatch]=add_bestiary_page("White-Breasted Nuthatch", 0, 0, "", false, -1, -1);
all_birds[Birds.Creeper]=add_bestiary_page("Brown Creeper", 0, 0, "", false, -1, -1);
all_birds[Birds.Bluebird]=add_bestiary_page("Eastern Bluebird", 0, 0, "", false, -1, -1);
all_birds[Birds.Pigeon]=add_bestiary_page("Pigeon", 0, 0, "", false, -1, -1);
all_birds[Birds.Chicken]=add_bestiary_page("Chicken", 0, 0, "", false, -1, -1);
