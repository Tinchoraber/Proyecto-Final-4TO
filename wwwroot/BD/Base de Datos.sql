USE [master]
GO
/****** Object:  Database [ReservaRestaurantes]    Script Date: 6/5/2024 09:33:39 ******/
CREATE DATABASE [ReservaRestaurantes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReservaRestaurantes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ReservaRestaurantes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReservaRestaurantes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ReservaRestaurantes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'ReservaRestaurantes', N'ON'
GO
ALTER DATABASE [ReservaRestaurantes] SET QUERY_STORE = OFF
GO
USE [ReservaRestaurantes]
GO
/****** Object:  User [alumno]    Script Date: 6/5/2024 09:33:39 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  Table [dbo].[Reseña]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  Table [dbo].[Reserva]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  Table [dbo].[Restaurante]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarReseña]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarReserva]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarRestaurante]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CalcularValoracionPromedio]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarReseña]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarReserva]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarRestaurante]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetInfoReseña]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetInfoRestaurante]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListaReseñasDeUnRestaurante]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListaReservaDeUnCliente]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListaRestauranteReservaDeUnCliente]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListaRestaurantes]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetRestauranteFromCliente]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Registro]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_VerificarCredenciales]    Script Date: 6/5/2024 09:33:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_VerificarSiExisteRestaurante]    Script Date: 6/5/2024 09:33:39 ******/
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
