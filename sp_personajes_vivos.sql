CREATE DEFINER=`pdfprincipal`@`%` PROCEDURE `personajes_vivos_antes_de`(IN anio INT)
BEGIN

	SELECT * FROM personaje WHERE (YEAR(fecha_muerte) > anio and YEAR(fecha_creacion) < anio) or (fecha_muerte is NULL and YEAR(fecha_creacion) < anio);

END


