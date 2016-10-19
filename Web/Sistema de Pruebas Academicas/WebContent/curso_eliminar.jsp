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
	<form action="CursoEliminar" method="post">
		<label>Ingrese el Codigo</label><input type="text" name="codcurso"/>
		<input type="submit" value="Eliminar">
	</form>
	<c:if test="${requestScope.error != null}">
		<div class="alert alert-error">
				<a class="close" data-dismiss="alert">&times;</a>	
				${requestScope.error}	
				
		</div>
	</c:if>
</body>
</html>