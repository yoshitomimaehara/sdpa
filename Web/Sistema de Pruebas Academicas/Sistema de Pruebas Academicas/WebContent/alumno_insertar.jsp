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
	<form class="formulario_adptado">
		<label>Nombre</label><input type="text" />
		<label>Apellidos</label><input type="text"/>
		<label>Universidad</label><input type="text"/>
		<label>Ciclo</label>
		<c:set var="ciclos" value="I,II,III,IV,V,VI,VII,VIII,IX,X,XI"></c:set>
		<select>
		<c:forTokens items="${ciclos}" delims="," var="ciclo">
		<option><c:out value="${ciclo}"></c:out></option>
		</c:forTokens>
		</select>
		<label>Fecha de Nacimiento</label><input type="date"/>
		<label>Creditos</label><input type="number" min="1" max="220" step="0.5"/>
		<label>A�o de Ingreso</label><input type="number" min="2000" max="2013" value="2013"/>
		<br/>
		<input type="button" value="Insertar" class="btn"/>
	</form>
</body>
</html>