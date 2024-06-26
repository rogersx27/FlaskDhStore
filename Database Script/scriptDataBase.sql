USE [master]
GO
/****** Object:  Database [DhStoreNEW]    Script Date: 27/03/2024 ******/
CREATE DATABASE [DhStoreNEW]
GO
ALTER DATABASE [DhStoreNEW] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DhStoreNEW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DhStoreNEW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DhStoreNEW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DhStoreNEW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DhStoreNEW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DhStoreNEW] SET ARITHABORT OFF 
GO
ALTER DATABASE [DhStoreNEW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DhStoreNEW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DhStoreNEW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DhStoreNEW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DhStoreNEW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DhStoreNEW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DhStoreNEW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DhStoreNEW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DhStoreNEW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DhStoreNEW] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DhStoreNEW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DhStoreNEW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DhStoreNEW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DhStoreNEW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DhStoreNEW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DhStoreNEW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DhStoreNEW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DhStoreNEW] SET RECOVERY FULL 
GO
ALTER DATABASE [DhStoreNEW] SET  MULTI_USER 
GO
ALTER DATABASE [DhStoreNEW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DhStoreNEW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DhStoreNEW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DhStoreNEW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DhStoreNEW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DhStoreNEW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DhStoreNEW', N'ON'
GO
ALTER DATABASE [DhStoreNEW] SET QUERY_STORE = ON
GO
ALTER DATABASE [DhStoreNEW] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DhStoreNEW]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 27/03/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[id_admin] [int] IDENTITY(1,1) NOT NULL,
	[id_user_fk] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[id_categoria] [int] NOT NULL,
	[nom_categoria] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[id_user_fk] [int] NOT NULL,
	[id_identificacion_fk] [int] NOT NULL,
	[num_identificacion] [int] NOT NULL,
	[direccion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_factura]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_factura](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_factura_fk] [int] NOT NULL,
	[cod_producto_fk] [varchar](50) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente_fk] [int] NOT NULL,
	[fecha_compra] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logisticos]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logisticos](
	[id_logistico] [int] IDENTITY(1,1) NOT NULL,
	[id_user_fk] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_logistico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[cod_producto] [varchar](50) NOT NULL,
	[producto] [varchar](100) NOT NULL,
	[id_categoria_fk] [int] NOT NULL,
	[precio_unitario] [float] NOT NULL,
	[imgURL] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_identificacion]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_identificacion](
	[id_identificacion] [int] IDENTITY(1,1) NOT NULL,
	[tipo_identificacion] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[ciudad] [varchar](50) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[pssword] [varchar](50) NOT NULL,
	[TOKEN] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[facturas] ADD  DEFAULT (getdate()) FOR [fecha_compra]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[admins]  WITH CHECK ADD  CONSTRAINT [id_user_fk] FOREIGN KEY([id_user_fk])
REFERENCES [dbo].[usuarios] ([id_user])
GO
ALTER TABLE [dbo].[admins] CHECK CONSTRAINT [id_user_fk]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [id_identificacion_fk] FOREIGN KEY([id_identificacion_fk])
REFERENCES [dbo].[tipo_identificacion] ([id_identificacion])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [id_identificacion_fk]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [id_user_fk3] FOREIGN KEY([id_user_fk])
REFERENCES [dbo].[usuarios] ([id_user])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [id_user_fk3]
GO
ALTER TABLE [dbo].[detalle_factura]  WITH CHECK ADD  CONSTRAINT [cod_producto_fk] FOREIGN KEY([cod_producto_fk])
REFERENCES [dbo].[productos] ([cod_producto])
GO
ALTER TABLE [dbo].[detalle_factura] CHECK CONSTRAINT [cod_producto_fk]
GO
ALTER TABLE [dbo].[detalle_factura]  WITH CHECK ADD  CONSTRAINT [id_factura_fk] FOREIGN KEY([id_factura_fk])
REFERENCES [dbo].[facturas] ([id_factura])
GO
ALTER TABLE [dbo].[detalle_factura] CHECK CONSTRAINT [id_factura_fk]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [id_cliente_fk] FOREIGN KEY([id_cliente_fk])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [id_cliente_fk]
GO
ALTER TABLE [dbo].[logisticos]  WITH CHECK ADD  CONSTRAINT [id_user_fk2] FOREIGN KEY([id_user_fk])
REFERENCES [dbo].[usuarios] ([id_user])
GO
ALTER TABLE [dbo].[logisticos] CHECK CONSTRAINT [id_user_fk2]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [id_categoria_fk] FOREIGN KEY([id_categoria_fk])
REFERENCES [dbo].[categorias] ([id_categoria])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [id_categoria_fk]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_admin]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_add_admin]
    @id_user int
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar el administrador en la tabla
    INSERT INTO admins(id_user_fk)
    VALUES (@id_user);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_add_category]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_category]
