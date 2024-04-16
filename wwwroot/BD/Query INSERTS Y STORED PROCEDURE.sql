
INSERT INTO Restaurante(Nombre, Direccion, HorarioApertura, HorarioClausura, FechaFundacion, Imagen, Descripcion) 
VALUES('Kansas', 'Av. del Libertador 4625', '12:00', '00:00', '1999-06-09', 'https://buenosairesenvivo.com/wp-content/uploads/2023/08/unnamed-7.png', 'Kansas es un restaurant de Contemporary American Cuisine. El primer Restaurant fue inaugurado en Junio de 1999 en San Isidro. Nuestra visión es aportar alimentos de calidad en un ambiente placentero a través de un servicio excelente.'),
	  ('Dean & Dennys', 'Malabia 1591', '10:00', '21:00', '2012-04-08', 'https://deananddennys.com/contenidos/1611864738.png', 'Dean & Dennys nace en Buenos Aires, Argentina, con la premisa de ofrecer hamburguesas y hot dogs de calidad premium, con locales de ambiente moderno, distendido y agradable.'), 
	  ('KFC', 'Av. Corrientes 3201', '10:00', '23:00', '1952-09-24', 'https://assets.website-files.com/609c023f320888ea539cdc7e/60e4938c76307be2564c66fb_KFC_Website_SobreKFC_LegacyLogo.svg', 'KFC corporations, (Kentucky Fried Chicken) es la marca líder especializada en los productos de pollo con más de 17.000 restaurantes en todo el mundo con sede en Louisville.'), 
	  ('Don Julio', 'Guatemala 4699', '11:00', '01:00', '1999-12-30', 'https://www.parrilladonjulio.com/images/logo.png', 'Don Julio se encuentra en el barrio porteño de Palermo y se destaca por servir cortes de carne premium a la parrilla, acompañados por vegetales y productos orgánicos de cada temporada -cultivados especialmente para el restaurante- y embutidos elaborados de manera artesanal.'), 
	  ('El Ferroviario', 'Av. Reservistas Argentinos 219', '12:00', '23:00', '2006-05-24', 'https://elferroviarioparrilla.com/images/logo.png', 'Con el paso del tiempo y respondiendo a las peticiones de los comensales, se fueron incluyendo diversidad de platos y manjares. Se incorporaron al menú carnes asadas, guarniciones, pastas, picadas, postres elaborados, carnes exóticas, vinos de todas las gamas y tragos lo que llevó al pequeño buffet del Club a convertirse en el Restaurante- Parrilla tan famoso que hoy conocemos, con su característica fidelidad por las tradiciones nacionales.')








CREATE PROCEDURE sp_AgregarRestaurante
@NomRestaurante varchar(50),
@Direccionn varchar(100),
@HoraApertura varchar(50),
@HoraClausura varchar(50),
@FechaFunda date,
@Img varchar(500), 
@Descripcionn varchar(500)
AS 
BEGIN
	INSERT INTO Restaurante(Nombre, Direccion, HorarioApertura, HorarioClausura, FechaFundacion, Imagen, Descripcion)
	VALUES(@NomRestaurante, @Direccionn, @HoraApertura, @HoraClausura, @FechaFunda, @Img, @Descripcionn)
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

alter PROCEDURE sp_GetInfoReseña
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

ALTER PROCEDURE sp_GetListaReservaDeUnCliente
@IdCliente int
AS 
BEGIN
	SELECT Rese.*, Rest.Nombre as NombreRestaurante, Rest.Imagen AS Imagen FROM Reserva Rese
	INNER JOIN Restaurante Rest ON Rese.IdRestaurante = Rest.IdRestaurante
	Where IdCliente = @IdCliente
END

create PROCEDURE sp_GetListaRestauranteReservaDeUnCliente
@IdCliente int
AS 
BEGIN
	SELECT Rest.Imagen FROM Reserva Rese
	INNER JOIN Restaurante Rest ON Rese.IdRestaurante = Rest.IdRestaurante
	Where IdCliente = @IdCliente
END

ALTER PROCEDURE sp_Registro
@Nombre varchar(50),
@Apellido varchar(50),
@Contraseña varchar(50),
@Email varchar(50)
AS 
BEGIN
	INSERT INTO Cliente(Nombre, Apellido, Contraseña, Email)
	VALUES(@Nombre, @Apellido, @Contraseña, @Email)
END

ALTER PROCEDURE sp_Contacto
@idCliente int,
@Nombre varchar(50),
@Apellido varchar(50),
@Telefono int,
@Email varchar(50),
@Mensaje varchar(50)

AS 
BEGIN
	INSERT INTO Contacto(Nombre, Apellido,Telefono, Email, Mensaje, idCliente)
	VALUES(@Nombre, @Apellido,@Telefono, @Email,@Mensaje, @idCliente )
END


ALTER PROCEDURE sp_VerificarCredenciales
@Email varchar(50)
AS
BEGIN
	SELECT * FROM Cliente WHERE Email = @Email
END


CREATE PROCEDURE sp_AgregarReserva
@IdRestaurante int, 
@IdCliente int, 
@FechaReserva date, 
@Hora varchar(50), 
@Cantidad int
AS
BEGIN
	INSERT INTO Reserva(IdRestaurante, IdCliente, FechaReserva, HoraReserva, CantidadPersonas)
	VALUES(@IdRestaurante, @IdCliente, @FechaReserva, @Hora, @Cantidad)
END



alter PROCEDURE sp_EliminarRestaurante
    @IdRestaurante INT
AS
BEGIN
        DELETE FROM Restaurante WHERE IdRestaurante = @IdRestaurante; 
END;

ALTER PROCEDURE sp_CalcularValoracionPromedio
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