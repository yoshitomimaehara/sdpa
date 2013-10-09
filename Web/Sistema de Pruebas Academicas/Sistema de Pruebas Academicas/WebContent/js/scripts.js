/**
 * Nombre:script.js
 * Descripcion: Funciones JavaScript/JQuery
 * Autores:Yoshitomi Maehara/Liliana Gonzales
 * Email:
 */



$(document).ready(function(){
	$().alert();
});

$(function(){
	$('.accesos').click(function(e){
		e.preventDefault();
		$('#main').load($(this).attr('href'));	
	});
});

$(function(){
	$('.enlaces').click(function(e){
		e.preventDefault();
		$('#contenido').load($(this).attr('href'));	
	});
});
