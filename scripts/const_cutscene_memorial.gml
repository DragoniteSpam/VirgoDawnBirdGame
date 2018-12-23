var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_talk, "The Aviary, In Memory Of:"));
ds_list_add(l, args(scr_talk, "Stanley Almodovar, Amanda Alvear, Oscar Arcana-Montero, Rodolfo Ayala, Alejandro Barrio Martinez, Martin Benitez Torres, Antonio Brown, Darryl Burt, Jonathon Camuy Vega, Angel Candelario-Padro, Simon Carrilo Fernandez, Juan Chevez-Martinez, Luis Conde, Cory Connell"));
ds_list_add(l, args(scr_talk, "Tevin Crosby, Frank Dejesus Velazquez, Deonka Drayton, Mercedez Flores, Peter Gonzales-Cruz, Juan Guerrero, Paul Henry, Frank Hernandez, Miguel Honorato, Javier Jorge-Reyes, Jason Josaphat, Eddit Justice, Anthony Laureano Disla, Christopher Leinonen, Brenda Marquez McCool"));
ds_list_add(l, args(scr_talk, "Jean Mendez Perez, Akyra Murray, Kimberly Morris, Jean Rodriguez, Luis Ocasio-Capo, Geraldo Ortiz-Jiminez, Eric Ortiz-Rivera, Joel Paniagua, Enrique Rios Jr., Rivera Velazquez, Yilmary Rodriguez Solivan, Christopher Sanfeliz, Xavier Serrano Rosado, Gilberto Silva Menendez"));
ds_list_add(l, args(scr_talk, "Edward Sotomayor Jr., Shane Tomlinson, Leroy Valetin Fernandez, Luis Vielma, Luis Wilson-Leon, Jerald Wright"));
ds_list_add(l, args(scr_lock_unset));

return l;
