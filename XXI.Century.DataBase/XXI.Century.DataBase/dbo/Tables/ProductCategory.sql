CREATE TABLE [dbo].[ProductCategory] (
    [ProductId]  BIGINT NOT NULL,
    [CategoryId] BIGINT NOT NULL,
    CONSTRAINT [FK_ProductCategoryId_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([Id]),
    CONSTRAINT [FK_ProductCategoryId_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_ProductCategory_1]
    ON [dbo].[ProductCategory]([CategoryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ProductCategory]
    ON [dbo].[ProductCategory]([ProductId] ASC);

