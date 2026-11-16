
-- /* 50. Obtener para todos los países que hay en la base de datos, el código, el nombre y la cantidad de actores
-- que hay de ese país. */

-- SELECT P.cod_pais, P.nombre AS NOMBRE, COUNT(A.cod_act)
-- FROM PAIS P
--      LEFT JOIN ACTOR A ON P.cod_pais = A.cod_pais
-- GROUP BY P.cod_pais, P.nombre
-- ORDER BY P.nombre



-- /* 51. Obtener el código y el título de todos los libros de la base de datos de año posterior a 1980 junto con la
-- cantidad de películas a que han dado lugar. */

-- SELECT L.cod_lib, L.titulo, COUNT(P.cod_peli)
-- FROM Libro_peli L
--     LEFT JOIN PELICULA P ON P.COD_LIB = L.COD_LIB
-- WHERE L.ANYO > 1980
-- GROUP BY L.cod_lib, L.titulo



-- /* 52. Obtener para todos los países que hay en la base de datos, el código, el nombre y la cantidad de actores
-- que hay de ese país que hayan tenido un papel como “Secundario” en alguna película. */

-- SELECT P.cod_pais AS COD_P, 
--        P.nombre AS NOMBRE, 
--        COUNT(A.cod_act)
-- FROM PAIS P
--      LEFT JOIN (SELECT DISTINCT ACTOR.cod_act, ACTOR.cod_pais
--                 FROM ACTOR
--                 JOIN ACTUA ON ACTOR.cod_act = ACTUA.cod_act
--                 WHERE ACTUA.papel = 'Secundario') A ON P.cod_pais = A.cod_pais
-- GROUP BY P.cod_pais, P.nombre


/* 53. Obtener para cada película que hay en la base de datos que dure más de 140 minutos, el código, el título,
la cantidad de géneros en los que está clasificado y la cantidad de actores que han actuado en ella. */

SELECT P.COD_PELI, P.TITULO, COUNT(DISTINCT C.COD_GEN), COUNT(DISTINCT A.COD_ACT)
FROM PELICULA P
LEFT JOIN CLASIFICACION C ON P.COD_PELI = C.COD_PELI
LEFT JOIN ACTUA A ON P.COD_PELI = A.COD_PELI
WHERE P.DURACION > 140
GROUP BY P.COD_PELI, P.TITULO
