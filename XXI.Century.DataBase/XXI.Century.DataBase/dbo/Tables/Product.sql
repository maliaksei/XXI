CREATE TABLE [dbo].[Product] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (255) NOT NULL,
    [Description]   NVARCHAR (MAX) NULL,
    [Image]         NVARCHAR (150) NULL,
    [Price]         FLOAT (53)     NOT NULL,
    [ProductTypeId] BIGINT         NOT NULL,
    [Status]        INT            NOT NULL,
    CONSTRAINT [PK_Commodity] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Product_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id])
);



