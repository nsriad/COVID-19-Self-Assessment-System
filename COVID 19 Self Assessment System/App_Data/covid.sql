CREATE TABLE [dbo].[covidrecords]
(
	[Sl No.] INT NOT NULL PRIMARY KEY  IDENTITY, 
    [Age] INT NOT NULL, 
    [Sex] VARCHAR(10) NOT NULL, 
    [Temperature] FLOAT NOT NULL, 
    [Assesment Date] DATETIME NOT NULL, 
    [Assesment Score] INT NOT NULL, 
    [COVID19 Result] VARCHAR(50) NOT NULL
)

