CREATE TABLE [dbo].[ProductTypeAttributeValue] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductTypeAttributeId] BIGINT         NOT NULL,
    [ValueName]              NVARCHAR (250) NOT NULL,
    [ValueDescription]       NVARCHAR (250) NULL,
    [ProductId]              BIGINT         NOT NULL,
    CONSTRAINT [PK_ProductTypeAttributeValue] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductTypeAttributeValue_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [FK_ProductTypeAttributeValue_ProductTypeAttribute] FOREIGN KEY ([ProductTypeAttributeId]) REFERENCES [dbo].[ProductTypeAttribute] ([Id])
);



