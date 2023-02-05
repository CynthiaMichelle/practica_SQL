select
	modelos.nombre_modelo,
	marcas.nombre_marca,
	grupo_empresarial.nombre_grupo_empresarial,
	vehiculos.fecha_compra,
	vehiculos.matricula,
	color.color,
	vehiculos.numero_kilometros,
	aseguradora.nombre_aseguradora,
	poliza_seguro.idpoliza as numero_poliza
from 
	practica_sql.vehiculos as vehiculos
join --- Traemos columna de modelos
	practica_sql.modelos as modelos
on
	modelos.idmodelo = vehiculos.idmodelo

join -- Traemos columna de marca
	practica_sql.marca as marcas
on
	marcas.idmarca = modelos.idmarca
	
join -- Traemos columna grupo empresarial
	practica_sql.grupo_empresarial as grupo_empresarial
on
	grupo_empresarial.idgrupo_empresarial = marcas.idgrupo_empresarial

join -- Traemos columna color
	practica_sql.color as color
on
	color.idcolor = vehiculos.idcolor

join -- Traemos columna poliza 
	practica_sql.poliza_seguro as poliza_seguro
on
	poliza_seguro.idvehiculo = vehiculos.idvehiculo

join -- Traemos columna aseguradora 
	practica_sql.aseguradora as aseguradora
on
	aseguradora.idaseguradora = poliza_seguro.idaseguradora
