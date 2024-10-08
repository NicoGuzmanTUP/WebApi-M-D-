USE [Facturacion]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 24/9/2024 11:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio_unitario] [money] NOT NULL,
	[descripcion] [varchar](52) NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_facturas]    Script Date: 24/9/2024 11:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_facturas](
	[cod_detalle_factura] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[nro_factura] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Detalles_facturas] PRIMARY KEY CLUSTERED 
(
	[cod_detalle_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 24/9/2024 11:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[nroFactura] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cliente] [varchar](50) NOT NULL,
	[forma_pago] [int] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[nroFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formas_pagos]    Script Date: 24/9/2024 11:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[formas_pagos](
	[id_forma_pago] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_formas_pagos] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detalles_facturas]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_facturas_Articulos] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulos] ([id_articulo])
GO
ALTER TABLE [dbo].[Detalles_facturas] CHECK CONSTRAINT [FK_Detalles_facturas_Articulos]
GO
ALTER TABLE [dbo].[Detalles_facturas]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_facturas_Facturas] FOREIGN KEY([nro_factura])
REFERENCES [dbo].[Facturas] ([nroFactura])
GO
ALTER TABLE [dbo].[Detalles_facturas] CHECK CONSTRAINT [FK_Detalles_facturas_Facturas]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_formas_pagos] FOREIGN KEY([forma_pago])
REFERENCES [dbo].[formas_pagos] ([id_forma_pago])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_formas_pagos]
GO
