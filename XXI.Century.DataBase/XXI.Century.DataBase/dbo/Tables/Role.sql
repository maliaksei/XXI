CREATE TABLE [dbo].[Role] (
    [Id]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
);

