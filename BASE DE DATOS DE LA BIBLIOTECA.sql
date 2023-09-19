CREATE DATABASE BD_BIBLIOTECA_CECYTEQ 
USE BD_BIBLIOTECA_CECYTEQ 

CREATE TABLE categoria
(
	Clave_Categoria VARCHAR(4),
	Nombre_Categoria VARCHAR (20),
	CONSTRAINT pk_clacat PRIMARY KEY (Clave_Categoria) 
)

CREATE TABLE AUTOR
(
	Clave_Autor VARCHAR (4),
	Nombre_Autor VARCHAR (20),
	CONSTRAINT pk_claaut PRIMARY KEY (Clave_Autor) 	
) 

CREATE TABLE USUARIO
(
	Clave_Usuario VARCHAR (4),
	Nombre_Usuario VARCHAR (20),
	Especialidad VARCHAR(20),
	Semestre VARCHAR(2),
	Direccion VARCHAR(20),
	CONSTRAINT pk_claus PRIMARY KEY (Clave_Usuario)
)

CREATE TABLE LIBRO 
(
	Codigo_Unico VARCHAR(4),
	Nombre_Libro VARCHAR(20),
	Editorial VARCHAR(20),
	Numero_edicion VARCHAR(4),
	Costo VARCHAR(7),
	Clave_Categoria1 VARCHAR(4),
	Clave_Autor2 VARCHAR(4),
	CONSTRAINT pk_codunico PRIMARY KEY(Codigo_Unico),
	CONSTRAINT Pk_clavecategoria FOREIGN KEY (Clave_Categoria1) REFERENCES categoria(Clave_Categoria),
	CONSTRAINT pk_claveautor FOREIGN KEY (Clave_Autor2) REFERENCES autor(Clave_Autor)
) 

CREATE TABLE PRESTAMO
(
	Clave_Usuario1 VARCHAR(4),
	Codigo_Unico2 VARCHAR(4),
	Fecha_Prestamo VARCHAR (10),
	Fecha_Entrega VARCHAR(10),
	CONSTRAINT pk_clvusuario1 FOREIGN KEY (Clave_Usuario1) REFERENCES usuario(Clave_Usuario),
	CONSTRAINT pk_clvunico2 FOREIGN KEY (Codigo_Unico2) REFERENCES libro(Codigo_Unico)
)

INSERT INTO categoria VALUES
('CT01','LITERATURA'),
('CT02','CONSULTA'),
('CT03','ARTISTICOS'),
('CT04','DIVULGATIVOS'),
('CT05','TEXTO'),
('CT06','ESPECIALIZADOS'),
('CT07','PRACTICOS'),
('CT08','INFANTILES'),
('CT09','AUTOAYUDA'),
('CT10','POESIA')

INSERT INTO autor VALUES 
('A001','EDGAR'),
('A002','JANE'),
('A003','MIGHEL'),
('A004','AGHATA'),
('A005','PAULO'),
('A006','CHARLES'),
('A007','KEN'),
('A008','FEDERICO'),
('A009','GABRIEL'),
('A010','JAMES')

INSERT INTO usuario VALUES 
('CV01','ISAAC','PROGRAMACION','3','PINAL'),
('CV02','FRANCISCO','PROGRAMACION','3','PINAL'),
('CV03','RODRIGO','PROGRAMACION','1','DERRAMADERO'),
('CV04','VICTOR','PGA','5','JALPAN'),
('CV05','AXEL','PROGRAMACION','1','QUERETARO'),
('CV06','VANESSA','PGA','1','QUERETARO'),
('CV07','GABRIEL','PGA','3','PINAL'),
('CV08','GUSTAVO','PGA','5','MEXICO'),
('CV09','ERIKA','PROGRAMACION','5','QUERETARO'),
('CV10','JAZMIN','PGA','1','PINAL') 

