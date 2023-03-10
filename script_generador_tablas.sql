create schema practica_sql authorization nsopbmja;

--- Tabla Grupo Empresarial
create table practica_sql.grupo_empresarial(
	idgrupo_empresarial varchar(20) not null, --PK
	nombre_grupo_empresarial varchar(50) not null,
	constraint grupo_empresarial_PK primary key(idgrupo_empresarial)
);

---Tabla Marca
create table practica_sql.marca(
	idmarca varchar(20) not null, --PK
	nombre_marca varchar(50) not null,
	idgrupo_empresarial varchar(20) not null, --FK
	constraint marca_PK primary key(idmarca),
	constraint grupo_empresarial_FK foreign key(idgrupo_empresarial) references practica_sql.grupo_empresarial(idgrupo_empresarial)
);

-- Tabla Modelos
create table practica_sql.modelos(
	idmodelo varchar(20) not null, --PK
	nombre_modelo varchar(50) not null,
	idmarca varchar(20) not null, -- FK
	constraint modelos_PK primary key(idmodelo),
	constraint marca_FK foreign key(idmarca) references practica_sql.marca(idmarca)
);

-- Tabla Color
create table practica_sql.color(
	idcolor varchar(20) not null, -- PK
	color varchar(50) not null,
	constraint color_PK primary key(idcolor)
);

-- Tabla Moneda
create table practica_sql.moneda(
	idmoneda varchar(20) not null, -- PK
	tipo_moneda varchar(20) not null,
	constraint moneda_PK primary key(idmoneda)
);

-- Tabla Vehiculos

create table practica_sql.vehiculos(
	idvehiculo varchar(20) not null, --PK
	idmodelo varchar(50) not null, --FK
	idcolor varchar(20) not null, -- FK
	matricula varchar(20) not null, 
	numero_kilometros integer not null,
	fecha_compra date not null,
	constraint vehiculos_PK primary key(idvehiculo),
	constraint modelos_FK foreign key(idmodelo) references practica_sql.modelos(idmodelo),
	constraint color_FK foreign key(idcolor) references practica_sql.color(idcolor)
	
);


-- Tabla Revisiones
create table practica_sql.revisiones(
	idrevision varchar(20) not null, --PK
	idvehiculo varchar(20) not null, --PK,FK
	fecha_revision date not null,
	importe decimal not null,
	kilometros integer not null,
	idmoneda varchar(20) not null, --FK
	constraint revisiones_PK primary key(idrevision, idvehiculo),
	constraint moneda_FK foreign key(idmoneda) references practica_sql.moneda(idmoneda),
	constraint vehiculos_FK foreign key(idvehiculo) references practica_sql.vehiculos(idvehiculo)
);



-- Aseguradora
create table practica_sql.aseguradora(
	idaseguradora varchar(20) not null, -- PK
	nombre_aseguradora varchar(50) not null,
	constraint aseguradora_PK primary key(idaseguradora)
);

-- Poliza Seguro
create table practica_sql.poliza_seguro(
	idpoliza varchar(20) not null, --PK
	idvehiculo varchar(20) not null, --PK,FK
	idaseguradora varchar(20) not null, --FK
	fecha_alta date not null,
	fecha_baja date null,
	constraint poliza_seguro_PK primary key(idpoliza, idvehiculo),
	constraint aseguradora_FK foreign key(idaseguradora) references practica_sql.aseguradora(idaseguradora),
	constraint vehiculos_FK foreign key(idvehiculo) references practica_sql.vehiculos(idvehiculo)
);


-- INTRODUCCION DE DATOS

-- DATOS GRUPO EMPRESARIAL
insert into practica_sql.grupo_empresarial 
	(idgrupo_empresarial, nombre_grupo_empresarial)
values
	('001', 'Volkswagen'),
	('002', 'Toyota'),
	('003', 'Renault'),
	('004', 'Stellantis');

-- Datos Marca
insert into practica_sql.marca
	(idmarca, nombre_marca, idgrupo_empresarial)
values
	('001', 'Seat', '001'),
	('002', 'Toyota', '002'),
	('003', 'Nissan', '003'),
	('004', 'Citroen', '004'),
	('005', 'Fiat', '004');

-- Datos Modelo

insert into practica_sql.modelos
	(idmodelo, nombre_modelo, idmarca)
values
	('001', 'Ibiza', '001'),
	('002', 'Yaris', '002'),
	('003', 'Qasqai', '003'),
	('004', 'Cactus', '004'),
	('005', 'Panda', '004');

-- Datos Color
insert into practica_sql.color
	(idcolor, color)
values
	('001', 'Blanco'),
	('002', 'Negro'),
	('003', 'Gris'),
	('004', 'Verde'),
	('005', 'Rojo');

-- Datos Moneda
insert into practica_sql.moneda
	(idmoneda, tipo_moneda)
values
	('001', 'Euro'),
	('002', 'Dolar'),
	('003', 'Rupia'),
	('004', 'Franco'),
	('005', 'Peso mexicano');

-- Datos Vehiculo

insert into practica_sql.vehiculos
	(idvehiculo, idmodelo, idcolor, matricula, numero_kilometros, fecha_compra)
values
	('001', '001', '001', '9814LFL', '46800', '2020, 02, 12'),
	('002', '002', '002', '9427LGF', '50200', '2019, 06, 17'),
	('003', '003', '003', '1426YGF', '20200', '2012, 08, 25'),
	('004', '004', '004', '2425JFY', '60200', '2015, 10, 28'),
	('005', '005', '005', '1622HDA', '10300', '2022, 01, 10');

-- Datos Revisiones
insert into practica_sql.revisiones
	(idrevision, idvehiculo, fecha_revision, importe, kilometros, idmoneda)
values
	('001', '001', '2023, 02, 12', '40.20', '50200', '001'),
	('002', '002', '2023, 08, 15', '45.20', '55200', '002'),
	('003', '003', '2023, 06, 20', '40.50', '30500', '003'),
	('004', '004', '2023, 01, 17', '50.70', '70600', '004'),
	('005', '005', '2023, 10, 11', '30.20', '20400', '005');

-- Datos Aseguradora 
insert into practica_sql.aseguradora
	(idaseguradora, nombre_aseguradora)
values
	('001', 'Mapfre'),
	('002', 'Ama'),
	('003', 'Allianz'),
	('004', 'Mutua Madrile??a'),
	('005', 'AXA');

-- Datos Poliza Seguro
insert into practica_sql.poliza_seguro
	(idpoliza, idvehiculo, idaseguradora, fecha_alta, fecha_baja)
values
	('001', '001', '001', '2020, 02, 10', NULL),
	('002', '002', '002', '2019, 06, 15', NULL),
	('003', '003', '003', '2012, 08, 22', NULL),
	('004', '004', '004', '2015, 10, 26', NULL),
	('005', '005', '005', '2022, 01, 08', '2023, 02, 01');
