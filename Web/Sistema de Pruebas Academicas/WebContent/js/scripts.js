/**
 * Nombre:script.js
 * Descripcion: Funciones JavaScript/JQuery
 * Autores:Yoshitomi Maehara/Liliana Gonzales
 * Email:
 */

$().alert();

$(function(){
	$('.accesos').click(function(e){
		e.preventDefault();
		$('#main').load($(this).attr('href'));	
	});

	$('.enlaces').click(function(e){
		e.preventDefault();
		$('#contenido').load($(this).attr('href'));	
	});
	
	
});
