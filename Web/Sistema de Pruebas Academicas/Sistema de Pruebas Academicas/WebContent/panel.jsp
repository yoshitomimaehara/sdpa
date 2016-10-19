<!--
Nombre:panel.jsp
Descripcion:Pagina Principal
Autores:Yoshitomi Maehara/Liliana Gonzales
Email:
-->
<%@page import="model.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
<link rel="stylesheet" type="text/css" href="css\styles.css"/>
<link rel="stylesheet" href="css\bootstrap.min.css">
<script src="js\jquery.js"></script>
<script src="js\scripts.js"></script>
<script src="js\bootstrap.js"></script>
<title>.::::Sistema de Evaluaciones Academicas::::. - Principal</title>
</head>
<body>
	<header class="cabecera_panel">

	</header>
	<div> 
	<nav class="menu_panel navbar">
	<div class="navbar-inner">
	<a class="brand" href="panel.jsp"> Principal </a>
    	<div class="container">
			<ul class="nav">
			 	<li class="dropdown">
    			<a href="#" class="dropdown-toggle" data-toggle="dropdown"> Academico <b class="caret"></b></a>
    			<ul class="dropdown-menu">
					<li><a href="#" class="accesos">Cursos</a></li>
					<li><a href="#" class="accesos">Estadisticas</a>
    			</ul>
    			</li>
				<li><a href="#"  class="accesos">Perfil</a></li>
  				<li class="dropdown">
  				<a class="dropdown-toggle" data-toggle="dropdown">Mantenimiento<b class="caret"></b></a>
  				<ul class="dropdown-menu">
					<li><a href="alumno.jsp" class="accesos">Alumnos</a></li>
					<li><a href="profesor.jsp" class="accesos">Profesores</a></li>
					<li><a href="curso.jsp" class="accesos">Cursos</a></li>
					<li><a href="usuario.jsp" class="accesos">Usuarios</a></li>
    			</ul>
  				</li>
			</ul>
			<ul class="nav pull-right">
				<li><a href="#"><i class="icon-off"></i> Cerrar Sesion</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<section class="contenido_panel">
		<article id="main" class="contenedor hero-unit">
			<h1>Bienvenido </h1>
		</article>
	</section>
	</div>
	<footer>
	
	</footer>
</body>
</html>