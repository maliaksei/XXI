CREATE TABLE [dbo].[UserLogin] (
    [LoginProvider] NVARCHAR (128) NOT NULL,
    [ProviderKey]   NVARCHAR (128) NOT NULL,
    [UserId]        BIGINT         NOT NULL,
    CONSTRAINT [PK_dbo.UserLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC, [UserId] ASC),
    CONSTRAINT [FK_dbo.UserLogins_dbo.Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]) ON DELETE CASCADE
);

