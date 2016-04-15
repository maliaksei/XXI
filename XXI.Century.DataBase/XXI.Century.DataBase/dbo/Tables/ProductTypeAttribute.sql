CREATE TABLE [dbo].[ProductTypeAttribute] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductTypeId] BIGINT         NOT NULL,
    [Name]          NVARCHAR (250) NOT NULL,
    [Description]   NVARCHAR (250) NULL,
    CONSTRAINT [PK_ProductTypeAttribute] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductTypeAttribute_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id])
);

