CREATE TABLE [dbo].[Review] (
    [Id]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]    BIGINT         NOT NULL,
    [ProductId] BIGINT         NOT NULL,
    [Text]      NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Review_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [FK_Review_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

