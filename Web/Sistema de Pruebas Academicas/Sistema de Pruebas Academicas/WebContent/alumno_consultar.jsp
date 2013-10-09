
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" type="text/css" href="css\styles.css"/>
<link rel="stylesheet" href="css\bootstrap.min.css">
<script src="js\jquery.js"></script>
<script src="js\scripts.js"></script>

</head>
<body>
	<form action="AlumnoConsultar" method="post" class="formulario_adptado">
	<label>Ingrese el Codigo</label><input type="text" name="idAlumno"/>
	<br/>
	<input type="button" name="BtnConsultar" value="Consultar"/>
	</form>
	<c:if test="${requestScope.error != null}">
		<table border=1>
		<tr><th>CodAlumno</th><th>Nombre</th><th>Apellidos</th><th>Ciclo</th><th>Universidad</th><th>Fecha Nacimiento</th><th>Creditos</th><th>A�o Ingreso</th></tr>
		<tr><td><c:out value="${requestScope.alumno.getCodalumno()}"></c:out></td><td>al.getNombre()</td><td>al.getApellido()</td><td>al.getCiclo()</td><td>al.getUniversidad()</td><td>al.getFech_nac()</td><td>al.getCreditos()</td><td>al.getA�o_ingreso()</td></tr>
		</table>
	</c:if>
</body>
</html>