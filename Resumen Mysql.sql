# Tablas Relacionales: relaciones 1 a 1 (1:1), relaciones 1 a muchos (1:n), relaciones muchos a muchos (n:m)
#--Relaciones (1:1) = por ejemplo una persona y un rut, una persona puede solo tener un rut y un rut solo puede tener una persona
#--Relaciones (1:n) = por ejemplo una persona y boletas, una persona puede tenre varias boletas, pero una boleta solo tiene a una persona.
#--Relaciones (n:m) = Por ejemplo Asignatura y profesores, Una asignatura puede ser dictada por diferentes profesores y un profesor dictar varias asignaturas.

# Buenas practicas : Todas las tablas sin exepcion tiene que tener un ID autoincrementable unico
#					 Todas las tablas tiene que tener una primary key 
#                    El nombre de las tablas la primera letra puede ir con mayuscula 
#                    Los atributos de cada tabla van en minuscula 
#                    Tablas relacionales son por lo general las que son muchos a muchos 

#Foreing Key = son las que hacen que las relaciones tengan sentido , estans hacen relacion a la tabla que la asocian
#              La foreign key (FK( de una tabla es la Primary kay (PK) de otra tabla
#              Por ejemplo: Cliente puede tener mas de una boleta
#                           Boleta no puede tener mas de un cliente
#                           Por lo tanto la foreingkey iria en la tabla boleta

#-------------- Tipos De Variables------------------------------
# ---- Tipos de datos numericos -------- 
# 1- Tinyint = -128 a 127 
# 2- Integer = -2147483648 a 2147483647
# 3- Smallint = -32768 a 32767
# 4- Mediumint = -8388608 a 8388607
# 5- Bigint = -9223372036854775808 a 9223372036854775807
# 6- Float (M,D) = (-3.402 823 466 E + 38,1.175 494 351 E-38), 0, (1.175 494 351 E-38,3.402 823 466 351 E + 38)
# 7- Double (M,D) = (1.797 693 134 862 315 7 E + 308,2.225 073 858 507 201 4 E-308), 0, (2.225 073 858 507 201 4 E-308,1.797 693 134 862 315 7 E + 308)
# 8- Decimal (M,D) = 

# ---- Tipo de Cadena -------- 
# 1- Char (M) = Sirve para guardar textos breves (De 1 a 255 caracteres)
# 2- Varchar (M) = El largo del texto depende de la información que brinda el usuario. (65535 caracteres)
# 3- Blob = (Objetos Grandes Binarios) para almacenar imágenes, sonido y archivos.
#    3.1- Tinyblob = 255 bytes
#	 3.2- Blob = 65535 bytes
#	 3.3- Mediumblob = 16777215 bytes
#	 3.4- Longblob = 4 GB
# 4- Text = Empleado para guardar grandes cantidades de texto como blogs, noticias, comentarios, publicaciones
#	 4.1 Tinytext = 255 bytes
#	 4.2 Text = 65535 bytes
#	 4.3 Mediumtext = 16777215 bytes
#	 4.4 Longtext = 4294967295 bytes
# 5- Enum
# 6- Set
#
# ---- Tipo fecha y hora -------- 
# 1- Date = AAAA-MM-DD
# 2- Datetime = AAAA-MM-DD HH:MM:SS
# 3- Timestamp = YYYY-MM-DD HH:MM:SS
# 4- Time = HH:MM:SS
# 5- Year = AA o AAAA
#
#-----------Ahora comenzaremos con un ejercicio basico ------------
#
# 1- Creamos un schema = se puede hacer de dos formas 
#                        CREATE SCHEMA nombre; o CREATE DATABASE nombre;
# 2- Le indicamos que usaremos ese esquema  = USE nombre; 
#		use se le hace rayito cada vez que abrimos el archivo para indicarle que usaremos este

CREATE SCHEMA resumen;
USE resumen;

# 3- Crear tablas = CREATE TABLE Nombre ()
#					Dentro de los parentesis van los atributos que tendra 
# 4- Atributos = nombre tipodevariable;
#				 Lo que va dentro del parentesis de varchar es la cantidad de caracteres que soporta
#				 Las primary key tiene dos formas de declararse una como en tabla equipo o como e tabla estudiantes
#				 se sepran por comas los tipos de atributos o datos, pero hasta el penultimo
create table equipos (
	equipo_id INTEGER primary key auto_increment not null,
	nombre_proyecto VARCHAR(30),
	integrantes INTEGER
);
create table estudiantes (
	estudiante_id  INTEGER auto_increment not null,
	nombre VARCHAR(15),
	apellido VARCHAR(15),
	equipo_id INTEGER,
 	primary key (estudiante_id),
 	foreign key (equipo_id) references equipos (equipo_id) 
    ); 
    
