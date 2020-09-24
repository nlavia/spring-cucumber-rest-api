#############################################
# Autor: Nicolás Lavía						#
# Fecha: 11/09/2020							#
#############################################
Feature: Prueba de las Api de CMS 

Background: Se apunta a la particion especificada 
	Given el Endpoint https://qro-microfwk-silo-tv.clarovideo.net 
	

Scenario: #1 Se invoca al servicio /services/nav/ y se valida que devuelva la estructura de nodos 

	When Cuando Realizo GET de /services/nav/data 
		|device_category	|web							  |
		|device_model		|web							  |
		|device_type		|web							  |
		|device_manufacturer|generic						  |
		|region				|costarica						  |
		|api_version		|5.82							  |
		|format				|json							  |
		|authpn				|amco						  	  |
		|authpt				|12e4i8l6a581a					  |
		|HKS				|(e201a2e2e72ffe25d066e13c2f175d75|
		|tenant_code		|clarovideo						  |
		|type				|epg							  |
		
	Then obtengo codigo de respuesta 200
	And la respuesta debe ser un json valido
	And el cuerpo de la respuesta .response.nodes debe existir 
	And el cuerpo de la respuesta .response.nodes[0].id debe existir 
	And el cuerpo de la respuesta .response.nodes[0].id_parent debe existir 
	And el cuerpo de la respuesta .response.nodes[0].code debe existir 
	And el cuerpo de la respuesta .response.nodes[0].text debe existir 
	And el cuerpo de la respuesta .response.nodes[0].menu_id debe existir 
	And el cuerpo de la respuesta .response.nodes[0].image debe existir 
	And el cuerpo de la respuesta .response.nodes[0].image_over debe existir 
	And el cuerpo de la respuesta .response.nodes[0].level debe existir 
	And el cuerpo de la respuesta .response.nodes[0].type debe existir 
	And el cuerpo de la respuesta .response.nodes[0].order debe existir 
	And el cuerpo de la respuesta .response.nodes[0].status debe existir 
	And el cuerpo de la respuesta .response.nodes[0].app_behaviour debe existir 
	
