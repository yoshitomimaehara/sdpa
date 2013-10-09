<!--
Nombre:curso.jsp
Descripcion:Pagina de Cursos
Autores:Yoshitomi Maehara/Liliana Gonzales
Email:
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css\styles.css"/>
<link rel="stylesheet" href="css\bootstrap.min.css">
<script src="js\jquery.js"></script>
<script src="js\scripts.js"></script>
<script src="js\bootstrap.js"></script>
<title></title>
</head>
<body>
	<div class="container-fluid">	
	<div class="row-fluid">	
	<aside class="span4 menu_dentro">
		<ul class="nav nav-list">
			<li class="nav-header">Alumno</li>
			<li><a href="alumno_consultar.jsp" class="enlaces">Consultar</a></li>
			<li><a href="alumno_insertar.jsp" class="enlaces">Insertar</a></li>
			<li><a href="#">Modificar</a></li>
			<li><a href="#">Eliminar</a></li>
		</ul>
	</aside>
	
	<section class="span8 contenido_dentro" id="contenido">
	
	</section>
	</div>
	</div>
</body>
</html>