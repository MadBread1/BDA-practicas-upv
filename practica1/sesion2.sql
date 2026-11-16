/* Ejercicio 15 */
SELECT cod_peli, titulo 
FROM Pelicula p
WHERE p.director IN (SELECT a.nombre FROM actor a
                        JOIN actua at ON a.cod_act = at.cod_act
                        WHERE at.cod_peli = p.cod_peli);


/* Ejercicio 16 */
SELECT cod_act, nombre 
FROM Actor a
WHERE cod_act IN (SELECT at.cod_act
                FROM actua at
                WHERE at.papel = 'Principal') 
                AND EXTRACT (year FROM a.fecha_nac) < 1950
                ORDER BY a.nombre;


/* Ejercicio 18 */
SELECT LP.cod_lib, LP.titulo, LP.autor
FROM LIBRO_PELI LP
WHERE NOT EXISTS (SELECT * 
                  FROM Pelicula P 
                  WHERE P.cod_lib = LP.cod_lib);


/* Ejercicio 19 */
SELECT G.nombre
FROM GENERO G
WHERE EXISTS (SELECT * 
              FROM CLASIFICACION C
              WHERE C.COD_GEN = G.COD_GEN
                    AND NOT EXISTS (SELECT * 
                                    FROM ACTUA A
                                    WHERE A.COD_PELI = C.COD_PELI))
ORDER BY G.nombre;


/* 20. Obtener el título de los libros en los que se haya basado alguna película en la que no hayan actuado
actores del país de nombre ‘USA’ (ordenados por título). */

SELECT DISTINCT L.titulo
FROM LIBRO_PELI L, PELICULA P
WHERE L.cod_lib = P.cod_lib
  AND P.cod_peli NOT IN (
      SELECT A.cod_peli
      FROM ACTUA A, ACTOR AC, PAIS PA
      WHERE A.cod_act = AC.cod_act
        AND AC.cod_pais = PA.cod_pais
        AND PA.nombre = 'USA'
  )
ORDER BY L.titulo;


/* 21. ¿Cuántas películas hay clasificadas del género de nombre ‘Comedia’ y en las que sólo aparece un actor
con el papel ‘Secundario’? */


/* 22. Obtener el año de la primera película en la que el actor de nombre ‘Jude Law’ tuvo un papel como
‘Principal’ */


/* 23. Obtener el código y el nombre de actor o actores más viejos. */
SELECT A.cod_act, A.nombre 
FROM ACTOR A
WHERE A.FECHA_NAC IN (SELECT MIN(fecha_nac) 
                      FROM ACTOR);


/* 24. Obtener el código, el nombre y la fecha de nacimiento del actor más viejo nacido en el año 1940. */
SELECT A.cod_act, A.nombre 
FROM ACTOR A
WHERE A.FECHA_NAC IN (SELECT MIN(fecha_nac) 
                      FROM ACTOR); -- PEREDELAT'




