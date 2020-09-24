#############################################
# Autor: Nicolás Lavía						#
# Fecha: 11/09/2020							#
#############################################
Feature: Prueba de las Api de CMS 

Background: Se apunta a la particion especificada 
	Given el Endpoint https://qro-microfwk-silo-tv.clarovideo.net 



Scenario: #1 Se invoca al servicio /services/cms/level para HomeUser y se valida que devuelva carruseles. 

	When Cuando Realizo GET de /services/cms/level
		|device_category	|web					   |
		|device_model		|web					   |
		|device_type		|web					   |
		|device_manufacturer|generic				   |
		|authpn				|webclient				   |
		|authpt				|tfg1h3j4k6fd7			   |
		|cache				|refresh				   |
		|format				|json					   |
		|HKS				|03nevr0ti0l7bqcufpi0o9bch3|
		|isCacheable		|true					   |
		|tenant_code		|clarovideo				   |
		|type				|nav                       |
		|node				|homeuser		           |
		|api_version		|v5.92                     |
		|region				|mexico                    |
		
	Then obtengo codigo de respuesta 200 
	And la respuesta debe ser un json valido
	And el cuerpo de la respuesta .response.modules.module[0].components.component[0].type debe contener ["Highlight"] 
	And el cuerpo de la respuesta .response.modules.module[1].type debe contener ["carrousel"]
	And el cuerpo de la respuesta .response.modules.module[1].components.component[2].type debe contener ["Carrouselhorizontal"]


Scenario: #2 Se invoca al servicio /services/cms/level se obtiene un

	When Cuando Realizo GET de /services/cms/level
		|device_category		|web	  					|
		|device_model			|web	  					|
		|device_type			|web	  					|
		|device_manufacturer    |generic  					|
		|authpn					|webclient					|
		|authpt					|tfg1h3j4k6fd7				|
		|cache					|refresh  					|
		|format					|json     					|
		|HKS					|03nevr0ti0l7bqcufpi0o9bch3 |
		|isCacheable			|true     					|
		|tenant_code			|clarovideo					|
		|type					|nav						|
		|node					|homeuser					|
		|api_version			|v5.92						|
		|region					|mexico						|
		
	Then obtengo codigo de respuesta 200 
	And almaceno la respuesta de .response.modules.module[1].components.component[2].properties.url como UrlVariable en variable de escenario
	And Cuando Realizo GET de UrlVariable
	|device_category		|web	  					|
	|device_model			|web	  					|
	|device_type			|web	  					|
	|device_manufacturer    |generic  					|
	|authpn					|amco						|
	|authpt					|12e4i8l6a581a				|
	Then obtengo codigo de respuesta 200 	
	And la respuesta debe ser un json valido
	And el cuerpo de la respuesta .response.groups debe existir 
	And el cuerpo de la respuesta .response.groups[0] debe existir 
	And el cuerpo de la respuesta .response.groups[0].id debe existir 
	And el cuerpo de la respuesta .response.groups[0].title debe existir 
	
@current
Scenario: #3 Se invoca al servicio /services/cms/level para el nodo "pandg_noggin" y se valida que devuelva carruseles. 

	When Cuando Realizo GET de /services/cms/level
		|device_category	|web					   |
		|device_model		|web					   |
		|device_type		|web					   |
		|device_manufacturer|generic				   |
		|authpn				|webclient				   |
		|authpt				|tfg1h3j4k6fd7			   |
		|cache				|refresh				   |
		|format				|json					   |
		|HKS				|03nevr0ti0l7bqcufpi0o9bch3|
		|isCacheable		|true					   |
		|tenant_code		|clarovideo				   |
		|type				|nav                       |
		|node				|pandg_noggin              |
		|api_version		|v5.92                     |
		|region				|mexico                    |
		
	Then obtengo codigo de respuesta 200 
	And la respuesta debe ser un json valido
	And el cuerpo de la respuesta .response.modules.module[0].name debe existir 
	And el cuerpo de la respuesta .response.modules.module[0].name debe contener ["Superdestacados"] 
	And el cuerpo de la respuesta .response.modules.module[1].name debe contener ["Continua-viendo"] 
	And el cuerpo de la respuesta .response.modules.module[2].name debe contener ["Lo-Mejor"] 
	And el cuerpo de la respuesta .response.modules.module[3].name debe contener ["Y-sigue-la-diversion"] 
	And el cuerpo de la respuesta .response.modules.module[4].name debe contener ["Lo-mas-visto"] 
	And el cuerpo de la respuesta .response.modules.module es un array
	#And el cuerpo de la respuesta .response.modules.module es un array con longitud 4







		
