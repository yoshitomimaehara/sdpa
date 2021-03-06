
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
	<form action="CursoConsultar" method="post" class="formulario_adptado">
	<label>Ingrese el Codigo</label><input type="text" name="codcurso"/>
	<br/>
	<input type="submit" value="Consultar"/>
	<br/>
	<c:if test="${requestScope.cur != null}">	
		<br/>
		<br/>
		<table border=1>
		<tr><th>CodCurso</th><th>Nombre</th><th>Ciclo</th><th>Creditos</th></tr>
		<tr>
			<td><c:out value="${requestScope.cur.getCodcurso()}"></c:out></td>
			<td><c:out value="${requestScope.cur.getNombre()}"></c:out></td>
			<td><c:out value="${requestScope.cur.getCiclo()}"></c:out></td>
			<td><c:out value="${requestScope.cur.getCreditos()}"></c:out></td>
		</tr>
		</table>
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