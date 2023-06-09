USE [master]
GO
/****** Object:  Database [AkirasBoutiques]    Script Date: 28/05/2023 11:51:32 p. m. ******/
CREATE DATABASE [AkirasBoutiques]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AkirasBoutiques', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AkirasBoutiques.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AkirasBoutiques_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AkirasBoutiques_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AkirasBoutiques] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AkirasBoutiques].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ARITHABORT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AkirasBoutiques] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AkirasBoutiques] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AkirasBoutiques] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AkirasBoutiques] SET  MULTI_USER 
GO
ALTER DATABASE [AkirasBoutiques] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AkirasBoutiques] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AkirasBoutiques] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AkirasBoutiques] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AkirasBoutiques] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AkirasBoutiques] SET QUERY_STORE = OFF
GO
USE [AkirasBoutiques]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id_factura] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha] [date] NULL,
	[id_detalle] [int] NOT NULL,
	[numero_tienda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_cliente2021]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_cliente2021] as
select id_cliente, fecha 
from factura 
where (fecha >= '2021-01-01' and fecha <= '2021-12-31')
GO
/****** Object:  View [dbo].[vw_clientes2022]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_clientes2022] as
select id_cliente, fecha 
from factura 
where (fecha >= '2022-01-01' and fecha <= '2022-12-13')
GO
/****** Object:  View [dbo].[vw_clientesdiciembre2021]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_clientesdiciembre2021] as
select id_cliente, fecha 
from factura 
where (fecha >= '2021-12-01' and fecha <= '2021-12-31')
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[apellido] [text] NOT NULL,
	[direccion] [text] NOT NULL,
	[fec_nac] [date] NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_valentina]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_valentina] as
select f.id_factura, f.id_cliente, f.id_detalle, c.nombre, c.apellido 
from factura f, cliente c
where (f.id_cliente = '2'and c.id_cliente = '2')
GO
/****** Object:  View [dbo].[vw_zayra]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_zayra] as
select f.id_factura, f.id_cliente, f.id_detalle, c.nombre, c.apellido 
from factura f, cliente c
where (f.id_cliente = '17'and c.id_cliente = '17')
GO
/****** Object:  View [dbo].[vw_dante]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_dante] as
select f.id_factura, f.id_cliente, f.id_detalle, c.nombre, c.apellido 
from factura f, cliente c
where (f.id_cliente = '24' and c.id_cliente = '24')
GO
/****** Object:  View [dbo].[vw_ana]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ana] as
select f.id_factura, f.id_cliente, f.id_detalle, c.nombre, c.apellido 
from factura f, cliente c
where (f.id_cliente = '4' and c.id_cliente = '4')
GO
/****** Object:  View [dbo].[vw_rodrigo]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_rodrigo] as
select f.id_factura, f.id_cliente, f.id_detalle, c.nombre, c.apellido 
from factura f, cliente c
where (f.id_cliente = '11' and c.id_cliente ='11')
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[id_detalle] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_productoventa]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_productoventa] as
SELECT * FROM detalle
WHERE cantidad = (SELECT MAX(cantidad) FROM detalle)
GO
/****** Object:  Table [dbo].[producto]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[precio] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_productostock]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_productostock] as
SELECT * FROM producto
WHERE stock = (SELECT MAX(stock) FROM producto)
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[descripcion] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_falda]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_falda] as 
select p.id_producto, p.nombre, p.id_categoria 
from producto p, categoria c
where (p.id_categoria = '2'and c.id_categoria = '2')
GO
/****** Object:  View [dbo].[vw_pantalon]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_pantalon] as
select p.id_producto, p.nombre, p.id_categoria 
from producto p, categoria c
where (p.id_categoria = '3'and c.id_categoria = '3')
GO
/****** Object:  View [dbo].[vw_chamarra]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_chamarra] as
select p.id_producto, p.nombre, p.id_categoria 
from producto p, categoria c
where (p.id_categoria = '7'and c.id_categoria = '7')
GO
/****** Object:  View [dbo].[vw_zapato]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_zapato] as
select p.id_producto, p.nombre, p.id_categoria 
from producto p, categoria c
where (p.id_categoria = '6'and c.id_categoria = '6')
GO
/****** Object:  View [dbo].[vw_accesorio]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_accesorio] as
select p.id_producto, p.nombre, p.id_categoria 
from producto p, categoria c
where (p.id_categoria = '10'and c.id_categoria = '10')
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_sucursal] [varchar](50) NOT NULL,
	[Encargado] [varchar](50) NOT NULL,
	[Direccion] [varchar](60) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
	[Ciudad] [varchar](30) NOT NULL,
	[Estado] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_encargados]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_encargados] as
select encargado from Sucursales
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](60) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
	[Edad] [int] NOT NULL,
	[Sucursal] [varchar](50) NOT NULL,
	[CorreoElectronico] [varchar](40) NULL,
	[Contraseña] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_empconstitucion]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_empconstitucion] as
select nombre from Empleados
where (sucursal ='Akira´s boutique:Constitucion')
GO
/****** Object:  View [dbo].[vw_mayor30]    Script Date: 28/05/2023 11:51:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_mayor30] as
select * from cliente
where (fec_nac < '1993-01-01')
GO
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (1, N'Blusa', N'Prenda abierta de tela fina , similar a la camisa , que usan las mujeres y los niños , y que cubre la parte superior del cuerpo')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (2, N'Falda', N'Prenda de vestir que cuelga de la cintura y cubre las piernas, al menos en parte. ')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (3, N'Pantalón', N'Prenda de vestir que se ajusta a la cintura y llega generalmente hasta el pie , cubriendo cada pierna separadamente .')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (4, N'Pijama', N'Conjunto de chaqueta o camiseta y pantalón a juego que se usa para dormir.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (5, N'Camisa', N'Prenda de vestir que cubre el tronco hasta la cadera o medio muslo, con cuello, manga corta o larga, que se abrocha por delante con botones; suele llevar un canesú en la espalda que permite dar amplitud al cuerpo de la prenda.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (6, N'Zapato', N'pieza de calzado que protege al pie, brindándole comodidad a la persona a la hora de llevar a cabo diferentes acciones')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (7, N'Chamarra', N'Prenda amplia de vestir, rústica, de abrigo, que cubre el cuerpo hasta medio muslo, hecha de piel con lana o pelo por fuera o por dentro.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (8, N'Suéter', N'Prenda de punto elástico, manual o mecánico, de lana, algodón o alguna fibra sintética, cerrado o abierto por delante, con escote o cuello de distinto tipo y generalmente manga larga, que cubre el cuerpo hasta la cadera o medio muslo.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (9, N'Vestido', N'Prenda que se asocia con la elegancia femenina y clásica. ')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (10, N'Accesorios', N'Completan el look, le dan un aire renovado a nuestras prendas. Collares, accesorios para el pelo, joyas, zapatos, carteras, cinturones')
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (0, N'María Antonieta', N'García Meléndez ', N'Calle las Girasol #305 col. Jardines ', CAST(N'1989-06-15' AS Date), 1828921321, N'mariantonia@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (1, N'Óscar Germán', N'Wong Tabares ', N'Calle Revolución #879 col. México', CAST(N'1994-01-28' AS Date), 2035672143, N'germanwong@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (2, N'Valentina Anastasia', N'Huerta Corral', N'Calle Flamenco #3493 col. Aviar', CAST(N'1992-07-03' AS Date), 0, N'valehue92@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (3, N'Luisa Beatriz ', N'Rodríguez Estrada', N'Calle Ruiseño #1903 col. Aviar', CAST(N'1995-02-21' AS Date), 2034598383, N'betyrodri@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (4, N'Ana Maribel ', N'Cedillo Núñez ', N'Calle Ecuador #278 col. Latinoamérica', CAST(N'1986-09-25' AS Date), 1783920982, N'anamari86@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (5, N'Sara Valeria ', N'Jiménez Sánchez', N'calle Amarillo #890 col. Colores', CAST(N'1990-10-23' AS Date), 1025675109, N'valesarita@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (6, N'Rodrigo Enrique', N'García Monreal ', N'Calle Guadiana #905 fracc. Guadiana', CAST(N'1993-03-29' AS Date), 2146982372, N'rodrimonreal@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (7, N'Marina Gabriela', N'Villanueva Barrios', N'Calle Luna #560 fracc. Cosmos', CAST(N'1993-06-04' AS Date), 1161728372, N'marigaby@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (8, N'Luis Francisco', N'Bernal Casas', N'Calle Porfirio #246 col. Revolución', CAST(N'1996-01-22' AS Date), 2034573621, N'luispacober@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (9, N'Rebeca Elizabeth ', N'Puentes Ríos', N'Calle Domingo #1929 col. Buendia', CAST(N'1988-10-18' AS Date), 123459834, N'rebepuentes88@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (10, N'Yesenia Beatriz', N'Quintanilla Torres', N'Calle Roble #405 col. Singapur', CAST(N'1984-01-24' AS Date), 1328902183, N'betyquintanilla@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (11, N'Rodrigo Ismael', N'Silva Ugarte', N'Calle Tamarino #1209 fracc. Mezquital', CAST(N'1996-05-14' AS Date), 1436784145, N'rodriisma@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (12, N'Rosa Hortencia ', N'Rosas Morales', N'Calle Margarita #2892 col Jardines', CAST(N'1983-01-15' AS Date), 1923925489, N'rositarosas@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (13, N'Gabriela Cassandra', N'Quiñones Escobar', N'Calle Dolores #239 col. Del Río', CAST(N'1987-11-15' AS Date), 2113840192, N'cassqui87@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (14, N'Sara Roberta ', N'Moreno Moreno', N'Calle Colinas #912 col. Colinas del norte', CAST(N'1982-12-14' AS Date), 1244930285, N'saritarober@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (15, N'María Fernanda', N'Ávila Nuñez', N'Calle Nunó #594 col. Personajes', CAST(N'1995-09-13' AS Date), 1207583929, N'mariafer95@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (16, N'Camilo Isaac', N'Peña Huerta', N'Calle Niños Héroes #1239 col. México ', CAST(N'1987-01-20' AS Date), 1293904389, N'camisac@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (17, N'Zayra Manuela', N'Gómez López ', N'Calle Rosales #390 Fracc. Las flores', CAST(N'1977-10-28' AS Date), 1283094033, N'zaygom77@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (18, N'Rosa Alicia ', N'Reyes Nájera ', N'Calle Flautín #1459 col. La Orquesta', CAST(N'1984-11-20' AS Date), 125940940, N'rosealice84@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (19, N'Juan Roberto  ', N'Ortega Rincón', N'Calle Los Álamos #4902 Fracc. Monreal', CAST(N'1986-07-31' AS Date), 1489328581, N'roberortega@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (21, N'Sandra Isabella ', N'Pereyra Félix ', N'Calle Azalea #901 Fracc. Las Flores', CAST(N'1990-04-09' AS Date), 1289394301, N'peyfex90@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (22, N'Rogelia Margarita ', N'Cruz Santos ', N'Calle Golondrinas #9023 col. Felipe Ángeles', CAST(N'1986-05-11' AS Date), 1925678302, N'margaritacruz@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (23, N'Julieta Odette ', N'Rocha Ramazzoti', N'Calle Río Bravo #2013 Fracc. TierraBlanca', CAST(N'1993-07-16' AS Date), 1293391028, N'julyramazzoti@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (24, N'Dante Eduardo', N'Dolores Meza', N'Calle Miguel Ángel #439 col. Renacimiento', CAST(N'1993-07-15' AS Date), 2023950349, N'danteduardo93@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (25, N'Bianca Alejandra', N'Rosales Rosas', N'Calle Rueda #1924 col. Emprendedores ', CAST(N'1987-06-26' AS Date), 1821039583, N'rosasbianca@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (26, N'Fabiola Elena', N'Reséndiz Amador ', N'Calle Melchor Ocampo #901 col. Libertadores', CAST(N'1994-08-18' AS Date), 1294024901, N'fabielle94@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (27, N'Miriam Karina', N'Lara Ruíz', N'Sta. María del Oro #423 col. Nazas', CAST(N'1990-07-26' AS Date), 2014893018, N'mirilara@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (28, N'Valeria Jimena', N'De la O Tabares ', N'Calle Crisantema #311 col. PRI Amp', CAST(N'1986-08-15' AS Date), 1024792478, N'valejimena@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (29, N'Juan Humberto', N'Martínez Fuentes', N'Calle Agustín de Anda #608 fracc. Valle del Guadiana', CAST(N'1989-10-17' AS Date), 1924802840, N'juanmar@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (30, N'Melissa Ximena', N'Zaragoza Suárez', N'Calle Río Piaxtla #4380 col Valle del Sur', CAST(N'1986-05-15' AS Date), 2018438929, N'melizara@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (31, N'Cristina Miranda ', N'Morales Rueda ', N'Calle Magnolia #113 Fracc Jardines', CAST(N'1987-08-16' AS Date), 1034920394, N'crismiranda@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (32, N'Bruno Alejandro', N'Miranda López', N'Calle del Roble #702, fracc. Jardines del Real IV', CAST(N'1988-06-29' AS Date), 1893019749, N'brunomiranda@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (33, N'Helena Emilia', N'Robles Espinoza ', N'Calle Plan de Agua Prieta #128 Col Emiliano Zapata', CAST(N'1987-10-28' AS Date), 1892081803, N'helenarobles@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (34, N'Teresa Renata', N'Zavala Piña', N'Calle Chiapas #205 col. Morga', CAST(N'1985-02-20' AS Date), 1029482019, N'terezavala@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (35, N'Wendy Carolina ', N'Piña Quiñones', N'Calle Gral Fco. Arrieta #211 col. Gral Domingo Arrieta', CAST(N'1995-07-19' AS Date), 1928001001, N'carowendy@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (36, N'Jesús Alberto', N'Hidalgo Correa ', N'Calle 3 de Agosto #308, col Tierra y Libertad', CAST(N'1985-01-18' AS Date), 1890290832, N'chuybeto@gmail.com')
GO
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (1, 32, 4, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (2, 8, 3, 690)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (3, 39, 4, 200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (4, 26, 1, 110)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (5, 30, 4, 1800)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (6, 2, 5, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (7, 14, 4, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (8, 36, 2, 1500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (9, 25, 1, 1050)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (10, 34, 1, 1350)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (11, 12, 6, 1500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (12, 13, 1, 150)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (13, 21, 1, 150)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (14, 24, 8, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (15, 31, 2, 900)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (16, 22, 1, 600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (17, 5, 7, 1750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (18, 3, 4, 400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (19, 11, 2, 558)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (20, 4, 6, 600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (21, 7, 6, 720)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (22, 10, 4, 1200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (23, 33, 4, 2400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (24, 39, 10, 500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (25, 20, 8, 2400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (26, 27, 2, 1400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (27, 35, 4, 4200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (28, 29, 4, 1200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (29, 38, 6, 450)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (30, 28, 1, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (31, 18, 6, 1620)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (32, 25, 6, 6300)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (33, 30, 3, 1350)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (34, 26, 5, 5500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (35, 40, 10, 1000)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (36, 21, 9, 4950)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (37, 12, 3, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (38, 8, 6, 1380)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (39, 11, 4, 1116)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (40, 4, 8, 800)
GO
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'alexa gomez ferrera', N'calle quinta #963 col.porvenir', N'99942587', 28, N'Akira´s boutique:Constitucion', N'alexa36@gmail.com', N'ijf955e9')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'ana laura chan ek', N'calle lazaro #841 col.mercedez', N'9992458712', 30, N'Akira´s boutique: Las Mercedes', N'ana124@gmail.com', N'cgt124t3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'breyli chan chable', N'calle iturbide #87 col.mexico', N'9994628711', 33, N'Akira´s boutique:Constitucion', N'breyli@gmail.com', N'ddd666e3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'carlos jimenez suarez', N'calle asuncion #369 col.miraflores', N'9995615844', 29, N'Akira´s boutique:Constitucion', N'carlos489@gmail.com', N'tui361q9')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'carlos perez ponce', N'calle allende #256 col.miraflores', N'9994789315', 28, N'Akira´s boutique:Obraje', N'carlos96@gmail.com', N'cle186b3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'carlos sosa flores', N'calle corona #36 col.condesa', N'9994568899', 29, N'Akira´s boutique:Centro', N'sosa36@gmail.com', N'hjg888h9')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'daniela fernanda diaz ordaz', N'calle selaya #489 col.juan pablo', N'9992315312', 36, N'Akira´s boutique:Galerias mazatlan', N'daniela23@gmail.com', N'xny236x6')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'diana flores cruz', N'calle irapuato #84 col.bojorquez', N'9996231854', 27, N'Akira´s boutique:Melchor', N'diana369@gmail.com', N'kjp596e9')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'eduardo contreras lopez', N'calle juarez #46 col.villa bonita', N'9995938381', 28, N'Akira´s boutique:Melchor', N'eduardo78@gmail.com', N'qpo987g5')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'emiliano perez molina', N'calle acebedo #36 col.centro', N'9996183641', 28, N'Akira´s boutique:Melchor', N'emiliano58@gmail.com', N'ytr951g2')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'enrique mejia acevedo', N'calle dolores #847 col.mejorada', N'9992487136', 24, N'Akira´s boutique:Obraje', N'enrique26@gmail.com', N'luy853v8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'fatima carransa mena', N'calle agustin #423 col.dorada', N'9996124578', 36, N'Akira´s boutique:Zapopan', N'fatima9@gmail.com', N'csj523s8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'fernando calderon ayala', N'calle agustin #147 col.porvenir', N'9992587415', 38, N'Akira´s boutique:Obraje', N'fernado14@gmail.com', N'cst218s8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'fernando canche tun', N'calle iturralde #18 col.america', N'9992154616', 36, N'Akira´s boutique:Galerias mazatlan', N'fernando6@gmail.com', N'qlp198n8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'flory aguayo quintal', N'calle lopez #823 col.centro', N'9991351566', 36, N'Akira´s boutique:Constitucio', N'flory123@gmail.com', N'fgh831l8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'gregorio molina perez', N'calle irapuato #47 col.ponce', N'9992617842', 31, N'Akira´s boutique:Galerias mazatlan', N'gregorio12@gmail.com', N'cns159g8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'gricelda alfaro soas', N'calle flores #59 col.esperanza', N'9996847251', 29, N'Akira´s boutique:Zapopan', N'gricelda@gmail.com', N'dfe478s2')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'irma dorantes aguilar', N'calle ayende #326 col.pensiones', N'9992568742', 36, N'Akira´s boutique: Las Mercedes', N'irma85@gmail.com', N'msj489e3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'jacinta alderete porras', N'calle romanoss #123 col.condesa', N'9991487236', 36, N'Akira´s boutique:Obraje', N'jacinta@gmail.com', N'chy843s8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'jessica flores medina', N'calle irappuato #82 col.obregon', N'9996251525', 28, N'Akira´s boutique:Centro', N'jessica@gmail.com', N'rrq883f4')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'jimmy alejandro jimenez castro', N'calle lazaro #203 col.obrera', N'9994875216', 28, N'Akira´s boutique: Las Mercedes', N'jimmy715@gmail.com', N'srt247r3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'jorge castillo camara', N'calle tortugas #56 col.quinteros', N'9996215612', 34, N'Akira´s boutique:Centro', N'jorge87@gmail.com', N'ytr124b8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'juan perez cruz', N'calle morelos #256 col.condesa', N'9995211325', 32, N'Akira´s boutique:Obraje', N'juan45@gmail.com', N'rsk249c3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'karla contreras jimenez', N'calle dolores #56 col.iturralde', N'9993658525', 27, N'Akira´s boutique:Centro', N'karla69@gmail.com', N'mon258e6')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'luis flores pinzon', N'calle iturralde #84 col.nora', N'9995846387', 34, N'Akira´s boutique:Zapopan', N'luis36@gmail.com', N'sko321q2')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'margarita medina segovia chan', N'calle ordoñez #14 col.esperanza', N'9994587126', 27, N'Akira´s boutique: Las Mercedes', N'magui214@gmail.com', N'sae784s2')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'maria contreras duran', N'calle julian #236 col.lopez mateos', N'9993487523', 37, N'Akira´s boutique:Galerias mazatlan', N'maria78@gmail.com', N'std189v3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'maricarmen tun acebedo', N'calle flores #85 col.porvenir', N'9992657381', 36, N'Akira´s boutique:Melchor', N'maricarmen36@gmail.com', N'srp983r4')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'maricarmen yam canul', N'calle diaz #68 col.ponce', N'9996254848', 29, N'Akira´s boutique:Galerias mazatlan', N'maricarmen@gmail.com', N'msj483b8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'mario alberto jimenez salcido', N'calle ayende #289 col.tulipanes', N'9992487362', 31, N'Akira´s boutique:Zapopan', N'mario259@gmail.com', N'csl148r3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'monica dorantes espadas', N'calle aleman #723 col.cupules', N'9994638572', 29, N'Akira´s boutique:Obraje', N'monica1@gmail.com', N'cbt187s4')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'oliver contraras ponce', N'calle diaz #753 col.america', N'9998763215', 24, N'Akira´s boutique:Zapopan', N'oliver12@gmail.com', N'eui164a3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'oscar alpuche muñoz', N'calle ayende #236 col.miraflores', N'9996321874', 29, N'Akira´s boutique:Galerias mazatlan', N'oscar14@gmail.com', N'alo439v5')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'raul canche bermudes', N'calle aleman #13 col.condesa', N'9992364187', 27, N'Akira´s boutique:Zapopan', N'raul3@gmail.com', N'qpd196s8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'ricardo gomez contreras', N'calle dolres #943 col.buenavista', N'9998654544', 33, N'Akira´s boutique:Constitucion', N'ricardo45@gmail.com', N'prr451n3')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'ricardo osorio medina', N'calle rocalde #547 col.esperanza', N'9998536242', 26, N'Akira´s boutique: Las Mercedes', N'ricardo23@gmail.com', N'ers124v7')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'roberto medina medina', N'calle morelos #36 col.juarez', N'9993854163', 33, N'Akira´s boutique:Melchor', N'roberto3@gmail.com', N'sly654b8')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'rodrigo perez contreras', N'calle cantaros #89 col. porvenir', N'9998454876', 36, N'Akira´s boutique:Centro', N'rodrigo@gmail.com', N'dds883f9')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'samuel enrique barrios enciso', N'calle ayende #45 col.flores', N'9998523645', 34, N'Akira´s boutique:Centro', N'samuel236@gmail.com', N'rre326b5')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'sonia alejandra fernandez moreno', N'calle obregon #206 col.julian carrillo', N'9992658774', 35, N'Akira´s boutique: Las Mercedes', N'sonia84@gmail.com', N'der587s2')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'tamara alejandra bernal ramos', N'calle irapuato #96 col.ayende', N'9998886523', 31, N'Akira´s boutique:Constitucion', N'tamara@gmail.com', N'tyu654w9')
INSERT [dbo].[Empleados] ([nombre], [Direccion], [Telefono], [Edad], [Sucursal], [CorreoElectronico], [Contraseña]) VALUES (N'yesenia guadalupe campos rojo', N'calle sur #269 col.mejorada', N'9994863218', 32, N'Akira´s boutique:Melchor', N'yesenia89@gmail.com', N'cms198w3')
GO
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (1, 9, CAST(N'2021-12-22' AS Date), 1, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (2, 9, CAST(N'2021-10-11' AS Date), 2, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (3, 4, CAST(N'2021-12-07' AS Date), 3, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (4, 4, CAST(N'2021-08-24' AS Date), 4, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (5, 1, CAST(N'2021-09-24' AS Date), 5, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (6, 1, CAST(N'2022-01-08' AS Date), 6, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (7, 0, CAST(N'2022-01-01' AS Date), 7, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (8, 0, CAST(N'2021-12-28' AS Date), 8, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (9, 3, CAST(N'2022-01-11' AS Date), 9, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (10, 3, CAST(N'2022-01-16' AS Date), 10, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (11, 2, CAST(N'2021-07-13' AS Date), 11, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (12, 2, CAST(N'2022-01-05' AS Date), 12, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (13, 6, CAST(N'2022-01-12' AS Date), 13, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (14, 6, CAST(N'2021-12-22' AS Date), 14, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (15, 5, CAST(N'2021-11-18' AS Date), 15, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (16, 5, CAST(N'2022-01-09' AS Date), 16, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (17, 7, CAST(N'2021-10-12' AS Date), 17, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (18, 7, CAST(N'2021-12-30' AS Date), 18, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (19, 8, CAST(N'2022-01-17' AS Date), 19, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (20, 8, CAST(N'2021-12-21' AS Date), 20, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (21, 26, CAST(N'2021-10-08' AS Date), 21, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (22, 30, CAST(N'2022-01-19' AS Date), 22, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (23, 31, CAST(N'2021-07-16' AS Date), 23, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (24, 35, CAST(N'2021-09-23' AS Date), 24, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (25, 25, CAST(N'2021-06-14' AS Date), 25, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (26, 29, CAST(N'2021-08-19' AS Date), 26, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (27, 27, CAST(N'2021-11-10' AS Date), 27, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (28, 24, CAST(N'2022-01-22' AS Date), 28, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (29, 26, CAST(N'2022-01-11' AS Date), 29, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (30, 36, CAST(N'2022-01-04' AS Date), 30, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (31, 12, CAST(N'2021-12-07' AS Date), 31, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (32, 14, CAST(N'2022-01-06' AS Date), 32, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (33, 24, CAST(N'2022-01-03' AS Date), 33, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (34, 17, CAST(N'2021-11-11' AS Date), 34, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (35, 31, CAST(N'2021-11-16' AS Date), 35, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (36, 36, CAST(N'2022-01-10' AS Date), 36, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (37, 23, CAST(N'2021-11-17' AS Date), 37, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (38, 29, CAST(N'2022-01-03' AS Date), 38, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (39, 26, CAST(N'2021-12-14' AS Date), 39, NULL)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle], [numero_tienda]) VALUES (40, 18, CAST(N'2022-01-20' AS Date), 40, NULL)
GO
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (1, N'Blusa de flores', 200, 70, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (2, N'Blusa tipo escocesa ', 150, 35, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (3, N'Blusa rayada manga larga', 100, 37, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (4, N'Blusa con estampado animado', 100, 26, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (5, N'Falda larga', 200, 45, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (6, N'Falda tipo escocesa ', 250, 12, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (7, N'Falda tipo escolar ', 120, 68, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (8, N'Falda ejecutiva ', 230, 20, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (9, N'Pantalón acampanado ', 350, 23, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (10, N'Skinny Jeans', 300, 56, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (11, N'Pantalón Pants ', 279, 30, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (12, N'Shorts de Mezclilla', 250, 48, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (13, N'Camisón', 150, 9, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (14, N'Conjunto de pijama', 400, 26, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (15, N'Blusa de pijama', 100, 45, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (16, N'Pantalón de pijama', 150, 20, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (17, N'Camisa ejecutiva ', 240, 36, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (18, N'Camisa de flores', 270, 40, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (19, N'Camisa tipo escolar', 290, 59, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (20, N'Camisa con bordado', 300, 10, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (21, N'Tennis suela alta', 550, 9, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (22, N'Zapato de tacón ', 600, 23, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (23, N'Bota alta', 650, 1, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (24, N'Pantuflas', 200, 24, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (25, N'Abrigo largo', 1050, 3, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (26, N'Chamarra pluma de ganso', 1100, 17, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (27, N'Chamarra delgada ', 700, 20, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (28, N'Cazadora', 750, 12, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (29, N'Suéter cerrado', 300, 23, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (30, N'Sudadera deportiva', 450, 45, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (31, N'Suéter tejido', 450, 35, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (32, N'Suéter estampado', 400, 19, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (33, N'Vestido corto de día', 600, 3, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (34, N'Vestido de noche largo ', 1350, 23, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (35, N'Vestido ejecutivo', 1050, 67, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (36, N'Vestido fantasía para niña', 750, 5, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (37, N'Collar', 150, 9, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (38, N'Pulseras', 75, 78, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (39, N'Aretes', 50, 59, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (40, N'Accesorios para el cabello ', 100, 30, 10)
GO
SET IDENTITY_INSERT [dbo].[Sucursales] ON 

INSERT [dbo].[Sucursales] ([Numero], [Nombre_sucursal], [Encargado], [Direccion], [Telefono], [Ciudad], [Estado]) VALUES (1, N'Akira´s boutique: Las Mercedes', N'sonia alejandra fernandez moreno', N'calle roble #507 Fracc.Las mercedes', N'4447831225', N'san luis potosi', N'san luis potosi')
INSERT [dbo].[Sucursales] ([Numero], [Nombre_sucursal], [Encargado], [Direccion], [Telefono], [Ciudad], [Estado]) VALUES (2, N'Akira´s boutique:Obraje', N'fernando calderon ayala', N'calle Dr. jesus diaz de leon #438 col.obraje', N'4493780921', N'aguascalientes', N'aguascalientes')
INSERT [dbo].[Sucursales] ([Numero], [Nombre_sucursal], [Encargado], [Direccion], [Telefono], [Ciudad], [Estado]) VALUES (3, N'Akira´s boutique:Galerias mazatlan', N'daniela fernanda diaz ordaz', N'av. de la marina #6204, marina, local 35', N'6692932059', N'mazatlan', N'sinaloa')
INSERT [dbo].[Sucursales] ([Numero], [Nombre_sucursal], [Encargado], [Direccion], [Telefono], [Ciudad], [Estado]) VALUES (4, N'Akira´s boutique:Zapopan', N'mario alberto jimenez salcido', N'av. manuel j. clouthier 525 col.benito juarez', N'3337841230', N'zapopan', N'jalisco')
INSERT [dbo].[Sucursales] ([Numero], [Nombre_sucursal], [Encargado], [Direccion], [Telefono], [Ciudad], [Estado]) VALUES (5, N'Akira´s boutique:Melchor', N'yesenia guadalupe campos rojo', N'av.melchor ocampo #2528 zona centro', N'6143906721', N'chihuahua', N'chihuahua')
INSERT [dbo].[Sucursales] ([Numero], [Nombre_sucursal], [Encargado], [Direccion], [Telefono], [Ciudad], [Estado]) VALUES (6, N'Akira´s boutique:Constitucion', N'tamara alejandra bernal ramos', N'calle constitucion #106 zona centro', N'6181962954', N'durango', N'durango')
INSERT [dbo].[Sucursales] ([Numero], [Nombre_sucursal], [Encargado], [Direccion], [Telefono], [Ciudad], [Estado]) VALUES (7, N'Akira´s boutique:Centro', N'samuel enrique barrios enciso', N'av.miguel hidalgo #338 zacatecas centro', N'4929301250', N'zacatecas', N'zacatecas')
SET IDENTITY_INSERT [dbo].[Sucursales] OFF
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [id_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [id_producto]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_numero_tienda] FOREIGN KEY([numero_tienda])
REFERENCES [dbo].[Sucursales] ([Numero])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_numero_tienda]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [id_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [id_cliente]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [id_detalle] FOREIGN KEY([id_detalle])
REFERENCES [dbo].[detalle] ([id_detalle])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [id_detalle]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [id_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [id_categoria]
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD  CONSTRAINT [FK_encargado] FOREIGN KEY([Encargado])
REFERENCES [dbo].[Empleados] ([nombre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sucursales] CHECK CONSTRAINT [FK_encargado]
GO
USE [master]
GO
ALTER DATABASE [AkirasBoutiques] SET  READ_WRITE 
GO
