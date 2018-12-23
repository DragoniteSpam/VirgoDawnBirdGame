/// boolean char_is_vowel(char, [include y?]);

var c=string_lower(argument[0]);

if (argument_count==2&&argument[1]&&c=="y"){
    return true;
}

return (c=="a"||c=="e"||c=="i"||c=="o"||c=="u");
