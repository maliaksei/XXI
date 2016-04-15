CREATE TABLE [dbo].[Carousel] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [Image]        NVARCHAR (255) NOT NULL,
    [PriceImage]   NVARCHAR (255) NULL,
    [Tittle]       NVARCHAR (100) NOT NULL,
    [SubTitle]     NVARCHAR (255) NOT NULL,
    [Text]         NVARCHAR (255) NOT NULL,
    [UrlToProdict] NVARCHAR (255) NULL,
    CONSTRAINT [PK_Carousel] PRIMARY KEY CLUSTERED ([Id] ASC)
);



