USE [master]
GO
/****** Object:  Database [ReservaRestaurantes]    Script Date: 26/6/2024 23:07:34 ******/
CREATE DATABASE [ReservaRestaurantes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReservaRestaurantes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ReservaRestaurantes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReservaRestaurantes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ReservaRestaurantes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ReservaRestaurantes] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReservaRestaurantes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReservaRestaurantes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReservaRestaurantes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReservaRestaurantes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReservaRestaurantes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReservaRestaurantes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET RECOVERY FULL 
GO
ALTER DATABASE [ReservaRestaurantes] SET  MULTI_USER 
GO
ALTER DATABASE [ReservaRestaurantes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReservaRestaurantes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReservaRestaurantes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReservaRestaurantes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReservaRestaurantes] SET QUERY_STORE = OFF
GO
USE [ReservaRestaurantes]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TipoCliente] [bit] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseña]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseña](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdRestaurante] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Comentario] [varchar](500) NULL,
	[Valoracion] [int] NULL,
 CONSTRAINT [PK_Reseña] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[IdRestaurante] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[FechaReserva] [date] NOT NULL,
	[HoraReserva] [varchar](50) NOT NULL,
	[CantidadPersonas] [int] NOT NULL,
	[CantReservas] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurante](
	[IdRestaurante] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[HorarioApertura] [varchar](50) NOT NULL,
	[HorarioClausura] [varchar](50) NOT NULL,
	[FechaFundacion] [date] NOT NULL,
	[Imagen] [varchar](500) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[idCliente] [int] NULL,
 CONSTRAINT [PK_Restaurante] PRIMARY KEY CLUSTERED 
(
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email], [TipoCliente]) VALUES (1, N'marcos', N'melle', N'Marcos148', N'marcosmellebovsky@gmail.com', 0)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email], [TipoCliente]) VALUES (2, N'yano', N'ler', N'yano1234', N'ya@gmail.com', 1)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email], [TipoCliente]) VALUES (3, N'Martin', N'Raber', N'Martin06', N'mraber2006@gmail.com', 1)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email], [TipoCliente]) VALUES (4, N'Julian', N'Perez', N'Juli1234', N'jperez@gmail.com', 1)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email], [TipoCliente]) VALUES (5, N'Carla', N'Rodriguez', N'Carli1234', N'car@gmail.com', 1)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email], [TipoCliente]) VALUES (6, N'Juan', N'Martinez', N'Juan12345', N'jmar@gmail.com', 1)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email], [TipoCliente]) VALUES (7, N'Pedro', N'Porto', N'pp123456', N'pp@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Reseña] ON 

INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (1, 5, 1, N'Demasiado buenoo!!!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (2, 1, 1, N'Tremendo lugar!!!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (3, 4, 1, N'Bastante malo!', 2)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (4, 7, 1, N'Muy lindo lugar!!!', 4)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (5, 6, 1, N'God lugar', 3)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (6, 1, 1, N'Me dieron mal la comida!', 2)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (7, 3, 1, N'Que lindo lugar!!!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (8, 3, 1, N'Demasiado buena la comida', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (9, 1, 7, N'Muy mal lugar', 1)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (10, 6, 7, N'La comida estaba fria', 2)
SET IDENTITY_INSERT [dbo].[Reseña] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (11, 3, 1, CAST(N'2024-06-26' AS Date), N'2:00 PM', 3, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (12, 1, 1, CAST(N'2024-07-11' AS Date), N'9:00 PM', 5, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (13, 3, 1, CAST(N'2024-07-05' AS Date), N'12:00 PM', 4, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (14, 4, 1, CAST(N'2024-11-14' AS Date), N'8:00 PM', 4, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (15, 5, 1, CAST(N'2024-06-29' AS Date), N'2:00 PM', 3, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (16, 6, 1, CAST(N'2024-06-28' AS Date), N'6:00 PM', 5, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (17, 7, 1, CAST(N'2024-07-06' AS Date), N'7:00 PM', 1, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (18, 1, 7, CAST(N'2024-07-03' AS Date), N'7:00 PM', 5, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (19, 6, 7, CAST(N'2024-10-10' AS Date), N'7:00 PM', 4, 0)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas], [CantReservas]) VALUES (20, 7, 7, CAST(N'2024-07-11' AS Date), N'9:00 PM', 4, 0)
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurante] ON 

INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion], [idCliente]) VALUES (1, N'El Preferido de Palermo', N'Jorge Luis Borges 2108', N'12:00', N'22:00', CAST(N'2002-05-28' AS Date), N'https://upload.wikimedia.org/wikipedia/commons/e/e1/El_Preferido-closeup-TM.jpg', N'awdñkjwahidhawoidho{DHAoiahwdoidahoiadwhidhoiwaadw', 1)
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion], [idCliente]) VALUES (3, N'GARDEN', N'Libertad 1082', N'15:00', N'00:00', CAST(N'1975-03-12' AS Date), N'https://buenosaires.gob.ar/sites/default/files/media/image/2021/09/22/dd42140c65a7eb08ebca0803d75d0914633047cc.jpg', N'La confitería Florida Garden surgió en la década del 60 y pronto se convirtió en el lugar de moda para los artistas e intelectuales que salían de la Galería del Este o del Instituto Di Tella.', 2)
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion], [idCliente]) VALUES (4, N'Don Julio', N'Guatemala 4699', N'16:00', N'23:00', CAST(N'1943-06-13' AS Date), N'https://media-cdn.tripadvisor.com/media/photo-s/24/1d/97/e7/don-julio.jpg', N'Destino popular que ofrece filetes clásicos, platos locales y una lista larga de vinos en un ambiente íntimo.', 3)
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion], [idCliente]) VALUES (5, N'La Cabrera', N'José A. Cabrera 5127', N'13:00', N'23:00', CAST(N'2000-03-05' AS Date), N'https://www.lacabrera.com.ar/img/stores/paraguay-paseo-de-la-galeria-2-9393-n.jpeg', N'Restaurante argentino tranquilo especializado en carnes a la parrilla, con decoración de madera y terraza.', 4)
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion], [idCliente]) VALUES (6, N'La Parolaccia', N'Av. Alicia Moreau de Justo 1052', N'12:00', N'01:00', CAST(N'1988-04-02' AS Date), N'https://media-cdn.tripadvisor.com/media/photo-s/06/19/ca/0a/fachada-do-restaurante.jpg', N'Restaurante italiano con platos tradicionales y ambiente elegante.', 5)
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion], [idCliente]) VALUES (7, N'Chila', N'Av. Alicia Moreau de Justo 1160', N'12:00', N'00:00', CAST(N'2006-08-13' AS Date), N'https://media-cdn.tripadvisor.com/media/photo-s/1a/f4/35/a5/ingresso-ristorante-chila.jpg', N'Cocina de autor con influencias argentinas y menú que cambia según la temporada.', 6)
SET IDENTITY_INSERT [dbo].[Restaurante] OFF
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseña_Cliente]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Restaurante] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurante] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseña_Restaurante]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Restaurante] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurante] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Restaurante]
GO
ALTER TABLE [dbo].[Restaurante]  WITH CHECK ADD  CONSTRAINT [fk_restaurante_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Restaurante] CHECK CONSTRAINT [fk_restaurante_cliente]
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarReseña]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AgregarReseña]
@IdResto int,
@IdClient int,
@Comment varchar(500),
@Valoracion int
AS 
BEGIN
	INSERT INTO Reseña(IdRestaurante, IdCliente, Comentario, Valoracion)
	VALUES(@IdResto, @IdClient, @Comment, @Valoracion)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarReserva]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_AgregarReserva]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarRestaurante]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarRestaurante]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_CalcularValoracionPromedio]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_CalcularValoracionPromedio]
