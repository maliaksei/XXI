CREATE TABLE [dbo].[OrderCommodity] (
    [Id]        BIGINT IDENTITY (1, 1) NOT NULL,
    [OrderId]   BIGINT NOT NULL,
    [ProductId] BIGINT NOT NULL,
    [Count]     INT    NULL,
    CONSTRAINT [PK_OrderCommodity] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_OrderCommodity_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([Id]),
    CONSTRAINT [FK_OrderCommodity_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id])
);

