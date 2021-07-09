
-- //Ejemplos de uso (crear):

CALL nuevo_personaje('Ironman', 'Tony Star', '1993-01-01', '2020-04-23', 90000000, 'Fuerza, Rapidez, Volar', FALSE);

CALL nuevo_personaje('Hulk', 'Bruce Banner', '1991-06-01', NULL, 40000000, 'Fuerza, Rapidez', FALSE);


-- //Ejemplos de uso (modiﬁcar):

CALL nuevo_personaje('Ironman', 'Ton', '1993-01-01', '2020-04-23', 90000000, 'Fuerza, Rapidez, Volar', FALSE);

CALL nuevo_personaje('Hulk', 'Dr. Banner', '1991-06-01', NULL, 40000000, 'Fuerza, Rapidez', FALSE);


-- //Ejemplos de uso (borrar):

CALL nuevo_personaje('Ironman', 'Ton', '1993-01-01', '2020-04-23', 90000000, 'Fuerza, Rapidez, Volar', TRUE);


-- //Personajes vivos, antes X año:

CALL personajes_vivos_antes_de(2022);


-- //Personajes vivos, antes X año:

CALL personajes_con_poderes('Fuerza, Rapidez');