INSERT INTO libro VALUES 
('CL01','LIMITE','AGUILAR','2006','$600','CT01','A001'),
('CL02','PRINCIPITO','PLANETA','1999','$250','CT02','A002'),
('CL03','AÑOS DE SOLEDAD','ALBA','2008','$300','CT03','A003'),
('CL04','RELATOS','ADICIONES','2012','$450','CT04','A004'),
('CL05','DICCIONARIO','SALAMANDRA','2006','$150','CT05','A005'),
('CL06','CORONEL','EDICIONES','2020','$700','CT06','A006'),
('CL07','CARTA DE AMOR','AKAL','2020','$650','CT07','A007'),
('CL08','CASO DE BENJAMIN','EDICIONES','2012','$375','CT08','A008'),
('CL09','EL JARDIN','LUMEN','2008','$700','CT09','A009'),
('CL10','MISERABLES','SIGLO','2007','$500','CT10','A010')  

INSERT INTO prestamo VALUES
('CV01','CL01','2023/01/13','2023/02/13'), 
('CV10','CL04','2023/01/15','2023/02/15'),
('CV02','CL03','2023/01/15','2023/02/15'),
('CV05','CL02','2023/03/18','2023/04/18'),
('CV03','CL05','2023/03/20','2023/04/20'),
('CV06','CL08','2023/03/20','2023/04/20'),
('CV04','CL06','2023/04/10','2023/05/10'),
('CV08','CL09','2023/04/10','2023/05/10'),
('CV07','CL07','2023/05/06','2023/06/06'),
('CV09','CL10','2023/05/06','2023/06/06') 
 

/*QUE ALUMNOS TIENEN PRESTADOS LIBROS*/

SELECT Nombre_Usuario, Clave_Usuario1
FROM prestamo INNER JOIN usuario
ON prestamo.Clave_Usuario1 = usuario.Clave_Usuario
INNER JOIN libro ON prestamo.Codigo_Unico2 = libro.Codigo_Unico
WHERE Clave_Usuario1 = Clave_Usuario 

/*QUE LIBROS TIENEN PRESTADOS LOS ALUMNOS DE PROGRAMACION EN QUE FECHAS LOS SACARON*/
SELECT Nombre_Libro, especialidad, fecha_Prestamo
FROM prestamo INNER JOIN usuario 
ON prestamo.Clave_Usuario1 = usuario.Clave_usuario
INNER JOIN libro ON prestamo.Codigo_Unico2 = Codigo_Unico
WHERE especialidad = 'PROGRAMACION'


/*LIBRO,CATEGORIA,AUTOR,EDITORIAL,Y NUMERO DE EDICION.*/

SELECT Nombre_Libro,Nombre_Categoria,Nombre_Autor,Editorial,Numero_edicion
FROM libro INNER JOIN categoria
ON libro.Clave_Categoria1 = categoria.Clave_Categoria
INNER JOIN autor ON libro.Clave_Autor2 = autor.Clave_Autor
WHERE Codigo_Unico = Codigo_Unico

/*LIBROS PRESTADOS DESDE ENERO HASTA JUNIO*/
SELECT Nombre_Libro, Fecha_Prestamo
FROM prestamo INNER JOIN libro
ON prestamo.codigo_Unico2 = libro.Codigo_unico
WHERE Fecha_Prestamo = fecha_Prestamo


/*QUEREMOS SABER A QUE CATEGORIA PERTENECE EL LIBRO CL03 Y A QUE ALUMNO SE LE PRESTO*/

SELECT  Nombre_Usuario, Nombre_Categoria
FROM prestamo INNER JOIN libro ON prestamo.Codigo_Unico2 = libro.Codigo_Unico
INNER JOIN usuario ON prestamo.Clave_Usuario1 = usuario.Clave_Usuario INNER JOIN
categoria ON libro.Clave_Categoria1 = categoria.Clave_Categoria 
WHERE Codigo_Unico2 ='CL03'



















