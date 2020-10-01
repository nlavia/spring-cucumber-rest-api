#############################################
# Autor: Nicolás Lavía						#
# Fecha: 11/09/2020							#
#############################################
Feature: Pruebas de CMS/LEVEL 

Scenario Outline: #1 Se invoca al servicio /services/cms/level para HomeUser y se valida que devuelva carruseles. 

	Given el Endpoint <URI> 
	When Cuando Realizo GET de /services/cms/level 
		|device_category	|<DEVICE_CATEGORY>		   |
		|device_model		|<DEVICE_MODEL>			   |
		|device_type		|<DEVICE_TYPE>			   |
		|device_manufacturer|<DEVICE_MANUFACTURER>	   |
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
	And el cuerpo de la respuesta <PATH1> debe contener <VALOR1> 
	And el cuerpo de la respuesta <PATH2> debe contener <VALOR2> 
	And el cuerpo de la respuesta <PATH3> debe contener <VALOR3> 
	
	Examples: 
		|URI										  |DEVICE_CATEGORY  |DEVICE_MANUFACTURER|DEVICE_MODEL |DEVICE_TYPE|PATH1												   |VALOR1   	 |PATH2						      |VALOR2       |PATH3                                                   |VALOR3                 |
		|https://qro-microfwk-silo-web.clarovideo.net |web			    |web				|web		  |web		  |.response.modules.module[0].components.component[0].type|["Highlight"]|.response.modules.module[1].type|["carrousel"]|.response.modules.module[1].components.component[2].type|["Carrouselhorizontal"]|
		|https://qro-microfwk-silo-web.clarovideo.net |tv			    |hisense			|h5 		  |ott		  |.response.modules.module[0].components.component[0].type|["Highlight"]|.response.modules.module[1].type|["carrousel"]|.response.modules.module[1].components.component[2].type|["Carrouselhorizontal"]|
		|https://qro-microfwk-silo-web.clarovideo.net |stb			    |coship				|n9090		  |ott        |.response.modules.module[0].components.component[0].type|["Highlight"]|.response.modules.module[1].type|["carrousel"]|.response.modules.module[1].components.component[2].type|["Carrouselhorizontal"]|
		
		
		
Scenario Outline: #2 Se invoca al servicio /services/cms/level 

	Given el Endpoint <URI> 
	When Cuando Realizo GET de /services/cms/level 
		|device_category		|<DEVICE_CATEGORY>		    |
		|device_model			|<DEVICE_MODEL>			    |
		|device_type			|<DEVICE_TYPE>			    |
		|device_manufacturer	|<DEVICE_MANUFACTURER>	    |
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
	#And la respuesta debe ser un json valido
	And el cuerpo de la respuesta .response.groups debe existir 
	And el cuerpo de la respuesta .response.groups[0] debe existir 
	And el cuerpo de la respuesta .response.groups[0].id debe existir 
	And el cuerpo de la respuesta .response.groups[0].title debe existir 
	Examples: 
		|URI										  |DEVICE_CATEGORY  |DEVICE_MANUFACTURER|DEVICE_MODEL |DEVICE_TYPE|
		|https://qro-microfwk-silo-web.clarovideo.net |web			    |web				|web		  |web		  |
		|https://qro-microfwk-silo-web.clarovideo.net |tv			    |hisense			|h5 		  |ott		  |
		|https://qro-microfwk-silo-web.clarovideo.net |stb			    |coship				|n9090		  |ott        |
		
Scenario Outline: #3 Se invoca al servicio /services/cms/level para el nodo "pandg_noggin" y se valida que devuelva carruseles. 

	When Cuando Realizo GET de /services/cms/level 
		|device_category	|<DEVICE_CATEGORY>		   |
		|device_model		|<DEVICE_MODEL>			   |
		|device_type		|<DEVICE_TYPE>			   |
		|device_manufacturer|<DEVICE_MANUFACTURER>	   |
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
	And el cuerpo de la respuesta .response.modules.module es un array con longitud 4 
	
	Examples: 
		|URI										  |DEVICE_CATEGORY  |DEVICE_MANUFACTURER|DEVICE_MODEL |DEVICE_TYPE|
		|https://qro-microfwk-silo-web.clarovideo.net |web			    |web				|web		  |web		  |
		|https://qro-microfwk-silo-web.clarovideo.net |tv			    |hisense			|h5 		  |ott		  |
		|https://qro-microfwk-silo-web.clarovideo.net |stb			    |coship				|n9090		  |ott        |
		
		
		
		
