#############################################
# Autor: Nicolás Lavía						#
# Fecha: 11/09/2020							#
#############################################
Feature: Pruebas de Service/Nav


Scenario Outline: #1 Se invoca al servicio /services/nav/ y se valida que devuelva la estructura de nodos 

Given el Endpoint <URI> 
	When Cuando Realizo GET de /services/nav/data 
		|device_category	|<DEVICE_CATEGORY>				  |
		|device_model		|<DEVICE_MODEL>			  		  |
		|device_type		|<DEVICE_TYPE>			          |
		|device_manufacturer|<DEVICE_MANUFACTURER>	          |
		|region				|costarica						  |
		|api_version		|5.82							  |
		|format				|json							  |
		|authpn				|amco						  	  |
		|authpt				|12e4i8l6a581a					  |
		|HKS				|(e201a2e2e72ffe25d066e13c2f175d75|
		|tenant_code		|clarovideo						  |
		|type				|epg							  |
		
	Then obtengo codigo de respuesta 200
	And almaceno la respuesta de .response.nodes como Nodos en variable de escenario
	
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
	
Examples:
|URI										 |DEVICE_CATEGORY|DEVICE_MANUFACTURER|DEVICE_MODEL|DEVICE_TYPE  |
|https://qro-microfwk-silo-web.clarovideo.net|web			 |web			     |web		  |web		    |


Scenario Outline: #2 Se invoca al servicio /services/nav/ Se obtienen nodos y se realiza el llamado a CMS level usando los nodos

Given el Endpoint <URI>
	When Cuando Realizo GET de /services/nav/data 
		|device_category	|<DEVICE_CATEGORY>				  |
		|device_model		|<DEVICE_MODEL>			  		  |
		|device_type		|<DEVICE_TYPE>			          |
		|device_manufacturer|<DEVICE_MANUFACTURER>	          |
		|region				|costarica						  |
		|api_version		|5.82							  |
		|format				|json							  |
		|authpn				|amco						  	  |
		|authpt				|12e4i8l6a581a					  |
		|HKS				|(e201a2e2e72ffe25d066e13c2f175d75|
		|tenant_code		|clarovideo						  |
		|type				|epg							  |
		
	Then obtengo codigo de respuesta 200
	And almaceno la respuesta de .response.nodes como Nodos en variable de escenario
	
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

Examples:
|URI										 |DEVICE_CATEGORY|DEVICE_MANUFACTURER|DEVICE_MODEL|DEVICE_TYPE  |
|https://qro-microfwk-silo-web.clarovideo.net|web			 |web			     |web		  |web		    |