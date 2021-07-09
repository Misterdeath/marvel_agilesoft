CREATE TABLE `personaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ficticio` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_real` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_muerte` date DEFAULT NULL,
  `fans` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_personaje_UNIQUE` (`nombre_ficticio`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


CREATE TABLE `poder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



CREATE TABLE `personaje_poder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpersonaje` int(11) DEFAULT NULL,
  `idpoder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idpersonaje_idx` (`idpersonaje`),
  KEY `idpoderfk_idx` (`idpoder`),
  CONSTRAINT `idpersonajefk` FOREIGN KEY (`idpersonaje`) REFERENCES `personaje` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `idpoderfk` FOREIGN KEY (`idpoder`) REFERENCES `poder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;





