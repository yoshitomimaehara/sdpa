<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css\styles.css"/>
<link rel="stylesheet" href="css\bootstrap.min.css">
<script src="js\jquery.js"></script>
<script src="js\scripts.js"></script>

</head>
<body>
	<form action="CursoAgregar" method="post">
		<label>Nombre</label><input type="text" name="nombre"/>
		<label>Ciclo</label>
		<c:set var="ciclos" value="I,II,III,IV,V,VI,VII,VIII,IX,X,XI"></c:set>
		<select name="ciclo">
		<c:forTokens items="${ciclos}" delims="," var="ciclo">
		<option><c:out value="${ciclo}"></c:out></option>
		</c:forTokens>
		</select>
		<label>Creditos</label><input type="number" min="1" max="5" step="0.5" name="creditos"/>
		<input type="submit" value="agregar"/>
	</form>
</body>
</html>