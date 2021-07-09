CREATE DEFINER=`pdfprincipal`@`%` PROCEDURE `nuevo_personaje`(IN nombre_ficticio_var varchar(100)
, IN nombre_real_var VARCHAR(255)
, IN fecha_creacion_var DATE
, IN fecha_muerte_var DATE
, IN fans_var INT
, IN poder_array_var VARCHAR(1000)
, IN borrar boolean)
proceso:BEGIN
    DECLARE array_local VARCHAR(1000);
    DECLARE idpersonaje_var INT;
    DECLARE idpoder_var INT;
	DECLARE Pos INT DEFAULT 1 ;
	DECLARE Str VARCHAR(1000);
    DECLARE idpoder_var2 INT;

    SET array_local = poder_array_var;
    
	SELECT id INTO idpersonaje_var FROM personaje WHERE upper(trim(nombre_ficticio)) = upper(trim(nombre_ficticio_var));
	DELETE FROM personaje_poder WHERE idpersonaje = idpersonaje_var;

    IF borrar=TRUE THEN
    	DELETE FROM personaje WHERE id = idpersonaje_var;
		LEAVE proceso;
	END IF;

    IF idpersonaje_var IS NULL THEN
		INSERT INTO personaje
		(nombre_ficticio,
		nombre_real,
		fecha_creacion,
		fecha_muerte,
		fans)
		VALUES
		(trim(nombre_ficticio_var),
		nombre_real_var,
		fecha_creacion_var,
		fecha_muerte_var,
		fans_var);
		SELECT LAST_INSERT_ID() INTO idpersonaje_var;
    ELSE 
		UPDATE personaje
		SET
		nombre_real = nombre_real_var,
		fecha_creacion = fecha_creacion_var,
		fecha_muerte = fecha_muerte_var,
		fans = fans_var
		WHERE id = idpersonaje_var;
    END IF;

WHILE CHAR_LENGTH(array_local) > 0 AND Pos > 0 DO
SET Pos = INSTR(array_local, ',');
IF Pos = 0 THEN
SET Str = array_local;
ELSE
SET Str = LEFT(array_local, Pos - 1);
END IF;
IF TRIM(Str) != '' THEN
SELECT Str;
END IF;
SET array_local = SUBSTRING(array_local, Pos + 1);

SELECT id INTO idpoder_var FROM poder WHERE trim(nombre) = trim(Str);
 SELECT idpoder_var;

    IF idpoder_var IS NULL THEN
	INSERT INTO poder (nombre) VALUES (trim(Str));
           SELECT LAST_INSERT_ID() INTO  idpoder_var2;

                            INSERT INTO personaje_poder
							(idpersonaje,
							idpoder)
							VALUES
							(idpersonaje_var,
							idpoder_var2);                        
                                                    
          
		ELSE
                           INSERT INTO personaje_poder
							(idpersonaje,
							idpoder)
							VALUES
							(idpersonaje_var,
							idpoder_var);   
                            SET idpoder_var=NULL;
       END IF;
END WHILE;
END