# Con esto se puede agregar lo que se me olvido en alguna tabla =
#           ALTER TABLE Boleta ADD cliente_id INTEGER NOT NULL;

# Crear las relaciones utilizando las foreign key, se pueden hacer dentro o fuera de las tablas
# 			ALTER TABLE Boleta
#			ADD FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id);

# Como borrar una columna de una tabla ya creada
#			ALTER TABLE Cliente DROP COLUMN correo;

# Renombrar una columna de una tabla ya creada
#			ALTER TABLE Cliente RENAME COLUMN medioPago TO medioDePago

# como eliminar una tabla =
#       primero hay que eliminar las relaciones que existan con esa tabla 
#       luego borrar la tabla
#		ALTER TABLE Boleta DROP CONSTRAINT boleta_ibfk_1;
#		DROP TABLE Cliente CASCADE;

# Como insertar datos 
#		INSERT INTO Cliente (nombre, direccion, correo, medioPago, valoracion, rutCliente)
#		VALUES ("isa", "calle123","isa@gmail.com", "efectivo", 5 , "19289851-3");
#		INSERT INTO Cliente (nombre, direccion, correo, medioPago, valoracion, rutCliente)
#		VALUES ("diego", "calle127","diego@gmail.com", "credito", 4 , "19289851-7");

# Como editar datos de la tabla
#		se puede editar mas de un dato poniendolo para el lado ej "isa123@gmail.com", medioPago = "credito"
#		UPDATE Cliente
#		SET correo = "isa123@gmail.com"
#		WHERE cliente_id = 3;

# Me trae todos los datos que existen en la tabla
#		SELECT * FROM Cliente;

# Me trae datos especificos de la tabla
#		SELECT Cliente.nombre, Cliente.medioPago FROM Cliente;

# Como elimino las cosas
#		DELETE FROM Cliente WhERE cliente_id = 3;

# 		edit + preference + sql editor + saco safe to no se que + ok

insert into equipos (nombre_proyecto, integrantes) values ("Carnet de mascotas", 5),
("Scroom", 5),
("Fenoseri", 5),
("Codigo Felipito", 5),
("Femcode", 5),
("Contigo Aprendo", 5),
("Chicas Superpoderosas", 5),
("Tierra de Estrellas", 5)
;

insert into estudiantes (nombre, apellido, equipo_id) values ("Brandon", "López", 3),
("Camila", "Berríos", 8),
("Carolina", "Zúñiga", 5),
("Daniela", "Corral", 1),
("Daniela",	"Gómez", 1),
("Daniela", "Rivas", 8),
("Danissa", "Caballero", 6),
("Diana", "Gutiérrez", 3),
("Diego", "Álvarez", 8),
("Diego", "Pérez", 2),
("Elvis", "Pérez", 4),
("Fabián", "Tobar", 3),
("Fabián", "Zúñiga", 8),
("Felipe", "Bray", 7),
("Felipe", "Mandiola", 4),
("Felipe", "Messina", 6),
("Fernanda", "Bahamondes", 3),
("Francis", "Vergara", 2),
("Gissele", "Gatica", 7),
("Isabella", "Parry", 2),
("Javiera", "Muñóz", 8),
("Javiera", "Sepúlveda", 5),
("Jesús", "Garland", 4),
("Juan Pablo", "Mora", 7),
("Juan Pablo", "Rivas", 7),
("Karen", "Rodríguez", 7),
("Lorenzo", "Fachinetti", 3),
("María", "Pino", 2),
("María José", "Paillavil", 6),
("Nicolás", "Aravena", 1),
("Sebastián", "Castillo", 6),
("Seigi", "Gim", 5),
("Susana", "Henríquez", 1),
("Tamara", "Aguilar", 4),
("Valeria", "Álvarez", 4),
("Víctor", "Caro", 5),
("Yago", "Ellen", 2),
("Yatamis", "Spolman", 1),
("Yerko", "Medina", 5),
("Yesenia", "Quiroz", 6);

SELECT * FROM estudiantes;
SELECT * FROM equipos;

# Para que me traiga datos especificos de un lado que yo quiero se usa where el donde por equipo
# traeme nombre y apellido, de la tabla estudiantes del equipo 3 
SELECT nombre, apellido
FROM Estudiantes
WHERE equipo_id = 3;

