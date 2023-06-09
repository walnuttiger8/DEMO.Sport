USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11.05.2023 1:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 11.05.2023 1:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 11.05.2023 1:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RawAddress] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11.05.2023 1:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NOT NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11.05.2023 1:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11.05.2023 1:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (1, N'Новый', CAST(N'2022-05-21T00:00:00.000' AS DateTime), N'125837, г. Дубна, ул. Шоссейная, 40')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (2, N'Новый ', CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'400562, г. Дубна, ул. Зеленая, 32')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (3, N'Завершен', CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'400562, г. Дубна, ул. Зеленая, 32')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (4, N'Новый ', CAST(N'2022-05-24T00:00:00.000' AS DateTime), N'410542, г. Дубна, ул. Светлая, 46')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (5, N'Новый ', CAST(N'2022-05-25T00:00:00.000' AS DateTime), N'410542, г. Дубна, ул. Светлая, 46')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (6, N'Новый ', CAST(N'2022-05-25T00:00:00.000' AS DateTime), N'394060, г.Дубна, ул. Фрунзе, 43')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (7, N'Завершен', CAST(N'2022-05-27T00:00:00.000' AS DateTime), N'394060, г.Дубна, ул. Фрунзе, 43')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (8, N'Завершен', CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'625590, г. Дубна, ул. Коммунистическая, 20')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (9, N'Новый ', CAST(N'2022-05-29T00:00:00.000' AS DateTime), N'443890, г. Дубна, ул. Коммунистическая, 1')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (10, N'Завершен', CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'443890, г. Дубна, ул. Коммунистическая, 1')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (12, N'Новый', CAST(N'2023-05-10T23:23:46.183' AS DateTime), N'394242, г. Дубна, ул. Коммунистическая, 43')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (13, N'Новый', CAST(N'2023-05-10T23:25:02.603' AS DateTime), N'660540, г. Дубна, ул. Солнечная, 25')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (14, N'Новый', CAST(N'2023-05-10T23:25:53.143' AS DateTime), N'660540, г. Дубна, ул. Солнечная, 25')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (15, N'Новый', CAST(N'2023-05-10T23:26:48.810' AS DateTime), N'625283, г. Дубна, ул. Победы, 46')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (16, N'Новый', CAST(N'2023-05-10T23:28:27.977' AS DateTime), N'614611, г. Дубна, ул. Молодежная, 50')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (17, N'Новый', CAST(N'2023-05-10T23:29:29.780' AS DateTime), N'454311, г.Дубна, ул. Новая, 19')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (18, N'Новый', CAST(N'2023-05-10T23:32:14.837' AS DateTime), N'454311, г.Дубна, ул. Новая, 19')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (19, N'Новый', CAST(N'2023-05-10T23:52:37.003' AS DateTime), N'603002, г. Дубна, ул. Дзержинского, 28')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (20, N'Новый', CAST(N'2023-05-10T23:58:00.853' AS DateTime), N'125703, г. Дубна, ул. Партизанская, 49')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'G598Y6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'А112Т4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'D830R5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'F746E6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'D648N7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'F735B6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (4, N'E324U7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (4, N'F937G4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'D038G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'N483G5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (6, N'C324S5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (6, N'G480F5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (7, N'J4DF5E')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (7, N'V312R4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (8, N'G522B5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (8, N'K432G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (9, N'F047J7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (9, N'S374B5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'D927K3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'N836R5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (12, N'D038G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (12, N'D830R5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (13, N'B538G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (13, N'D648N7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (14, N'C324S5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (14, N'D830R5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (15, N'C324S5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (15, N'D648N7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (16, N'B538G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (16, N'D830R5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (17, N'C324S5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (17, N'D648N7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (18, N'B538G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (18, N'D648N7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (19, N'B538G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (19, N'D830R5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (20, N'B538G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (20, N'D830R5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (20, N'N892G6')
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] ON 

INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (1, N'344288, г. Дубна, ул. Чехова, 1')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (2, N'614164, г.Дубна,  ул. Степная, 30')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (3, N'394242, г. Дубна, ул. Коммунистическая, 43')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (4, N'660540, г. Дубна, ул. Солнечная, 25')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (5, N'125837, г. Дубна, ул. Шоссейная, 40')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (6, N'125703, г. Дубна, ул. Партизанская, 49')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (7, N'625283, г. Дубна, ул. Победы, 46')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (8, N'614611, г. Дубна, ул. Молодежная, 50')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (9, N'454311, г.Дубна, ул. Новая, 19')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (10, N'660007, г.Дубна, ул. Октябрьская, 19')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (11, N'603036, г. Дубна, ул. Садовая, 4')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (12, N'450983, г.Дубна, ул. Комсомольская, 26')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (13, N'394782, г. Дубна, ул. Чехова, 3')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (14, N'603002, г. Дубна, ул. Дзержинского, 28')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (15, N'450558, г. Дубна, ул. Набережная, 30')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (16, N'394060, г.Дубна, ул. Фрунзе, 43')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (17, N'410661, г. Дубна, ул. Школьная, 50')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (18, N'625590, г. Дубна, ул. Коммунистическая, 20')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (19, N'625683, г. Дубна, ул. 8 Марта')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (20, N'400562, г. Дубна, ул. Зеленая, 32')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (21, N'614510, г. Дубна, ул. Маяковского, 47')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (22, N'410542, г. Дубна, ул. Светлая, 46')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (23, N'620839, г. Дубна, ул. Цветочная, 8')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (24, N'443890, г. Дубна, ул. Коммунистическая, 1')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (25, N'603379, г. Дубна, ул. Спортивная, 46')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (26, N'603721, г. Дубна, ул. Гоголя, 41')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (27, N'410172, г. Дубна, ул. Северная, 13')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (28, N'420151, г. Дубна, ул. Вишневая, 32')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (29, N'125061, г. Дубна, ул. Подгорная, 8')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (30, N'630370, г. Дубна, ул. Шоссейная, 24')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (31, N'614753, г. Дубна, ул. Полевая, 35')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (32, N'426030, г. Дубна, ул. Маяковского, 44')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (33, N'450375, г. Дубна ул. Клубная, 44')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (34, N'625560, г. Дубна, ул. Некрасова, 12')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (35, N'630201, г. Дубна, ул. Комсомольская, 17')
INSERT [dbo].[PickUpPoint] ([Id], [RawAddress]) VALUES (36, N'190949, г. Дубна, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PickUpPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B538G6', N'Спортивный костюм', N'Спортивный костюм playToday (футболка + шорты)', N'Одежда', 0x, N'playToday', CAST(839.0000 AS Decimal(19, 4)), 3, 17, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C324S5', N'Шлем', N'Шлем г.л./сноуб. Salomon Grom р.:KS черный (L40836800)', N'Спортивный инвентарь', 0x, N'Salomon', CAST(4000.0000 AS Decimal(19, 4)), 5, 16, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D038G6', N'Лыжный комплект', N'Лыжный комплект беговые NORDWAY XC Classic, 45-45-45мм, 160см', N'Спортивный инвентарь', 0x, N'Nordway', CAST(3000.0000 AS Decimal(19, 4)), 4, 23, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D648N7', N'Набор для хоккея', N'Набор для хоккея Совтехстром', N'Спортивный инвентарь', 0x, N'Совтехстром', CAST(350.0000 AS Decimal(19, 4)), 4, 7, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D830R5', N'Тренажер прыжков', N'Тренажер для прыжков Moby Kids Moby-Jumper со счетчиком', N'Спортивный инвентарь', 0x, N'Moby Kids', CAST(1120.0000 AS Decimal(19, 4)), 4, 8, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D893W4', N'Мяч', N'Мяч футбольный DEMIX 1STLS1JWWW, универсальный, 4-й размер, белый/зеленый', N'Спортивный инвентарь', 0x, N'Demix', CAST(900.0000 AS Decimal(19, 4)), 2, 5, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D927K3', N'Перчатки ', N'Перчатки Starfit SU-125 атлетические S черный', N'Спортивный инвентарь', 0x, N'Starfit', CAST(660.0000 AS Decimal(19, 4)), 4, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E324U7', N'Велотренажер', N'Велотренажер двойной DFC B804 dual bike', N'Спортивный инвентарь', 0x, N'DFC', CAST(6480.0000 AS Decimal(19, 4)), 5, 5, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F047J7', N'Коврик', N'Коврик Bradex для мягкой йоги дл.:1730мм ш.:610мм т.:3мм серый', N'Спортивный инвентарь', 0x, N'Bradex', CAST(720.0000 AS Decimal(19, 4)), 5, 11, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F687G5', N'Защита голени', N'Защита голени GREEN HILL Panther, L, синий/черный', N'Спортивный инвентарь', 0x, N'Green Hill', CAST(1900.0000 AS Decimal(19, 4)), 4, 6, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F735B6', N'Игровой набор', N'Игровой набор Совтехстром Кегли и шары', N'Спортивный инвентарь', 0x, N'Совтехстром', CAST(320.0000 AS Decimal(19, 4)), 2, 9, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F746E6', N'Шведская стенка', N'Шведская стенка ROMANA Next, pastel', N'Спортивный инвентарь', 0x, N'ROMANA Next', CAST(9900.0000 AS Decimal(19, 4)), 3, 5, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F937G4', N'Игровой набор', N'Набор Abtoys Бадминтон и теннис ', N'Спортивный инвентарь', 0x, N'Abtoys', CAST(480.0000 AS Decimal(19, 4)), 4, 12, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'FJK123', N'Наименование', N'', N'Категория', 0x, N'Поставщик1', CAST(120.0000 AS Decimal(19, 4)), NULL, 0, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G403T5', N'Тюбинг', N'Тюбинг Nordway, 73 см', N'Спортивный инвентарь', 0x, N'Nordway', CAST(1450.0000 AS Decimal(19, 4)), 4, 13, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G480F5', N'Ролики', N'Коньки роликовые Ridex Cricket жен. ABEC 3 кол.:72мм р.:39-42 синий', N'Спортивный инвентарь', 0x, N'Ridex', CAST(1600.0000 AS Decimal(19, 4)), 4, 7, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G522B5', N'Ласты', N'Ласты Colton CF-02 для плавания р.:33-34 серый/голубой', N'Спортивный инвентарь', 0x, N'Colton', CAST(1980.0000 AS Decimal(19, 4)), 3, 6, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G598Y6', N'Спортивный мат', N'Спортивный мат 100x100x10 см Perfetto Sport № 3 бежевый', N'Спортивный инвентарь', 0x, N'Perfetto Sport', CAST(2390.0000 AS Decimal(19, 4)), 2, 16, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G873H4', N'Велосипед', N'Велосипед SKIF 29 Disc (2021), горный (взрослый), рама: 17", колеса: 29", темно-серый', N'Спортивный инвентарь', 0x, N'SKIF', CAST(14930.0000 AS Decimal(19, 4)), 4, 6, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J4DF5E', N'Насос', N'Насос Molten HP-18-B для мячей мультиколор', N'Спортивный инвентарь', 0x, N'Molten', CAST(300.0000 AS Decimal(19, 4)), 4, 12, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J532D4', N'Перчатки для карате', N'Перчатки для каратэ Green Hill KMС-6083 L красный', N'Спортивный инвентарь', 0x, N'Green Hill', CAST(1050.0000 AS Decimal(19, 4)), 3, 5, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K432G6', N'Шапочка для плавания', N'Шапочка для плавания Atemi PU 140 ткань с покрытием желтый', N'Спортивный инвентарь', 0x, N'Atemi', CAST(440.0000 AS Decimal(19, 4)), 5, 17, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K937A5', N'Гиря', N'Гиря Starfit ГМБ4 мягкое 4кг синий/оранжевый', N'Спортивный инвентарь', 0x, N'Starfit', CAST(890.0000 AS Decimal(19, 4)), 4, 10, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N483G5', N'Клюшка', N'Клюшка Nordway NDW300 (2019/2020) SR лев. 19 150см', N'Спортивный инвентарь', 0x, N'Nordway', CAST(1299.0000 AS Decimal(19, 4)), 3, 4, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N836R5', N'Коньки', N'Коньки ATEMI AKSK01DXS, раздвижные, прогулочные, унисекс, 27-30, черный/зеленый', N'Спортивный инвентарь', 0x, N'Atemi', CAST(2000.0000 AS Decimal(19, 4)), 3, 16, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N892G6', N'Очки для плавания', N'Очки для плавания Atemi N8401 синий', N'Спортивный инвентарь', 0x, N'Atemi', CAST(500.0000 AS Decimal(19, 4)), 5, 14, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S374B5', N'Ролик для йоги', N'Ролик для йоги Bradex Туба d=14см ш.:33см оранжевый', N'Спортивный инвентарь', 0x, N'Bradex', CAST(700.0000 AS Decimal(19, 4)), 3, 12, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V312R4', N'Мяч', N'Мяч волейбольный MIKASA VT370W, для зала, 5-й размер, желтый/синий', N'Спортивный инвентарь', 0x, N'Mikasa', CAST(4150.0000 AS Decimal(19, 4)), 2, 5, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V392H7', N'Степ-платформа', N'Степ-платформа Starfit SP-204 серый/черный', N'Спортивный инвентарь', 0x, N'Starfit', CAST(4790.0000 AS Decimal(19, 4)), 3, 15, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V423D4', N'Штанга', N'Штанга Starfit BB-401 30кг пласт. черный ', N'Спортивный инвентарь', 0x, N'Starfit', CAST(5600.0000 AS Decimal(19, 4)), 3, 8, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'А112Т4', N'Боксерская груша', N'Боксерская груша X-Match черная', N'Спортивный инвентарь', 0x, N'X-Match', CAST(778.0000 AS Decimal(19, 4)), 5, 6, N'')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Никифоров ', N'Всеволод Иванович', N'', N'loginDEjrm2018', N'Cpb+Im', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Воронов ', N'Донат Никитевич', N'', N'loginDEpxl2018', N'P6h4Jq', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Игнатьева ', N'Евгения Валентиновна', N'', N'loginDEwgk2018', N'&mfI9l', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Буров ', N'Федот Егорович', N'', N'loginDEpou2018', N'gX3f5Z', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Иван ', N'Семёновна', N'', N'loginDEjwl2018', N'D4ZYHt', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Денисов ', N'Дамир Филатович', N'', N'loginDEabf2018', N'*Tasm+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Ершов ', N'Максим Геласьевич', N'', N'loginDEwjm2018', N'k}DJKo', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Копылов ', N'Куприян Пётрович', N'', N'loginDEjvz2018', N'&|bGTy', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Носов ', N'Валерьян Дмитрьевич', N'', N'loginDEuyv2018', N'8hhrZ}', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Силин ', N'Игорь Авдеевич', N'', N'loginDExdm2018', N'DH68L9', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Дроздова ', N'Александра Мартыновна', N'', N'loginDEeiv2018', N'H*BxlS', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Дроздов ', N'Аркадий Геласьевич', N'', N'loginDEfuc2018', N'VuM+QT', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Боброва ', N'Варвара Евсеевна', N'', N'loginDEoot2018', N'usi{aT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Чернова ', N'Агата Данииловна', N'', N'loginDElhk2018', N'Okk0jY', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Лыткина ', N'Ульяна Станиславовна', N'', N'loginDEazg2018', N's3bb|V', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Лаврентьев ', N'Леонид Игнатьевич', N'', N'loginDEaba2018', N'#NAME?', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Кулаков ', N'Юрий Владленович', N'', N'loginDEtco2018', N'tTKDJB', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Соловьёв ', N'Андрей Александрович', N'', N'loginDEsyq2018', N'2QbpBN', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Корнилова ', N'Марфа Макаровна', N'', N'loginDEpxi2018', N'+5X&hy', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Белоусова ', N'Любовь Георгьевна', N'', N'loginDEicr2018', N'3+|Sn{', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Анисимов ', N'Никита Гордеевич', N'', N'loginDEcui2018', N'Zi1Tth', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Стрелкова ', N'Фаина Федосеевна', N'', N'loginDEpxc2018', N'G+nFsv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Осипов ', N'Евгений Иванович', N'', N'loginDEqrd2018', N'sApUbt', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Владимирова ', N'Иванна Павловна', N'', N'loginDEsso2018', N'#NAME?', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Кудрявцева ', N'Жанна Демьяновна', N'', N'loginDErsy2018', N'{Aa6nS', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Матвиенко ', N'Яков Брониславович', N'', N'loginDEvpz2018', N'mS0UxK', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Селезнёв ', N'Егор Артёмович', N'', N'loginDEfog2018', N'glICay', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Брагин ', N'Куприян Митрофанович', N'', N'loginDEpii2018', N'Ob}RZB', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Гордеев ', N'Виктор Эдуардович', N'', N'loginDEhyk2018', N'*gN}Tc', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Мартынов ', N'Онисим Брониславович', N'', N'loginDEdxi2018', N'ywLUbA', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Никонова ', N'Евгения Павловна', N'', N'loginDEzro2018', N'B24s6o', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Полякова ', N'Анна Денисовна', N'', N'loginDEuxg2018', N'K8jui7', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Макарова ', N'Пелагея Антониновна', N'', N'loginDEllw2018', N'jNtNUr', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Андреева ', N'Анна Вячеславовна', N'', N'loginDEddg2018', N'gGGhvD', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Кудрявцева ', N'Кира Ефимовна', N'', N'loginDEpdz2018', N'#NAME?', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Шилова ', N'Кира Егоровна', N'', N'loginDEyiw2018', N'cnj3QR', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Ситников ', N'Игорь Борисович', N'', N'loginDEqup2018', N'95AU|R', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Русаков ', N'Борис Христофорович', N'', N'loginDExil2018', N'w+++Ht', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Капустина ', N'Ульяна Игоревна', N'', N'loginDEkuv2018', N'Ade++|', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Беляков ', N'Семён Германнович', N'', N'loginDEmox2018', N'Je}9e7', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Гурьев ', N'Ириней Игнатьевич', N'', N'loginDEvug2018', N'lEa{Cn', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Мишин ', N'Христофор Леонидович', N'', N'loginDEzre2018', N'N*VX+G', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Лазарева ', N'Антонина Христофоровна', N'', N'loginDEbes2018', N'NaVtyH', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Маркова ', N'Ираида Сергеевна', N'', N'loginDEkfg2018', N'r1060q', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Носкова ', N'Пелагея Валерьевна', N'', N'loginDEyek2018', N'KY2BL4', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Баранов ', N'Станислав Дмитрьевич', N'', N'loginDEloq2018', N'NZV5WR', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Ефремов ', N'Демьян Артёмович', N'', N'loginDEjfb2018', N'TNT+}h', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Константинов ', N'Всеволод Мэлсович', N'', N'loginDEueq2018', N'GqAUZ6', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Ситникова ', N'Ираида Андреевна', N'', N'loginDEpqz2018', N'F0Bp7F', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Матвеев ', N'Кондрат Иванович', N'', N'loginDEovk2018', N'JyJM{A', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
