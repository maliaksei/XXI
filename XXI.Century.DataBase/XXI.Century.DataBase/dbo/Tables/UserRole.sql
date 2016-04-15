CREATE TABLE [dbo].[UserRole] (
    [UserId] BIGINT NOT NULL,
    [RoleId] BIGINT NOT NULL,
    CONSTRAINT [PK_dbo.UserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]) ON DELETE CASCADE
);

