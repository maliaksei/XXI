CREATE TABLE [dbo].[ProductType] (
    [Id]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (250) NOT NULL,
    [Description] NVARCHAR (250) NULL,
    CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED ([Id] ASC)
);

