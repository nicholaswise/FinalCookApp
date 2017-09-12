USE [master]
GO
/****** Object:  Database [CookingSiteDB]    Script Date: 9/12/2017 10:20:42 AM ******/
CREATE DATABASE [CookingSiteDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CookingSiteDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CookingSiteDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CookingSiteDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CookingSiteDB_log.ldf' , SIZE = 1856KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CookingSiteDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CookingSiteDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CookingSiteDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CookingSiteDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CookingSiteDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CookingSiteDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CookingSiteDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CookingSiteDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CookingSiteDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CookingSiteDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CookingSiteDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CookingSiteDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CookingSiteDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CookingSiteDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CookingSiteDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CookingSiteDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CookingSiteDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CookingSiteDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CookingSiteDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CookingSiteDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CookingSiteDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CookingSiteDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CookingSiteDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CookingSiteDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CookingSiteDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CookingSiteDB] SET  MULTI_USER 
GO
ALTER DATABASE [CookingSiteDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CookingSiteDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CookingSiteDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CookingSiteDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CookingSiteDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CookingSiteDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/12/2017 10:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/12/2017 10:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/12/2017 10:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/12/2017 10:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/12/2017 10:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/12/2017 10:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 9/12/2017 10:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[FavoriteID] [int] IDENTITY(1,1) NOT NULL,
	[TermID] [int] NOT NULL,
	[Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[FavoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Terms]    Script Date: 9/12/2017 10:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terms](
	[TermID] [int] IDENTITY(1,1) NOT NULL,
	[TermName] [nvarchar](50) NOT NULL,
	[TermDef] [nvarchar](500) NOT NULL,
	[TermInfo] [nvarchar](500) NULL,
	[TermPicture] [nvarchar](500) NULL,
	[TermVideo] [nvarchar](500) NULL,
	[IsMatch] [bit] NULL,
	[IsLiked] [bit] NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201709011423365_InitialCreate', N'CookingSite.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D05376E1B47CD919CC1AED044EDBCE1A3BBE60DA13E46DC096D86D6124529128C7C6225F96877C527E618B1275E345976EB9BB1D0408A6C5E261B17848168B45FFF9FB1FD3EF9FC3C07AC271E25372661F4D0E6D0B13977A3E599DD9295B7EFBC1FEFEBBBFFF6D7AE985CFD64F85DC0997839A2439B31F198B4E1D27711F71889249E8BB314DE8924D5C1A3AC8A3CEF1E1E1BF9DA3230703840D589635FD9412E68738FB013F6794B83862290A6EA88783447C879279866ADDA210271172F1993DA3F42B2837F7199EE4D2B6751EF8083499E360695B8810CA10033D4F3F2778CE620AD2117C40C1C34B84416E8982040BFD4F2BF1BE5D393CE65D71AA8A05949B268C8603018F4E846D1CB9FA5A16B64BDB81F52EC1CAEC85F73AB3E0997DEDE1ECD3271A8001E4064F6741CC85CFEC9BB289F324BAC56C52549CE4905731C0FD4AE3AF933AE281D5BBDE41C9A5E3C921FFEFC09AA5014B637C4670CA62141C58F7E922F0DDFFE29707FA1593B393A3C5F2E4C3BBF7C83B79FF2F7CF2AEDE53E82BC8353EC0A7FB98463806DDF0B2ECBF6D39CD7A8E5CB1AC56AB935B05B804CCB3AD1BF4FC1193157B840973FCC1B6AEFC67EC155F04B93E131F66115462710A3F6FD320408B0097E54E6B9BFCFF2DAD1EBF7B3F4AABB7E8C95F65432FB50F13278679F509075969F2E847F9F46A8CF717217615D390FF6EF22B2FFD32A769ECF2CE50A3C8038A579835B59B3A15797B519A438D4FEB0275FFA9CD3555E9AD15E51D5A6726144D6C7B3614FABE6EBBBD19771E45307819B5B845DA08A76E5613A93690A392A9A873D4973A04BAF4575E092F43E407232C853D5A012F64E9C7212E7BF90305E2213258E77B9424B01278FF41C9638BEAF0CF11549F63378D81A07386C2E8D55BBB7FA404DFA6E182F37E7B6D8D36340FBFD22BE4321A5F125E6B63BC8FD4FD4A537649BC0BC4F067E61680FCE7831FF60718459D73D7C549720564C6DE8C82935D005E1376723C188E2F50BB76456601F243BD2F222DA55F0AD1CA1FD14B283E89414CE797B4A9FA91AE7CD24FD542D4AC6A2ED1A9AA101BAA2A07EBA7A990342B9A0974EA994B8DE6E9652334BEAB97C1EEBFAFB7D9E66D5A0B6A669CC30A897FC404C7B08C79F788311C936A04FAAC1BBB7016B2E1E38DBEFADE94B5F4130AD2B19B5A6B36648BC0F8B32183DDFFD990A9099F9F7C8F7B253D0E408530C0F792D79FADBAE79CA4D9B6A743A39BDB6E7C3B6B8069BA9C270975FD6C1668425F2270D1D41F7C38AB3B8A91F7468E8440C780E83EDFF2E00BF4CD964975472E708019B6CEDD3C343843898B3CD58CD0216F8062C58EAA51AC8A883495FBA7D226301DC7BC12E287A00466AA4F983A2D7CE2FA110A3AAD24D5ECB985F1BE976DC8251738C28437D869893E8DEB03205C81B21D6950BA2C34756A8C6B27A2C16B358D79970B5B8DBB1297D80A273B7C67032F85FFF62AC46CB7D816C8D96E923E0A188379BB20A838ABF425807C70D937824A27260341854BB51582362DB60382364DF2E6089A1F51FB8EBF745EDD377A360FCADBDFD65BCDB5036E36ECB167D4CC7D4FA8C3A0068E557A5E2C78217E669AC319E829CE67897075658A70F03966CD904DE5EF6AFD50A71D4426511B6045B40E50710DA80029136A8072452CAF553BE1450C802DE26EADB062ED97606B1C50B1EBD7A13541F3A5A94CCE5EA78FB267251B1492F73A2CD47034849017AF66C77B18C51497550DD3C7171EE20DD73A2606A3C5401D9EABC148456746B75241CD6E2BE91CB2212ED9465692DC2783958ACE8C6E25C1D16E23699C82016EC146266A6EE1234DB622D251EE3665D9D4C9B3A4C487A96348A79ADEA028F2C9AA965E25BE5873915BF5ED7C78D2519863386EA2C93D2AB52D5B6234462B2C95F29B720F5FF971C22E10430BC4E33C332F54C4B47BAB61F92F9AAC6F9FEA2016FB4021CDFF2D62BCEAE57D63AF559D118171053D0CB9479385D135E3AFAF6EF1743714A05813B99FD1200D89D9C132D7CEEFEFEAF5F32F2AC2D491F4571C28C55A8A9BDB347DAF815127C5488354FA2FEB0F9419C264EEC2FBAC1BDCE4919A518A00551DC514B4DAD9C0991C99418325FB88C3C7AA13E175E695484CA903884F03316AB90D0A58ADAC3F6A33FDA48ED92CE98F28E598D421A5A2015AD633491A4AD60BD6C23358542FD1BF053577A48EAE96F647D66491D4A135C56B606B7496CBFAA36A124DEAC09AE2FED855D689BC88EEF1CE653CB9ACBD75E587DBCDF62E03C6EBAC88E36C7DB53BFC3A50EDF3402C714BAF8089EF7BC926E3096F6D36E5318DCDD864C030AF3C8DDBEFE6C2D37A656FC66C5C693716F7B62B7D33DE30CEBE2A3394039E2C52B65E1EF4A403DD541CAEFA3CA2914E5BB9886D1566848DFD2561389C7081C9FC976016F8982FE385C00D22FE12272C4FE3B08F0F8F8EA57738FBF326C649122FD01C4E4D0F639A63B6858C2CF28462F711C56A7EC406EF462A5025F47C4D3CFC7C66FF2FAB759A4531F8BFB2CF07D675F299F8BFA450F010A7D8FA4DCDF71C278FBEFD90B5A7AF1EFA5BF5FAE72F79D503EB2E8619736A1D4AB65C67849B6F2106699357DD409BB55F48BCDD09D5787EA0459526C4FAAF0D163E1BE5A541A1E537217AFEC750D5B4AF093642D4BC18180B6F14139A5E04AC83657C0DE0C14F96BD0618D659FDEB80755433BE0CF0C97030F95D40FF65A8A8B9C3AD467326DAC69294D9B933AF7AA324CB5DEF4D4AFAF546135D4DB11E00B7411AF51ACC786319C8A3ED8E9A04E3D1B07749ED57CF2ADE9744E22AC563B7F9C3DB4C196EB916FA4B650AEF416E9B265767F7F9C0DBE69A298EBBE74995C3B27EF78C6C22836BF7B9BDDB269B29CCBBE7641B94C1BB675CDBD5FEB963A6F5DE42779E8FABA61619EE6374B1E0AE7CDB3C700E27FC050512E41E65FE4C529FE0D5969CDAD16025626ED49C592637AC4C1CA55D45A2BDD9617D151B7E6B67854C7BB3867CCCB6B6C5FADFDAB690696FDB90E5B88B4C616D9EA12E7BBB631D6B4B827A4B99C18D9E7424A277F9ACAD97EB6F29117814A334668FE18EF8EDE4FD8E629231A7CE803C5FF5BA17F6CEDA5F5684FD3BF1571504FF3B8B04BB8D5DB394B9264B5A6CDE9246858814A1B9C10C79B0A59EC7CC5F229741318F3167EFBCB3B81DBFE95860EF9ADCA52C4A197419878BA011F0E24E405BFB59327353E7E95D94FDC99231BA006AFA3C367F477E48FDC02BF5BED2C4840C10DCBB10115D3E968C4776572F25D22D253D8184F94AA7E80187510060C91D99A327BC8E6E40BF8F7885DC972A026802E91E88A6D9A7173E5AC5284C0446551F7E0287BDF0F9BBFF03B92A3FFE60540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9fb4359e-c93c-4969-b52b-39764f7f9457', N's.born.newton@gmail.com', 0, N'AEQ3EfMFOmQnG8tail9qrZ5yqPjwS925nZksOP+wWzsjrsvIX+78d5e5YbSSIXJBCg==', N'62c980da-28ef-4454-9424-69a0acca63d4', NULL, 0, 0, NULL, 1, 0, N's.born.newton@gmail.com')
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([FavoriteID], [TermID], [Id]) VALUES (13, 17, N'9fb4359e-c93c-4969-b52b-39764f7f9457')
INSERT [dbo].[Favorites] ([FavoriteID], [TermID], [Id]) VALUES (14, 4, N'9fb4359e-c93c-4969-b52b-39764f7f9457')
INSERT [dbo].[Favorites] ([FavoriteID], [TermID], [Id]) VALUES (15, 1, N'9fb4359e-c93c-4969-b52b-39764f7f9457')
SET IDENTITY_INSERT [dbo].[Favorites] OFF
SET IDENTITY_INSERT [dbo].[Terms] ON 

INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (1, N'Batter', N'A preparation of liquid, eggs, and flour that can be used for pastries or coating foods. ', N'Thickness of the batter may range from very heavy (adhering to an upturned spoon) to thin Heat is applied to the batter, usually by frying or baking in order to cook the ingredients and to set the batter into a solid form. ', N'/images/batter.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (2, N'Bonito', N'Dried, fermented, and smoked young tuna flakes.', N'Bonito flakes’ distinct umami taste comes from its high inosinic acid content. Traditionally made bonito, also known as karebushi,and katsuobushi, is deliberately planted with Aspergillus glaucus fungus in order to reduce moisture. Katsuobushi has also been shown to impart a kokumi flavour. Upon being placed on hot food, the heat waves cause the thin and light bonito to move.', N'/images/bonito.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (3, N'Browned', N'To apply heat to food, denaturing the sugars adding color and flavor.', N'The browning of food is achieved via the Maillard reaction. A chemical reaction between amino acids and reducing sugars that gives browned food its distinctive flavor. Seared steaks, roasted meats, baked goods, and many other foods undergo this reaction.', N'\Images\browned.jpeg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (4, N'Chopped', N'Roughly cut with to uniform shape or size.', NULL, N'/images/chop.png', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (5, N'Chorizo', N'A Spanish pork sausage made from chopped pork, intestines, fat, and paperika.   ', N'There are a wide variety of Chorizos available with different colors and flavor depending on type and origin. Some are fermented and smoked and can be eaten without cooking, while others require cooking and are not preserved.', N'/images/chorizo.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (6, N'Diced', N'To cut into uniform 1/4 by 1/4 inch square pieces. ', N'Holding the food with your off hand, curl your fingers in to form a claw like grip. Using your knuckles as a guide cut the food into ¼ inch strips. Using the same claw like grip turn the stripes horizontal and cut across to form ¼ by ¼ inch squares. ', N'/images/dice.jpeg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (7, N'Dice', N'To cut food into 1/4th inch square pieces.', N'Holding the food with your off hand, curl your fingers in to form a claw like grip. Using your knuckles as a guide cut the food into ¼ inch strips. Using the same claw like grip turn the stripes horizontal and cut across to form ¼ by ¼ inch squares. ', N'/images/dice.jpeg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (8, N'Fry', N'Cooking in hot oil, partaly or completely covering the food.', NULL, N'/images/frying.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (9, N'Gluten', N'a substance present in cereal grains, especially wheat, that is responsible for the elastic texture of dough. A mixture of two proteins, it causes illness in people with celiac disease', N'Gluten is a composite of storage proteins stored with starch of various grass-related grains. It is found in wheat, barley, rye, oat, related species and hybrids and products of these such as malt. It gives elasticity to dough, helping it rise and keep its shape and often gives the final product a chewy texture.', N'/images/gluten.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (10, N'Preheat', N'To heat the cooking element up to a specific temperature or range before cooking', NULL, N'\Images\preheat.jpeg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (11, N'Pickeled', N'Preserved in vinegar or brine.', NULL, N'/images/pickeled.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (12, N'Reduce', N'To concentrate the flavors of a liquid by simmering over moderate heat.', N'Reducing a liquid adds intensifies flavors and thickens.  Reduction is performed by simmering or boiling a liquid until the desired volume. Vapor will escape from the mixture. Different components of the liquid will evaporate at slightly different temperatures, and the goal of reduction is to drive away those with lowest points of evaporation, leaving behind components that have the highest boiling point.', N'\Images\reduse.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (13, N'Reduced', N'To concentrate the flavors of a liquid by simmering over moderate heat.', N'Reducing a liquid adds intensifies flavors and thickens.  Reduction is performed by simmering or boiling a liquid until the desired volume. Vapor will escape from the mixture. Different components of the liquid will evaporate at slightly different temperatures, and the goal of reduction is to drive away those with lowest points of evaporation, leaving behind components that have the highest boiling point.', N'\Images\reduse.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (14, N'Stock', N'A hearty flavored liquid derived from beef, veal, chicken, or fish bones, tomato paste and mirepoix.', NULL, N'/images/stock.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (15, N'Sliced', N'Cut into long slivers of food.', NULL, N'/images/sliced.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (16, N'Simmer', N'To cook a liquid over moderate heat forming small consistant boubles at 185-200 degrees.', NULL, N'/images/simmer.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (17, N'Thyme', N'An aromatic perennial evergreen herb of the mint family.', NULL, N'/images/english-thyme.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (18, N'Nagaimo', N'A starchy tuber used mostly in Japonnese dishes, it has a slimmy texture when grated.', NULL, N'/images/nagaimo.jpg', NULL, 0, 0)
INSERT [dbo].[Terms] ([TermID], [TermName], [TermDef], [TermInfo], [TermPicture], [TermVideo], [IsMatch], [IsLiked]) VALUES (19, N'Whisk', N'A sturing utensile made from wire bent into a boulbe shape with a handle.', NULL, N'/images/whisk.jpg', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Terms] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 9/12/2017 10:20:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 9/12/2017 10:20:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 9/12/2017 10:20:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 9/12/2017 10:20:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 9/12/2017 10:20:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 9/12/2017 10:20:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [CookingSiteDB] SET  READ_WRITE 
GO
