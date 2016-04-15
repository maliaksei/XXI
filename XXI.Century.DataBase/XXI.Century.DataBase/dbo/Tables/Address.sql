CREATE TABLE [dbo].[Address] (
    [Id]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [Country] NVARCHAR (50)  NOT NULL,
    [City]    NVARCHAR (50)  NOT NULL,
    [Street]  NVARCHAR (255) NOT NULL,
    [House]   NVARCHAR (10)  NOT NULL,
    [Flat]    NVARCHAR (10)  NULL,
    [UserId]  BIGINT         NOT NULL,
    CONSTRAINT [PK_Addres] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Addres_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

