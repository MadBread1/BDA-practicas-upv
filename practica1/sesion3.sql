

-- 32. Obtener el código y el nombre de los países con actores y tales que todos los actores de ese país han nacido en el siglo XX (ordenados por nombre)
-- SELECT P.cod_pais, P.nombre
-- FROM PAIS P
-- WHERE NOT EXISTS (

--     SELECT * 
--     FROM ACTOR A
--     WHERE A.cod_pais = P.cod_pais
--     AND (A.fecha_nac < DATE '1900-01-01' OR A.fecha_nac >= DATE '2000-01-01'))

--     AND EXISTS (
--     SELECT *
--     FROM ACTOR A
--     WHERE A.cod_pais = P.cod_pais)

-- ORDER BY P.nombre


-- 33. Obtener el código y el nombre de los actores tales que todos los papeles que han tenido son de ‘Secundario’. Sólo interesan aquellos actores que hayan actuado en alguna película.
-- SELECT A.cod_act, A.nombre
-- FROM ACTOR A
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM ACTUA AC
--     WHERE AC.cod_act = A.cod_act
--     AND AC.papel <> 'Secundario')

--     AND EXISTS (
--     SELECT *
--     FROM ACTUA AC
--     WHERE AC.cod_act = A.cod_act)

-- ORDER BY A.nombre



-- 34. Obtener el código y el nombre de los actores que han aparecido en todas las películas del director ‘Guy Ritchie’ (sólo si ha dirigido al menos una).
-- SELECT A.cod_act, A.nombre
-- FROM ACTOR A
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM PELICULA P
--     WHERE P.director = 'Guy Ritchie'
--     AND NOT EXISTS (
--         SELECT *
--         FROM ACTUA AC
--         WHERE AC.cod_peli = P.cod_peli
--         AND AC.cod_act = A.cod_act))

--     AND EXISTS (
--         SELECT *
--         FROM PELICULA P
--         WHERE P.director = 'Guy Ritchie')
    
-- ORDER BY A.nombre


-- 35. Resolver la consulta anterior pero para el director de nombre ‘John Steel’.
-- SELECT A.cod_act, A.nombre
-- FROM ACTOR A
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM PELICULA P
--     WHERE P.director = 'John Steel'
--     AND NOT EXISTS (
--         SELECT *
--         FROM ACTUA AC
--         WHERE AC.cod_peli = P.cod_peli
--         AND AC.cod_act = A.cod_act))

--     AND EXISTS (
--         SELECT *
--         FROM PELICULA P
--         WHERE P.director = 'John Steel')
    
-- ORDER BY A.nombre


-- 36. Obtener el código y el título de las películas de menos de 100 minutos en las que todos los actores que han actuado son de un mismo país
-- SELECT P.cod_peli, P.titulo
-- FROM PELICULA P
-- WHERE P.duracion < 100

--   AND NOT EXISTS (
--       SELECT *
--       FROM ACTUA AC1, ACTOR A1, ACTUA AC2, ACTOR A2
--       WHERE AC1.cod_peli = P.cod_peli
--         AND AC1.cod_act = A1.cod_act
--         AND AC2.cod_peli = P.cod_peli
--         AND AC2.cod_act = A2.cod_act
--         AND A1.cod_pais <> A2.cod_pais)

--     AND EXISTS (
--       SELECT * FROM ACTUA AC WHERE AC.cod_peli = P.cod_peli)
-- ORDER BY P.titulo


-- 37. Obtener el código, el título y el año de las películas en las que haya actuado algún actor si se cumple que todos los actores que han actuado en ella han nacido antes del año 1943 (hasta el 31/12/1942).
-- SELECT P.cod_peli, P.titulo, P.anyo
-- FROM PELICULA P
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM ACTUA AC, ACTOR A
--     WHERE AC.cod_peli = P.cod_peli
--     AND AC.cod_act = A.cod_act
--     AND A.fecha_nac >= DATE '1943-01-01')

-- AND EXISTS (
--     SELECT *
--     FROM ACTUA AC
--     WHERE AC.cod_peli = P.cod_peli)

-- ORDER BY P.cod_peli


-- 38. Obtener el código y el nombre de cada país si se cumple que todos sus actores han actuado en al menos una película de más de 120 minutos. (Ordenados por nombre).

SELECT P.cod_pais, P.nombre
FROM PAIS P
WHERE NOT EXISTS (
    SELECT *
    FROM ACTOR A
    WHERE A.cod_pais = P.cod_pais

    AND NOT EXISTS (
        SELECT *
        FROM ACTUA AC, PELICULA PE
        WHERE AC.cod_act = A.cod_act
        AND AC.cod_peli = PE.cod_peli
        AND PE.duracion > 120))
        
ORDER BY P.nombre
