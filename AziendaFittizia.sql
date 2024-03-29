USE [AziendaFittizia]
GO
/****** Object:  Table [dbo].[Impiegati]    Script Date: 08/02/2024 16:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impiegati](
	[IDImpiegato] [int] IDENTITY(1,1) NOT NULL,
	[IDImpiego] [int] NULL,
	[Cognome] [nvarchar](20) NULL,
	[Nome] [nvarchar](20) NULL,
	[CodiceFiscale] [nvarchar](16) NULL,
	[Eta] [int] NULL,
	[DataAssunzione] [date] NULL,
	[RedditoMensile] [money] NULL,
	[DetrazioneFiscale] [bit] NULL,
 CONSTRAINT [PK_Impiegati] PRIMARY KEY CLUSTERED 
(
	[IDImpiegato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impiego]    Script Date: 08/02/2024 16:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impiego](
	[IDImpiego] [int] IDENTITY(1,1) NOT NULL,
	[TipoImpiego] [nvarchar](max) NULL,
 CONSTRAINT [PK_Impiego] PRIMARY KEY CLUSTERED 
(
	[IDImpiego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Impiegati]  WITH CHECK ADD  CONSTRAINT [fk_IdImpiego] FOREIGN KEY([IDImpiego])
REFERENCES [dbo].[Impiego] ([IDImpiego])
GO
ALTER TABLE [dbo].[Impiegati] CHECK CONSTRAINT [fk_IdImpiego]
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 08/02/2024 16:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EX 1
-- select *
-- from Impiegati
-- where Eta > 29

-- EX 2
-- select *
-- from Impiegati
-- where RedditoMensile >= 800

-- EX 3
-- select *
-- from Impiegati
-- where DetrazioneFiscale = 1

-- EX 4
-- select *
-- from Impiegati
-- where DetrazioneFiscale = 0

-- EX 5
-- select *
-- from Impiegati
-- where Nome like 'G%'
-- order by Nome

-- EX 6
-- select count(*) as NumeroImpiegati
-- from Impiegati

-- EX 7
-- select sum(RedditoMensile) as SommaRedditi
-- from Impiegati

-- EX 8
-- select avg(RedditoMensile) as MediaReddito
-- from Impiegati

-- EX 9
-- select min(RedditoMensile) as RedditoMinimo
-- from Impiegati

-- EX 10
-- select max(RedditoMensile) as RedditoMassimo
-- from Impiegati

-- EX 11
-- select *
-- from Impiegati
-- where DataAssunzione > '01/01/2007' and DataAssunzione < '01/01/2008'

-- ///////////////////////////////////////////////////////
-- EX 12

-- CREAZIONE PROCEDURA

-- CREATE PROCEDURE ViewRole @CompareValue NVARCHAR(MAX)
-- AS
-- BEGIN
--     select IDImpiegato, Impiego.TipoImpiego, Cognome, Nome, CodiceFiscale, Eta, DataAssunzione, RedditoMensile,DetrazioneFiscale
--     from Impiegati as Impiegati
--     inner join
--     Impiego as Impiego on
--     Impiegati.IDImpiego = Impiego.IDImpiego
--     where TipoImpiego = @CompareValue
-- END
-- GO

-- /////////////////////////////////////////////////////////
-- CODICE

-- USE [AziendaFittizia]
-- GO

-- DECLARE	@return_value int

-- EXEC	@return_value = [dbo].[ViewRole]
-- 		@CompareValue = N'Scienziato Clinico'

-- SELECT	'Return Value' = @return_value

-- GO


-- EX 13
-- select avg(Eta) as EtaMedia
-- from Impiegati

-- ELIMINAZIONE DI UN IMPIEGATO
-- CREATE PROCEDURE DeleteEmployee @EmployeeID INT
-- AS
-- BEGIN
--     DELETE FROM Impiegati WHERE IDImpiegato = @EmployeeID
-- END
-- GO

-- MEMORIZZAZIONE DI UN NUOVO IMPIEGATO
CREATE PROCEDURE [dbo].[AddEmployee] 
    @Role INT, 
    @Cognome NVARCHAR(20),
    @Nome NVARCHAR(20),
    @CodiceFiscale NVARCHAR(16),
    @Eta INT,
    @DataAssunzione DATE,
    @RedditoMensile MONEY, 
    @DetrazioneFiscale BIT
AS
BEGIN
    INSERT INTO Impiegati
    (IDImpiego, Cognome, Nome, CodiceFiscale, Eta, DataAssunzione, RedditoMensile, DetrazioneFiscale)
    VALUES
    (@Role, @Cognome, @Nome, @CodiceFiscale, @Eta, @DataAssunzione, @RedditoMensile, @DetrazioneFiscale)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 08/02/2024 16:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EX 1
-- select *
-- from Impiegati
-- where Eta > 29

-- EX 2
-- select *
-- from Impiegati
-- where RedditoMensile >= 800

-- EX 3
-- select *
-- from Impiegati
-- where DetrazioneFiscale = 1

-- EX 4
-- select *
-- from Impiegati
-- where DetrazioneFiscale = 0

-- EX 5
-- select *
-- from Impiegati
-- where Nome like 'G%'
-- order by Nome

-- EX 6
-- select count(*) as NumeroImpiegati
-- from Impiegati

-- EX 7
-- select sum(RedditoMensile) as SommaRedditi
-- from Impiegati

-- EX 8
-- select avg(RedditoMensile) as MediaReddito
-- from Impiegati

-- EX 9
-- select min(RedditoMensile) as RedditoMinimo
-- from Impiegati

-- EX 10
-- select max(RedditoMensile) as RedditoMassimo
-- from Impiegati

-- EX 11
-- select *
-- from Impiegati
-- where DataAssunzione > '01/01/2007' and DataAssunzione < '01/01/2008'

-- ///////////////////////////////////////////////////////
-- EX 12

-- CREAZIONE PROCEDURA

-- CREATE PROCEDURE ViewRole @CompareValue NVARCHAR(MAX)
-- AS
-- BEGIN
--     select IDImpiegato, Impiego.TipoImpiego, Cognome, Nome, CodiceFiscale, Eta, DataAssunzione, RedditoMensile,DetrazioneFiscale
--     from Impiegati as Impiegati
--     inner join
--     Impiego as Impiego on
--     Impiegati.IDImpiego = Impiego.IDImpiego
--     where TipoImpiego = @CompareValue
-- END
-- GO

-- /////////////////////////////////////////////////////////
-- CODICE

-- USE [AziendaFittizia]
-- GO

-- DECLARE	@return_value int

-- EXEC	@return_value = [dbo].[ViewRole]
-- 		@CompareValue = N'Scienziato Clinico'

-- SELECT	'Return Value' = @return_value

-- GO


-- EX 13
-- select avg(Eta) as EtaMedia
-- from Impiegati

-- ELIMINAZIONE DI UN IMPIEGATO
CREATE PROCEDURE [dbo].[DeleteEmployee] @EmployeeID INT
AS
BEGIN
    DELETE FROM Impiegati WHERE IDImpiegato = @EmployeeID
END
GO
/****** Object:  StoredProcedure [dbo].[EditEmployee]    Script Date: 08/02/2024 16:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EX 1
-- select *
-- from Impiegati
-- where Eta > 29

-- EX 2
-- select *
-- from Impiegati
-- where RedditoMensile >= 800

-- EX 3
-- select *
-- from Impiegati
-- where DetrazioneFiscale = 1

-- EX 4
-- select *
-- from Impiegati
-- where DetrazioneFiscale = 0

-- EX 5
-- select *
-- from Impiegati
-- where Nome like 'G%'
-- order by Nome

-- EX 6
-- select count(*) as NumeroImpiegati
-- from Impiegati

-- EX 7
-- select sum(RedditoMensile) as SommaRedditi
-- from Impiegati

-- EX 8
-- select avg(RedditoMensile) as MediaReddito
-- from Impiegati

-- EX 9
-- select min(RedditoMensile) as RedditoMinimo
-- from Impiegati

-- EX 10
-- select max(RedditoMensile) as RedditoMassimo
-- from Impiegati

-- EX 11
-- select *
-- from Impiegati
-- where DataAssunzione > '01/01/2007' and DataAssunzione < '01/01/2008'

-- ///////////////////////////////////////////////////////
-- EX 12

-- CREAZIONE PROCEDURA

-- CREATE PROCEDURE ViewRole @CompareValue NVARCHAR(MAX)
-- AS
-- BEGIN
--     select IDImpiegato, Impiego.TipoImpiego, Cognome, Nome, CodiceFiscale, Eta, DataAssunzione, RedditoMensile,DetrazioneFiscale
--     from Impiegati as Impiegati
--     inner join
--     Impiego as Impiego on
--     Impiegati.IDImpiego = Impiego.IDImpiego
--     where TipoImpiego = @CompareValue
-- END
-- GO

-- /////////////////////////////////////////////////////////
-- CODICE

-- USE [AziendaFittizia]
-- GO

-- DECLARE	@return_value int

-- EXEC	@return_value = [dbo].[ViewRole]
-- 		@CompareValue = N'Scienziato Clinico'

-- SELECT	'Return Value' = @return_value

-- GO


-- EX 13
-- select avg(Eta) as EtaMedia
-- from Impiegati

-- ELIMINAZIONE DI UN IMPIEGATO
-- CREATE PROCEDURE DeleteEmployee @EmployeeID INT
-- AS
-- BEGIN
--     DELETE FROM Impiegati WHERE IDImpiegato = @EmployeeID
-- END
-- GO

-- MEMORIZZAZIONE DI UN NUOVO IMPIEGATO
-- CREATE PROCEDURE AddEmployee 
--     @Role INT, 
--     @Cognome NVARCHAR(20),
--     @Nome NVARCHAR(20),
--     @CodiceFiscale NVARCHAR(16),
--     @Eta INT,
--     @DataAssunzione DATE,
--     @RedditoMensile MONEY, 
--     @DetrazioneFiscale BIT
-- AS
-- BEGIN
--     INSERT INTO Impiegati
--     (IDImpiego, Cognome, Nome, CodiceFiscale, Eta, DataAssunzione, RedditoMensile, DetrazioneFiscale)
--     VALUES
--     (@Role, @Cognome, @Nome, @CodiceFiscale, @Eta, @DataAssunzione, @RedditoMensile, @DetrazioneFiscale)
-- END
-- GO

-- AGGIORNAMENTO DI UN NUOVO IMPIEGATO
CREATE PROCEDURE [dbo].[EditEmployee]
    @FieldToChange NVARCHAR(50),
    @NewVAlue NVARCHAR(50),
    @Id NVARCHAR(50)
AS
BEGIN
    UPDATE Impiegati SET @FieldToChange=@NewVAlue
    WHERE IDImpiegato = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ViewRole]    Script Date: 08/02/2024 16:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EX 1
-- select *
-- from Impiegati
-- where Eta > 29

-- EX 2
-- select *
-- from Impiegati
-- where RedditoMensile >= 800

-- EX 3
-- select *
-- from Impiegati
-- where DetrazioneFiscale = 1

-- EX 4
-- select *
-- from Impiegati
-- where DetrazioneFiscale = 0

-- EX 5
-- select *
-- from Impiegati
-- where Nome like 'G%'
-- order by Nome

-- EX 6
-- select count(*) as NumeroImpiegati
-- from Impiegati

-- EX 7
-- select sum(RedditoMensile) as SommaRedditi
-- from Impiegati

-- EX 8
-- select avg(RedditoMensile) as MediaReddito
-- from Impiegati

-- EX 9
-- select min(RedditoMensile) as RedditoMinimo
-- from Impiegati

-- EX 10
-- select max(RedditoMensile) as RedditoMassimo
-- from Impiegati

-- EX 11
-- select *
-- from Impiegati
-- where DataAssunzione > '01/01/2007' and DataAssunzione < '01/01/2008'

-- EX 12

CREATE PROCEDURE [dbo].[ViewRole] @CompareValue NVARCHAR(MAX)
AS
BEGIN
    select IDImpiegato, Impiego.TipoImpiego, Cognome, Nome, CodiceFiscale, Eta, DataAssunzione, RedditoMensile,DetrazioneFiscale
    from Impiegati as Impiegati
    inner join
    Impiego as Impiego on
    Impiegati.IDImpiego = Impiego.IDImpiego
    where TipoImpiego = @CompareValue
END
GO
