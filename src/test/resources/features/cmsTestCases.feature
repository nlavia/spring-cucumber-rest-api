#############################################
# Autor: Nicolás Lavía						#
# Fecha: 11/09/2020							#
#############################################
Feature: Prueba de las Api de CMS 

Background: Se apunta a la particion especificada 
	Given el Endpoint https://qro-microfwk-silo-tv.clarovideo.net 
	
 
Scenario: #1 Se invoca al servicio /services/nav/ y se valida que devuelva la estructura de nodos 

	When Realizo GET de /services/nav/data con parametros 
	|device_category|device_model|device_type|device_manufacturer|region   |api_version|format|authpn|authpt	   |HKS                              |tenant_code|type|
	|web			|web		 |web		 |generic            |costarica|5.82       |json  |amco  |12e4i8l6a581a|(e201a2e2e72ffe25d066e13c2f175d75|clarovideo |epg |
	
	Then obtengo codigo de respuesta 200 
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
	

Scenario: #2 Se invoca al servicio /services/cms/level y se valida que devuelva carruseles. 

	When Realizo GET de /services/cms/level con parametros
	|device_category|device_model|device_type|device_manufacturer|authpn   |authpt       |cache  |format|HKS                       |isCacheable|tenant_code|type|node            |api_version|region|
	|web			|web		 |web		 |generic            |webclient|tfg1h3j4k6fd7|refresh|json  |03nevr0ti0l7bqcufpi0o9bch3|true       |clarovideo |nav |pandg_noggin    |v5.92      |mexico|

	Then obtengo codigo de respuesta 200 
	And el cuerpo de la respuesta .response.modules.module[0].name debe contener ["Superdestacados"] 
	And el cuerpo de la respuesta .response.modules.module[1].name debe contener ["Continua-viendo"] 
	And el cuerpo de la respuesta .response.modules.module[2].name debe contener ["Lo-Mejor"] 
	And el cuerpo de la respuesta .response.modules.module[3].name debe contener ["Y-sigue-la-diversion"] 
	And el cuerpo de la respuesta .response.modules.module[4].name debe contener ["Lo-mas-visto"] 
	
	
@wip @current
Scenario: #3 Se invoca al servicio /services/cms/carrousel

	When Realizo GET de /services/cms/level con parametros
	|device_category|device_model|device_type|device_manufacturer|authpn   |authpt       |cache  |format|HKS                       |isCacheable|tenant_code|type|node            |api_version|region|
	|web			|web		 |web		 |generic            |webclient|tfg1h3j4k6fd7|refresh|json  |03nevr0ti0l7bqcufpi0o9bch3|true       |clarovideo |nav |pandg_noggin    |v5.92      |mexico|
	Then obtengo codigo de respuesta 200 
	And I store the value of body path .response.modules.module[2].components.component[2].properties.url as url in scenario scope
	And Realizo GET de /services/cms/carrousel con parametros
	|device_category|device_model|device_type|device_manufacturer|order_way|order_id|filter_id|region|format|authpn	  |authpt		|api_version| quantity|
	|web			|web		 |web		 |generic			 |ASC	   |50		|url      |mexico|json  |webclient|tfg1h3j4k6fd7|6			|499	  |
 	And value of scenario variable (.*) should be (.*)
	Then obtengo codigo de respuesta 200 

	
