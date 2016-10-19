<!--
Nombre:index.jsp
Descripcion:Pagina Principal
Autores:Yoshitomi Maehara/Liliana Gonzales
Email:
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="css\styles.css"/>
<link rel="stylesheet" type="text/css" href="css\bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css\bootstrap-responsive.min.css">
<link rel="stylesheet" type="text/css" href="css\normalize.css">
<script src="js\bootstrap.js"></script>
<script src="js\jquery.js"></script>
<script src="js\scripts.js"></script>
<title>.::::Sistema de Evaluaciones Academicas::::.</title>
</head>
<body>
	<header class="cabecera_index">
			<h1>Sistema de Evaluaciones Academicas</h1>
	</header>
	<div class="container-fluid">
  		<div class="row">
		<section class="col-xs-2">
			<article>
				<div>
					<img class="imagen" src="img\inicio.png" />
				</div>
			</article>
		</section>
		<aside class="col-xs-4 jumbotron login_index">
			<form method="post" action="LoginIngreso">
			<table>
				<tr><td><label>Usuario:</label></td><td><input type="text" name="user"/></td></tr>
				<tr><td><label>Contrase&ntilde;a:</label></td><td><input type="password" name="pass"/></td></tr>
				<tr><td><input type="submit" class="btn btn-primary" value="Ingresar" /></td><td><a href="#" id="link_contrasenia">¿se olvido su contraseña?</a></td></tr>
			</table>
			</form>
		<c:if test="${requestScope.error != null}">
			<div class="alert alert-error">
				<a class="close" data-dismiss="alert">&times;</a>
				${requestScope.error}	
			</div>
		</c:if>
	</aside>
		</div>
	</div>
	<footer class="pie_index ">
		<p id="copyleft">Yoshitomi Maehara &amp; Liliana Gonzales</p>
	</footer>

</body>
</html>