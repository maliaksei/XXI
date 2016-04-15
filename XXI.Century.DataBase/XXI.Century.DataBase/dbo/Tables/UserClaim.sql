CREATE TABLE [dbo].[UserClaim] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     BIGINT         NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.UserClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.UserClaims_dbo.Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]) ON DELETE CASCADE
);

