CREATE TABLE [dbo].[Order] (
    [Id]               BIGINT     IDENTITY (1, 1) NOT NULL,
    [UserId]           BIGINT     NOT NULL,
    [DeliveryAddresId] BIGINT     NULL,
    [OrderDateTime]    DATETIME   NULL,
    [Status]           INT        NOT NULL,
    [Price]            FLOAT (53) NULL,
    [ShippingMethod]   INT        NULL,
    [PaymentMethod]    INT        NULL,
    [PhoneNumber]      INT        NULL,
    CONSTRAINT [PK_Order_1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Order_Address] FOREIGN KEY ([DeliveryAddresId]) REFERENCES [dbo].[Address] ([Id]),
    CONSTRAINT [FK_Order_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);



