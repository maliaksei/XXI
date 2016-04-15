/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
SET IDENTITY_INSERT [dbo].[User] ON
IF NOT EXISTS(SELECT * FROM [dbo].[User] WHERE [Email] = N'admin@mail.com')
    BEGIN
       INSERT INTO [dbo].[User]([Id], [Email],[EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnabled], [AccessFailedCount], [UserName], [LastName], [FirstName], [Patronymic])
		VALUES (1, N'admin@mail.com', N'False', N'ADCm0IZRQjk7pXEgTYtzCelKxTA6asOwW9lzzn4JpBbHezm6NWMUqNMKIOZeQdLTOA==', N'8b9f300b-79e4-4836-b3b5-d6d55027fc75', N'False', N'False', N'True', 0,  N'admin@mail.com', N'Иванов', N'Иван', N'Иванович')
    END
	--password: 123123

	IF NOT EXISTS(SELECT * FROM [dbo].[User] WHERE [Email] = N'user@mail.com')
    BEGIN
       INSERT INTO [dbo].[User]([Id], [Email],[EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnabled], [AccessFailedCount], [UserName], [LastName], [FirstName], [Patronymic])
		VALUES (2, N'user@mail.com', N'False', N'ADCm0IZRQjk7pXEgTYtzCelKxTA6asOwW9lzzn4JpBbHezm6NWMUqNMKIOZeQdLTOA==', N'8b9f300b-79e4-4836-b3b5-d6d55027fc75', N'False', N'False', N'True', 0,  N'user@mail.com', N'Петров', N'Петр', N'Петрович')
    END
SET IDENTITY_INSERT [dbo].[User] OFF 

SET IDENTITY_INSERT [dbo].[Role] ON
INSERT INTO [dbo].[Role]([Id], [Name]) VALUES (1, N'Admin')
INSERT INTO [dbo].[Role]([Id], [Name])  VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF 


BEGIN
INSERT INTO [dbo].[UserRole]([UserId], [RoleId]) VALUES (1, 1)
INSERT INTO [dbo].[UserRole]([UserId], [RoleId]) VALUES (2, 2)
END

SET IDENTITY_INSERT [dbo].[Category] ON
INSERT INTO [dbo].[Category]([Id],[Name]) VALUES (1, N'Холодильники и морозильники')
INSERT INTO [dbo].[Category]([Id],[Name])  VALUES (2, N'Стиральные машины')
INSERT INTO [dbo].[Category]([Id],[Name])  VALUES (3, N'Утюги, отпариватели')
SET IDENTITY_INSERT [dbo].[Category] OFF 

SET IDENTITY_INSERT [dbo].[ProductType] ON
INSERT INTO [dbo].[ProductType]([Id],[Name]) VALUES (1, N'Холодильник с морозильником')
INSERT INTO [dbo].[ProductType]([Id],[Name]) VALUES (2, N'Морозильник')
INSERT INTO [dbo].[ProductType]([Id],[Name])  VALUES (3, N'Стиральная машина')
INSERT INTO [dbo].[ProductType]([Id],[Name])  VALUES (4, N'Утюг')
INSERT INTO [dbo].[ProductType]([Id],[Name])  VALUES (5, N'Отпариватель')
SET IDENTITY_INSERT [dbo].[ProductType] OFF 

SET IDENTITY_INSERT [dbo].[ProductTypeAttribute] ON
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (1, 1, N'Тип')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (2, 1, N'Установка')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (3, 1, N'Конструкция')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (4, 1, N'Камеры')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (5, 1, N'Расположение морозильной камеры')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (6, 1, N'Цвет')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (7, 1, N'Годовой расход электроэнергии')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (8, 1, N'Мощность замораживания')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (9, 1, N'Уровень шума')

INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (10, 2, N'Тип')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (11, 2, N'Установка')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (12, 2, N'Конструкция')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (13, 2, N'Камеры')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (14, 2, N'Общий объем')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (15, 2, N'Цвет')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (16, 2, N'Класс энергопотребления')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (17, 2, N'Годовой расход электроэнергии')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (18, 2, N'Мощность замораживания')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (19, 2, N'Уровень шума')

INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (20, 3, N'Тип')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (21, 3, N'Установка')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (22, 3, N'Способ загрузки')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (23, 3, N'Сушка')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (24, 3, N'Класс стирки')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (25, 3, N'Максимальная загрузка')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (26, 3, N'Прямой привод')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (27, 3, N'Открытие люка на 180 градусов')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (28, 3, N'Диаметр люка')
INSERT INTO [dbo].[ProductTypeAttribute]([Id],[ProductTypeId], [Name]) VALUES (29, 3, N'Материал блока')
SET IDENTITY_INSERT [dbo].[ProductTypeAttribute] OFF 

