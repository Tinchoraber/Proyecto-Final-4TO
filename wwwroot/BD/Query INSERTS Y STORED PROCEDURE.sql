

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


CREATE PROCEDURE sp_AgregarRese�a
@IdResto int,
@IdClient int,
@Comment varchar(500),
@Valoracion int
AS 
BEGIN
	INSERT INTO Rese�a(IdRestaurante, IdCliente, Comentario, Valoracion)
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

create PROCEDURE sp_GetInfoRese�a
@IdRestaurante int
AS 
BEGIN
	SELECT R.Valoracion, R.Comentario, C.Nombre as Nombre, C.Apellido FROM Rese�a R
	INNER JOIN Cliente C ON R.IdCliente = C.IdCliente
	WHERE R.IdRestaurante = @IdRestaurante
END


CREATE PROCEDURE sp_GetListaRese�asDeUnRestaurante
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Rese�a Where IdRestaurante = @IdRestaurante
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
@Contrase�a varchar(50),
@Email varchar(50),
@TipoCliente bit
AS 
BEGIN
	INSERT INTO Cliente(Nombre, Apellido, Contrase�a, Email, TipoCliente)
	VALUES(@Nombre, @Apellido, @Contrase�a, @Email,@TipoCliente)
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



alter PROCEDURE sp_EliminarRestaurante
    @IdRestaurante INT
AS
BEGIN
		DELETE From Reseña WHERE IdRestaurante=@IdRestaurante;
        DELETE FROM Restaurante WHERE IdRestaurante = @IdRestaurante;
		
END;

create PROCEDURE sp_CalcularValoracionPromedio
@IdRestaurante INT
AS
BEGIN
	SELECT AVG(Valoracion) as ValoracionPromedio FROM Rese�a R
	INNER JOIN Restaurante RE ON R.IdRestaurante = RE.IdRestaurante
	WHERE R.IdRestaurante = @IdRestaurante
	GROUP BY RE.Nombre
END;

Select * from Rese�a;

CREATE PROCEDURE sp_EliminarReserva
    @IdReserva INT
AS
BEGIN
        DELETE FROM Reserva WHERE IdReserva = @IdReserva; 
END;

select IdRestaurante from Rese�a where IdRestaurante = 6 


CREATE PROCEDURE sp_GetRestauranteFromCliente
@IdCliente int
AS 
BEGIN
	SELECT * FROM Restaurante WHERE idCliente = @IdCliente
END

CREATE PROCEDURE sp_VerificarSiExisteRestaurante
@IdCliente int
AS
BEGIN
	SELECT COUNT(R.idCliente) FROM Restaurante R
	INNER JOIN Cliente C ON R.idCliente = C.IdCliente
	WHERE R.idCliente = @IdCliente
END

CREATE PROCEDURE sp_EliminarReseña
    @IdComentario INT
AS
BEGIN
        DELETE FROM Reseña WHERE IdComentario = @IdComentario; 
END;

