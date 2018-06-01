SELECT GROUP_CONCAT(CONCAT(codcurso,',',nombre) SEPARATOR '\\n') FROM `curso`;
