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
<html>
<head>
<link rel="stylesheet" type="text/css" href="css\styles.css"/>
<link rel="stylesheet" href="css\bootstrap.min.css">
<script src="js\jquery.js"></script>
<script src="js\scripts.js"></script>
<script src="js\bootstrap.js"></script>
<title>.::::Sistema de Evaluaciones Academicas::::.</title>
</head>
<body>
	
  	<div class="container">  	
		<header class="span12 cabecera_index">
			<h1>Sistema de Evaluaciones Academicas</h1>
		</header>
	<div class="container-fluid">	
	<div class="row-fluid">	
	<section class="span6">
		<img class="imagen" src="img\academico.jpg"/>
	</section>
	<aside class="span6 login_index hero-unit">
		<form method="post" action="LoginIngreso" class="formulario">
			<table>
				<tr><th><h3>Ingreso</h3></th><th></th></tr>
				<tr><td><label>Usuario:</label></td><td><input type="text" name="user"/></td></tr>
				<tr><td><label>Contrase&ntilde;a:</label></td><td><input type="password" name="pass"/></td></tr>
				<tr><td><input type="submit" class="btn btn-primary" value="Ingresar" /></td><td><a href="#" id="link_contrasenia">�se olvido su contrase�a?</a></td></tr>
			</table>
		</form>
		<c:if test="${requestScope.error != null}">
			<div class="alert alert-error in fade">
				${requestScope.error}
				<a class="close" data-dismiss="alert" href="#">&times;</a>		
			</div>
		</c:if>
	</aside>
	</div>
	</div>
	<footer class="span12 pie_index">
		<cite class="pull-right">Yoshitomi Maehara &amp; Liliana Gonzales</cite>
	</footer>
</div>	

</body>
</html>