@IdRestaurante INT
AS
BEGIN
	SELECT AVG(Valoracion) as ValoracionPromedio FROM Reseña R
	INNER JOIN Restaurante RE ON R.IdRestaurante = RE.IdRestaurante
	WHERE R.IdRestaurante = @IdRestaurante
	GROUP BY RE.Nombre
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarReseña]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarReseña]
    @IdComentario INT
AS
BEGIN
        DELETE FROM Reseña WHERE IdComentario = @IdComentario; 
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarReserva]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarReserva]
    @IdReserva INT
AS
BEGIN
        DELETE FROM Reserva WHERE IdReserva = @IdReserva; 
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarRestaurante]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarRestaurante]
    @IdRestaurante INT
AS
BEGIN
		DELETE From Reseña WHERE IdRestaurante=@IdRestaurante;
        DELETE FROM Restaurante WHERE IdRestaurante = @IdRestaurante;
		
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetInfoReseña]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_GetInfoReseña]
@IdRestaurante int
AS 
BEGIN
	SELECT R.Valoracion, R.Comentario, C.Nombre as Nombre, C.Apellido FROM Reseña R
	INNER JOIN Cliente C ON R.IdCliente = C.IdCliente
	WHERE R.IdRestaurante = @IdRestaurante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetInfoRestaurante]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetInfoRestaurante]
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Restaurante WHERE IdRestaurante = @IdRestaurante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListaReseñasDeUnRestaurante]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetListaReseñasDeUnRestaurante]
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Reseña Where IdRestaurante = @IdRestaurante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListaReservaDeUnCliente]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetListaReservaDeUnCliente]
@IdCliente int
AS 
BEGIN
	SELECT Rese.*, Rest.Nombre as NombreRestaurante, Rest.Imagen AS Imagen FROM Reserva Rese
	INNER JOIN Restaurante Rest ON Rese.IdRestaurante = Rest.IdRestaurante
	Where Rese.IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListaRestauranteReservaDeUnCliente]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetListaRestauranteReservaDeUnCliente]
@IdCliente int
AS 
BEGIN
	SELECT Rest.Imagen FROM Reserva Rese
	INNER JOIN Restaurante Rest ON Rese.IdRestaurante = Rest.IdRestaurante
	Where Rese.IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListaRestaurantes]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetListaRestaurantes]
AS 
BEGIN
	SELECT * FROM Restaurante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRestauranteFromCliente]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetRestauranteFromCliente]
@IdCliente int
AS 
BEGIN
	SELECT * FROM Restaurante WHERE idCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Registro]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Registro]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_VerificarCredenciales]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_VerificarCredenciales]
@Email varchar(50)
AS
BEGIN
	SELECT * FROM Cliente WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_VerificarSiExisteRestaurante]    Script Date: 26/6/2024 23:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_VerificarSiExisteRestaurante]
@IdCliente int
AS
BEGIN
	SELECT COUNT(R.idCliente) FROM Restaurante R
	INNER JOIN Cliente C ON R.idCliente = C.IdCliente
	WHERE R.idCliente = @IdCliente
END
GO
USE [master]
GO
ALTER DATABASE [ReservaRestaurantes] SET  READ_WRITE 
GO
