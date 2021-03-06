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
	<form action="AlumnoAgregar" class="formulario_adptado" method="post">
		<label>Nombre</label><input type="text" name="nombre"/>
		<label>Apellidos</label><input type="text" name="apellido"/>
		<label>Universidad</label><input type="text" name="universidad"/>
		<label>Ciclo</label>
		<c:set var="ciclos" value="I,II,III,IV,V,VI,VII,VIII,IX,X,XI"></c:set>
		<select name="ciclo">
		<c:forTokens items="${ciclos}" delims="," var="ciclo">
		<option><c:out value="${ciclo}"></c:out></option>
		</c:forTokens>
		</select>
		<label>Fecha de Nacimiento</label><input type="date" name="fech_nac"/>
		<label>Creditos</label><input type="number" min="1" max="220" step="0.5" name="creditos"/>
		<label>A�o de Ingreso</label><input type="number" min="2000" max="2013" value="2013" name="anio_ingreso"/>
		<br/>
		<input type="submit" value="Insertar"/>
		<c:if test="${requestScope.confirmacion != null}">
			<div class="alert alert-success">
				<a class="close" data-dismiss="alert">&times;</a>
				${RequestScope.confirmacion}
			</div>
		</c:if>
	</form>
	<c:if test="${requestScope.error != null}">
		<div class="alert alert-error">
				<a class="close" data-dismiss="alert">&times;</a>	
				${requestScope.error}	
				
		</div>
	</c:if>
</body>
</html>