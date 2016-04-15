CREATE TABLE [dbo].[Category] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (255) NOT NULL,
    [Description]      NVARCHAR (255) NULL,
    [ParentCategoryId] BIGINT         NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Category_Category] FOREIGN KEY ([ParentCategoryId]) REFERENCES [dbo].[Category] ([Id])
);

