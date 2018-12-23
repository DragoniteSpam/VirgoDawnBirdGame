/// boolean timeIsLeapYear(year);

if (argument0%4>0)  // not divisible by 4
    return false;

if (argument0%100>0)// not divisible by 100
    return true;

if (argument0%400>0)// not divisible by 400
    return false;

return true;
