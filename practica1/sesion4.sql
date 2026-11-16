/* 40. Obtener para cada género en el que se han clasificado más de 5 películas, el código y el nombre del
género indicando la cantidad de películas del mismo y duración media de sus películas. (Ordenados por
nombre). (La función ROUND redondea al entero más cercano). */

-- SELECT G.cod_gen, G.nombre, COUNT(C.COD_PELI) , ROUND(AVG(P.duracion)) 
-- FROM Genero G
--     JOIN CLASIFICACION C ON G.cod_gen = C.cod_gen
--     JOIN Pelicula P ON C.COD_PELI = P.COD_PELI
-- GROUP BY G.cod_gen, G.nombre
-- HAVING COUNT(C.COD_PELI) > 5
-- ORDER BY G.nombre


/* 41. Obtener el código y el título de las películas de año posterior al 2000 junto con el número de géneros en
que están clasificadas, si es que están en alguno. (Ordenadas por título). */

-- SELECT P.cod_peli, P.titulo, COUNT(C.cod_gen)
-- FROM Pelicula P
-- JOIN CLASIFICACION C ON P.COD_PELI = C.COD_PELI 
-- WHERE P.anyo > 2000
-- GROUP BY P.cod_peli, P.titulo
-- ORDER BY P.titulo


/* 42. Obtener los directores que tienen la cadena ‘George’ en su nombre y que han dirigido exactamente dos
películas. */

-- SELECT director
-- FROM PELICULA
-- WHERE director LIKE '%George%'
-- GROUP BY director
-- HAVING COUNT(cod_peli) = 2


/* 43. Obtener para cada película clasificada exactamente en un género y en la que haya actuado algún actor,
el código, el título y la cantidad de actores que actúan en ella. */

SELECT P.cod_peli, P.titulo, COUNT(DISTINCT A.cod_act)
FROM (PELICULA P
    JOIN ACTUA A ON P.cod_peli = A.cod_peli
    Join CLASIFICACION C ON P.COD_PELI = C.COD_PELI)
GROUP BY P.cod_peli, P.titulo
HAVING COUNT(distinct C.cod_gen) = 1
Order by P.TITULO



