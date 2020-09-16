#############################################
# Autor: Nicolás Lavía						#
# Fecha: 11/09/2020							#
#############################################
Feature: Prueba de las Api de CMS 

Background: Se apunta a la particion especificada 
	Given el Endpoint https://qro-microfwk-silo-tv.clarovideo.net 
	
Scenario: 1 Se invoca al servicio /services/nav/ y se valida que devuelva la estructura de nodos 

	When Realizo GET /services/nav/data?device_category=web&device_model=web&device_type=web&device_manufacturer=generic&region=costarica&api_version=v5.82&format=json&authpn=amco&authpt=12e4i8l6a581a&HKS=(e201a2e2e72ffe25d066e13c2f175d75&tenant_code=clarovideo&type=epg 
	Then obtengo codigo de respuesta 200 
	And el cuerpo de la respuesta .response.nodes debe existir
	And el cuerpo de la respuesta .response.nodes.id debe existir
	And el cuerpo de la respuesta .response.nodes.id_parent debe existir
	And el cuerpo de la respuesta .response.nodes.code debe existir
	And el cuerpo de la respuesta .response.nodes.text debe existir
	And el cuerpo de la respuesta .response.nodes.menu_id debe existir
	And el cuerpo de la respuesta .response.nodes.image debe existir
	And el cuerpo de la respuesta .response.nodes.image_over debe existir
	And el cuerpo de la respuesta .response.nodes.level debe existir
	And el cuerpo de la respuesta .response.nodes.type debe existir
	And el cuerpo de la respuesta .response.nodes.order debe existir
	And el cuerpo de la respuesta .response.nodes.status debe existir
	And el cuerpo de la respuesta .response.nodes.app_behaviour debe existir
	
	
	
	
	Scenario: 2 Se invoca al servicio /services/cms/level y se valida que devuelva carruseles. 
	
		When Realizo GET /services/cms/level?device_category=web&device_model=web&device_type=web&device_manufacturer=generic&authpn=webclient&authpt=tfg1h3j4k6fd7&cache=refresh&format=json&HKS=03nevr0ti0l7bqcufpi0o9bch3&isCacheable=true&tenant_code=clarovideo&type=nav&node=pandg_noggin&api_version=v5.92&region=mexico 
		Then obtengo codigo de respuesta 200 
		And el cuerpo de la respuesta .response.modules.module.name debe existir
		And el cuerpo de la respuesta .response.modules.module[1].name debe contener Superdestacados
		And el cuerpo de la respuesta debe contener Superdestacados 
		#   And almaceno la URL de service/content/ para el filtro1
		And el cuerpo de la respuesta debe contener Continua-viendo 
		#   And almaceno la URL de service/content/ para el filtro2
		And el cuerpo de la respuesta debe contener Lo-Mejor 
		#   And almaceno la URL de service/content/ para el filtro3
		And el cuerpo de la respuesta debe contener Y-sigue-la-diversion 
		#   And almaceno la URL de service/content/ para el filtro3
		And el cuerpo de la respuesta debe contener Lo-mas-visto 
		#   And almaceno la URL de service/content/ para el filtro4
	
	#Scenario: 3 Se invoca al servicio /services/cms/carrousel y se valida que obtengamos contenidos.
	#	
	#	Given obtengo los filtros almacenados para filtro1 
	#	When Realizo GET /services/cms/carrousel?device_category=web&device_model=web&device_type=web&device_manufacturer=generic&order_way=ASC&order_id=50&filter_id=39736&region=mexico&format=json&authpn=webclient&authpt=tfg1h3j4k6fd7&api_version=6&quantity=499
	#	Then obtengo codigo de respuesta 200
	#	And la respuesta debe contener x contenidos
	#	Given obtengo los filtros almacenados para filtro1 
	#	When Realizo GET /services/cms/carrousel?device_category=web&device_model=web&device_type=web&device_manufacturer=generic&order_way=ASC&order_id=50&filter_id=39736&region=mexico&format=json&authpn=webclient&authpt=tfg1h3j4k6fd7&api_version=6&quantity=499
	#	Then obtengo codigo de respuesta 200
	#	And la respuesta debe contener x contenidos
	#	Given obtengo los filtros almacenados para filtro1 
	#	When Realizo GET /services/cms/carrousel?device_category=web&device_model=web&device_type=web&device_manufacturer=generic&order_way=ASC&order_id=50&filter_id=39736&region=mexico&format=json&authpn=webclient&authpt=tfg1h3j4k6fd7&api_version=6&quantity=499
	#	Then obtengo codigo de respuesta 200
	#	And la respuesta debe contener x contenidos
	#	Given obtengo los filtros almacenados para filtro1 
	#	When Realizo GET /services/cms/carrousel?device_category=web&device_model=web&device_type=web&device_manufacturer=generic&order_way=ASC&order_id=50&filter_id=39736&region=mexico&format=json&authpn=webclient&authpt=tfg1h3j4k6fd7&api_version=6&quantity=499
	#	Then obtengo codigo de respuesta 200
	#	And la respuesta debe contener x contenidos
	
