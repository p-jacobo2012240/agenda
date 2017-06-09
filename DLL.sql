CREATE DATABASE agenda

USE agenda;
CREATE TABLE Categoria(
		idCategoria INT NOT NULL AUTO_INCREMENT, 
		nombreCategoria varchar(20) not null,
		PRIMARY KEY(idCategoria)
		
	);
	
	
	CREATE TABLE Contacto(
		idContacto INT NOT NULL AUTO_INCREMENT,
		nombre varchar(30) not null,
		apellido varchar(30) not null,
		direccion varchar(30) not null,
		telefono varchar(30) not null,
		correo varchar(30) not null,
		idCategoria int not null,
		PRIMARY KEY(idContacto),
		FOREIGN KEY(idCategoria) REFERENCES Categoria(idCategoria)
	);

	CREATE TABLE Usuario(
		idUsuario INT NOT NULL AUTO_INCREMENT,
		nick varchar(30) not null,
		clave varchar(30) not null,
		PRIMARY KEY(idUsuario)
	);
    
    	CREATE TABLE DetalleUsuario(
		idDetalleUsuario INT NOT NULL AUTO_INCREMENT,
		idCategoria int not null,
		idContacto int not null,
        idUsuario int not null,
		PRIMARY KEY(idDetalleUsuario),
		FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario),
		FOREIGN KEY(idContacto) REFERENCES Contacto(idContacto)
	);
	/*PROCEMIMIENTOS ALMACENADOS*/
     PRUEBA_1
    DELIMITER //
    CREATE PROCEDURE P_USUARIO(in u_nick varchar (10))
    BEGIN
    INSERT INTO Usuario(u_nick) VALUE (nick);
    END//
    
    DELIMITER // 
    CREATE PROCEDURE P_Usu(IN u_nick varchar(10),IN u_clave varchar(10))
    BEGIN 
    INSERT INTO Usuario(u_nick, u_clave) VALUE(nick, clave);
	END//
	/*CALL P_Usu('kokis','xd');*/
    
    DELIMITER //
    CREATE PROCEDURE P_Categoria(IN c_nombreCategoria varchar(10))
	/*select * from Categoria;*/
	BEGIN
    INSERT INTO Categoria(c_nombreCategoria) VALUES (nombre_Categoria);
	END//
	/*CALL P_Usu('amigos','xd');*/
   
    /*
    DELIMITER //
	CREATE PROCEDURE P_Contacto(IN ct_nombre VARCHAR (30), IN ct_apellido VARCHAR (30), IN ct_direccion VARCHAR(30), IN ct_telefono VARCHAR (30), IN ct_correo VARCHAR (30), IN ct_idCategoria INT)
	BEGIN
	INSERT INTO Contacto(nombre, apellido, direccion, telefono, correo, idCategoria) VALUES (ct_nombre, ct_apellido, ct_direccion, ct_telefono, ct_correo, ct_idCategoria);
	END 
	/*CALL SP_addContacto('Daniel', 'JSAN', 'Zona 11', 'aaaa', 'pablo@mail', 10);*/
    
	
	
	 DELIMITER //
	CREATE PROCEDURE P_DetalleUsuario(IN dt_idUsuario INT, IN dt_idContacto INT)
	BEGIN
	INSERT INTO DetalleUsuario(idUsuario, idContacto) VALUES (dt_idUsuario, dt_idContacto);
	END//
	/*CALL P_DetalleUsuario(10, 10);