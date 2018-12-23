/// int get_achievement_total();

var t=0;
for (var i=0; i<array_length_1d(achievement); i++){
    if (achievement[i]){
        t++;
    }
}

return t;
