

CREATE PROCEDURE sp_AgregarRestaurante
@NomRestaurante varchar(50),
@Direccionn varchar(100),
@HoraApertura varchar(50),
@HoraClausura varchar(50),
@FechaFunda date,
@Img varchar(500), 
@Descripcionn varchar(500), 
@IdCliente int
AS 
BEGIN
	INSERT INTO Restaurante(Nombre, Direccion, HorarioApertura, HorarioClausura, FechaFundacion, Imagen, Descripcion, idCliente)
	VALUES(@NomRestaurante, @Direccionn, @HoraApertura, @HoraClausura, @FechaFunda, @Img, @Descripcionn, @IdCliente)
END


CREATE PROCEDURE sp_AgregarReseña
@IdResto int,
@IdClient int,
@Comment varchar(500),
@Valoracion int
AS 
BEGIN
	INSERT INTO Reseña(IdRestaurante, IdCliente, Comentario, Valoracion)
	VALUES(@IdResto, @IdClient, @Comment, @Valoracion)
END




CREATE PROCEDURE sp_GetListaRestaurantes
AS 
BEGIN
	SELECT * FROM Restaurante
END

CREATE PROCEDURE sp_GetInfoRestaurante
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Restaurante WHERE IdRestaurante = @IdRestaurante
END

create PROCEDURE sp_GetInfoReseña
@IdRestaurante int
AS 
BEGIN
	SELECT R.Valoracion, R.Comentario, C.Nombre as Nombre, C.Apellido FROM Reseña R
	INNER JOIN Cliente C ON R.IdCliente = C.IdCliente
	WHERE R.IdRestaurante = @IdRestaurante
END


CREATE PROCEDURE sp_GetListaReseñasDeUnRestaurante
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Reseña Where IdRestaurante = @IdRestaurante
END

create PROCEDURE sp_GetListaReservaDeUnCliente
@IdCliente int
AS 
BEGIN
	SELECT Rese.*, Rest.Nombre as NombreRestaurante, Rest.Imagen AS Imagen FROM Reserva Rese
	INNER JOIN Restaurante Rest ON Rese.IdRestaurante = Rest.IdRestaurante
	Where Rese.IdCliente = @IdCliente
END

create PROCEDURE sp_GetListaRestauranteReservaDeUnCliente
@IdCliente int
AS 
BEGIN
	SELECT Rest.Imagen FROM Reserva Rese
	INNER JOIN Restaurante Rest ON Rese.IdRestaurante = Rest.IdRestaurante
	Where Rese.IdCliente = @IdCliente
END

alter PROCEDURE sp_Registro
@Nombre varchar(50),
@Apellido varchar(50),
@Contraseña varchar(50),
@Email varchar(50),
@TipoCliente bit
AS 
BEGIN
	INSERT INTO Cliente(Nombre, Apellido, Contraseña, Email, TipoCliente)
	VALUES(@Nombre, @Apellido, @Contraseña, @Email,@TipoCliente)
END


create PROCEDURE sp_VerificarCredenciales
@Email varchar(50)
AS
BEGIN
	SELECT * FROM Cliente WHERE Email = @Email
END


create PROCEDURE sp_AgregarReserva
@IdRestaurante int, 
@IdCliente int, 
@FechaReserva date, 
@Hora varchar(50), 
@Cantidad int,
@CantReservas int
AS
BEGIN
	INSERT INTO Reserva(IdRestaurante, IdCliente, FechaReserva, HoraReserva, CantidadPersonas, CantReservas)
	VALUES(@IdRestaurante, @IdCliente, @FechaReserva, @Hora, @Cantidad,@CantReservas)
END



create PROCEDURE sp_EliminarRestaurante
    @IdRestaurante INT
AS
BEGIN
        DELETE FROM Restaurante WHERE IdRestaurante = @IdRestaurante; 
END;

create PROCEDURE sp_CalcularValoracionPromedio
@IdRestaurante INT
AS
BEGIN
	SELECT AVG(Valoracion) as ValoracionPromedio FROM Reseña R
	INNER JOIN Restaurante RE ON R.IdRestaurante = RE.IdRestaurante
	WHERE R.IdRestaurante = @IdRestaurante
	GROUP BY RE.Nombre
END;

Select * from Reseña;

CREATE PROCEDURE sp_EliminarReserva
    @IdReserva INT
AS
BEGIN
        DELETE FROM Reserva WHERE IdReserva = @IdReserva; 
END;

select IdRestaurante from Reseña where IdRestaurante = 6 


CREATE PROCEDURE sp_GetRestauranteFromCliente
@IdCliente int
AS 
BEGIN
	SELECT * FROM Restaurante WHERE idCliente = @IdCliente
END