CREATE DEFINER=`pdfprincipal`@`%` PROCEDURE `personajes_con_poderes`(IN poder_array_var VARCHAR(1000))
BEGIN
	SELECT personaje.* FROM personaje, personaje_poder, poder WHERE personaje.id=personaje_poder.idpersonaje AND personaje_poder.idpoder=poder.id AND poder.nombre IN (poder_array_var);

END
