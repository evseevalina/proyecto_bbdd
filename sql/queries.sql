-- 1. Numero de alumnos por campus

SELECT c.campus, COUNT(*) AS total_alumnos
FROM alumnos a
JOIN clases cl ON a.id_clase = cl.id_clase
JOIN campus c ON cl.id_campus = c.id_campus
GROUP BY c.campus;

-- 2. Numero de alumnos por vertical

SELECT v.vertical, COUNT(*) AS total_alumnos
FROM alumnos a
JOIN clases cl ON a.id_clase = cl.id_clase
JOIN verticales v ON cl.id_vertical = v.id_vertical
GROUP BY v.vertical;

-- 3. Evaluaciones por proyecto

SELECT p.proyecto, e.evaluacion, COUNT(*) AS total
FROM evaluaciones e
JOIN proyectos p ON e.id_proyecto = p.id_proyecto
GROUP BY p.proyecto, e.evaluacion;

-- 4. Profesores por rol

SELECT r.rol, COUNT(DISTINCT c.id_profesor) AS total
FROM claustro c
JOIN roles r ON c.id_rol = r.id_rol
GROUP BY r.rol;

-- 5. Porcentaje de aptos por proyecto

SELECT p.proyecto,
       ROUND(100.0 * SUM(
           CASE WHEN e.evaluacion = 'Apto' THEN 1 ELSE 0 END
       ) / COUNT(*), 2) AS porcentaje_aptos
FROM evaluaciones e
JOIN proyectos p ON e.id_proyecto = p.id_proyecto
GROUP BY p.proyecto
ORDER BY porcentaje_aptos DESC;