# Traeme nombre y apellido de la tabla estudiantes de nombre que termine con a 
#que terminen con la letra a ( el % seria un como)
#el like se usa con string 
SELECT nombre, apellido
FROM Estudiantes
WHERE nombre like "%a";

# ta% parte con ta y termina con cualquier cosa
# %ta párte con cualquier cosa y termina con ta 
# %ta% parte cy termina con cualquier cosa pero en alguna parte tiene ta 

# Buscar nombre iguales 
SELECT nombre, apellido
FROM Estudiantes
WHERE nombre = "Felipe";

#and añade otra condicion mas por tanto podemos ponerle condiciones y usar and ,or, in 
# "%ss%" esto es para poder filtrar 
# traeme nombre y apellido de la tabla estudiante donde el nombre tenga doble ss o doble ll 
SELECT nombre, apellido
FROM Estudiantes
WHERE nombre LIKE "%ss%"
OR nombre LIKE "%ll%";

#le estamos diciendo que busque en nombre con in condiciones
#traeme nombre y apellido de la tabla estudiantes donde nombre sea igual a felipe, fabian, daniela
SELECT nombre, apellido
FROM Estudiantes
WHERE nombre IN ("Felipe" , "Fabian","Daniela");

#este no lo entendi del todo
SELECT nombre, apellido
FROM Estudiantes
WHERE nombre  BETWEEN 6 AND 10;

#------------------------JOINS--------------------------------
# Los join son consultas para poder enlazar tablas
# Tipos de join = 
#			1- Inner join
#			2- Lefct join
#			3- Right Join
#			4- Crossjoin

#INNER JOIN = ME TRAE SOLAMENTE LO QUE TIENEN EN COMUN, EL RESTO LO EXCLUYE

#LEFT JOIN = ME TRAE TODA LA TABLA 1 Y LO QUE TIENEN EN COMUN, PERO EXCLUYE A LA TABLA2

#RIGHT JOIN = TRAE TODO LO DE LA TABLA2 Y LO QUE TIENEN EN COMUN, PERO EXCLUYE A LA TABLA 1

#CROSSJOIN = ES EL MENOS USADO PERO SE SUPONE QUE TRAE TODO DE TODO MAS LO QUE TIENEN EN COMUN 

# En esta parte le estoy diciendo que de estudiante me traiga nombre, de estudianteme traiga apellido y de equipo me traiga nombre de proyecto
#traeme de la tabla estudiante nombre, apellido y el nombre del proyecto

# con el join  le digo que de estudiantes y de quipos me los vincule con los id que son compatibles
#ocupa la tabla estudiantes enlazala con equipos y cuando sus id sean iguales ordename los datos 
#con los join igual se puede usar where y le estoy diciendo y ademas treme los del equipo 2 y el equipo 5

SELECT estudiantes.nombre, estudiantes.apellido, equipos.nombre_proyecto
FROM estudiantes JOIN equipos ON estudiantes.equipo_id = equipos.equipo_id
WHERE estuadiantes.equipo_id = 2 AND estudiantes.equipo_id = 5 ;

#AGREGARE A UN ESTUDIANTE X PARA PROBAR EL TEMA DE LAS TABLAS Y UN EQUIPO 
INSERT INTO Estudiantes (nombre, apellido) VALUES ("Alejandro" , "Heredia");
INSERT INTO Equipos (nombre_proyecto , integrantes) VALUES ("EQUIPOX", 5 );

#LO TRAE ORDENADO SEGUN ESTUDIANTES
SELECT estudiantes.nombre, estudiantes.apellido, equipos.nombre_proyecto
FROM estudiantes LEFT JOIN equipos  ON estudiantes.equipo_id = equipos.equipo_id;

#LO TRAE ORDENADO SEGUN EQUIPOS
SELECT estudiantes.nombre, estudiantes.apellido, equipos.nombre_proyecto
FROM estudiantes RIGHT JOIN equipos ON estudiantes.equipo_id = equipos.equipo_id;

#para buscar LOS DATOS NULS DE ALGUNA TABLE SE OCUPA EN EL WHERE EL IS NULL
SELECT estudiantes.nombre, estudiantes.apellido, equipos.nombre_proyecto
FROM estudiantes LEFT JOIN equipos  ON estudiantes.equipo_id = equipos.equipo_id
WHERE estudiantes.equipo_id IS NULL;