@id_categoria int,
@nom_categoria varchar(100)
as
insert into categorias(id_categoria, nom_categoria)
values (@id_categoria, @nom_categoria)
GO
/****** Object:  StoredProcedure [dbo].[sp_add_client]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_client]
@id_user_fk int,
@id_identificacion_fk int,
@num_identificacion int,
@direccion varchar (250)
AS
INSERT INTO cliente(id_user_fk, id_identificacion_fk, num_identificacion, direccion)
VALUES (@id_user_fk, @id_identificacion_fk, @num_identificacion, @direccion)
GO
/****** Object:  StoredProcedure [dbo].[sp_add_detail_invoice]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_detail_invoice]
    @id_factura_fk int,
    @cod_producto_fk varchar(50),
    @cantidad int
AS
BEGIN
    DECLARE @precio_unitario float
    DECLARE @precio_total float

    -- Obtener el precio unitario del producto
    SELECT @precio_unitario = precio_unitario
    FROM productos
    WHERE cod_producto = @cod_producto_fk

    -- Calcular el precio total
    SET @precio_total = @precio_unitario * @cantidad

    -- Insertar el detalle de la factura
    INSERT INTO detalle_factura (id_factura_fk, cod_producto_fk, cantidad, precio_total)
    VALUES (@id_factura_fk, @cod_producto_fk, @cantidad, @precio_total)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_add_invoice]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_invoice]
@id_cliente_fk int
as
INSERT INTO facturas(id_cliente_fk)
VALUES (@id_cliente_fk)
GO
/****** Object:  StoredProcedure [dbo].[sp_add_logistic]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_logistic]
    @id_user int
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO logisticos(id_user_fk)
    VALUES (@id_user);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_add_type_id]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_add_type_id]
@tipo_identificacion varchar(10)
as
insert into tipo_identificacion(tipo_identificacion)
values (@tipo_identificacion)
GO
/****** Object:  StoredProcedure [dbo].[sp_consult_invoices]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_consult_invoices]
AS
BEGIN
    SELECT f.id_factura, c.num_identificacion, u.nombre, u.apellido, p.producto, df.cantidad, df.precio_total
    FROM facturas f
    INNER JOIN cliente c ON f.id_cliente_fk = c.id_cliente
    INNER JOIN usuarios u ON c.id_user_fk = u.id_user
    INNER JOIN detalle_factura df ON f.id_factura = df.id_factura_fk
    INNER JOIN productos p ON df.cod_producto_fk = p.cod_producto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consult_products]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_consult_products]
AS
SELECT cod_producto, producto, precio_unitario, nom_categoria FROM productos
INNER JOIN categorias as c ON c.id_categoria = productos.id_categoria_fk
GO
/****** Object:  StoredProcedure [dbo].[sp_consult_user_invoices]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_consult_user_invoices]
    @id_usuario int
AS
BEGIN
    SELECT f.id_factura, c.num_identificacion, u.nombre, u.apellido, p.producto, df.cantidad, df.precio_total
    FROM facturas f
    INNER JOIN cliente c ON f.id_cliente_fk = c.id_cliente
    INNER JOIN usuarios u ON c.id_user_fk = u.id_user
    INNER JOIN detalle_factura df ON f.id_factura = df.id_factura_fk
    INNER JOIN productos p ON df.cod_producto_fk = p.cod_producto
    WHERE u.id_user = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consult_users]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_consult_users]
AS
SELECT * FROM usuarios
GO
/****** Object:  StoredProcedure [dbo].[sp_count_data]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_count_data] (
    @table NVARCHAR(50)
)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = 'SELECT COUNT(*) FROM ' + QUOTENAME(@table);
    EXEC sp_executesql @sql;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_product]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_product] (

	@code_product varchar(10),
	@product varchar(100),
	@price float,
	@id_category int,
	@imgURL varchar(250)
)
AS
INSERT INTO productos(cod_producto,producto,precio_unitario,id_categoria_fk,imgURL)
VALUES (@code_product, @product, @price, @id_category, @imgURL)
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_users]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_users](
	@name varchar(50),
	@lastname varchar(50),
	@phone varchar(20),
	@email varchar(100),
	@city varchar(100),
	@country varchar(100),
	@password varchar(50),
	@TOKEN varchar(250)
)
AS
INSERT INTO usuarios(nombre, apellido, telefono, email, ciudad, pais, pssword, TOKEN)
VALUES (@name, @lastname, @phone, @email, @city, @country, @password, @TOKEN)
GO
/****** Object:  StoredProcedure [dbo].[sp_last_code_product]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_last_code_product]
AS
SELECT TOP 1 cod_producto FROM productos
ORDER BY cod_producto DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_products_by_categories]    Script Date: 27/03/2024 16:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_products_by_categories] (
	@id_categoria int
)
AS
select nom_categoria, producto from categorias
inner join productos on productos.id_categoria_fk = categorias.id_categoria
where id_categoria = @id_categoria
GO
USE [master]
GO
ALTER DATABASE [DhStoreNEW] SET  READ_WRITE 
GO
