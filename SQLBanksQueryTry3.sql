USE master
GO
CREATE TABLE BankInfo
(
	BankId int identity(1,1) not null,
	BankName varchar(55),

	PRIMARY KEY (BankId)
)
GO
CREATE TABLE City
(
	CityId int identity(1,1) not null,
	CityName varchar(125),

	PRIMARY KEY (CityId)
)
GO
CREATE TABLE UserStatus
(
	SocialStatusId int identity(1,1) not null,
	SocialStatus varchar(125)

	PRIMARY KEY(SocialStatusId)
)
GO
CREATE TABLE UserInfo
(
	UserId int identity(1,1) not null,
	CityId int,
	FirstName varchar(125),
	LastName varchar(125),
	SocialStatusId int,
	Age int,

	PRIMARY KEY (UserId),
	FOREIGN KEY (SocialStatusId) REFERENCES UserStatus(SocialStatusId),
	FOREIGN KEY (CityId) REFERENCES City(CityId)
)
GO
CREATE TABLE BankBranches
(
	BankId int,
	CityId int,
	BankAdress varchar(125),

	FOREIGN KEY (BankId) REFERENCES BankInfo(BankId),
	FOREIGN KEY (CityId) REFERENCES City(CityId)
)
GO
CREATE TABLE Account
(
	AccountId int identity(1,1) not null,
	BankId int,
	UserId int,
	AccountName varchar(125),
	AccountBalance decimal(6,2),

	PRIMARY KEY (AccountId),
	FOREIGN KEY (BankId) REFERENCES BankInfo(BankId),
	FOREIGN KEY (UserId) REFERENCES UserInfo(UserId)
)
GO
CREATE TABLE CardInfo
(
	CardId int identity(1,1) not null,
	AccountId int,
	CardBalance decimal(6,2),

	PRIMARY KEY (CardId),
	FOREIGN KEY (AccountId) REFERENCES Account(AccountId)
)

INSERT INTO BankInfo VALUES('Alpha-Bank')
INSERT INTO BankInfo VALUES('Belinvestbank')
INSERT INTO BankInfo VALUES('Technobank')
INSERT INTO BankInfo VALUES('BelWeb')
INSERT INTO BankInfo VALUES('MTBank')
INSERT INTO BankInfo VALUES('Belarusbank')

INSERT INTO City VALUES('Gomel')
INSERT INTO City VALUES('Brest')
INSERT INTO City VALUES('Grodno')
INSERT INTO City VALUES('Mogilev')
INSERT INTO City VALUES('Vitebsk')

INSERT INTO UserStatus VALUES('Student')
INSERT INTO UserStatus VALUES('Worker')
INSERT INTO UserStatus VALUES('Pensioner')
INSERT INTO UserStatus VALUES('Disable')
INSERT INTO UserStatus VALUES('Test')
INSERT INTO UserStatus VALUES('Test3333')
INSERT INTO UserStatus VALUES('Test3567333')
INSERT INTO UserStatus VALUES('Test330033')

INSERT INTO UserInfo VALUES(1, 'Tikhomirova',	'Elizabeth', 1,	18)
INSERT INTO UserInfo VALUES(1, 'Smirnov',		'Maksim',	 2,	26)
INSERT INTO UserInfo VALUES(2, 'Kudryashov',	'Pavel',	 2,	23)
INSERT INTO UserInfo VALUES(4, 'Kupriyanov',	'Vladimir',	 1,	20)
INSERT INTO UserInfo VALUES(5, 'Zhdanov',		'Miron',	 1,	21)
INSERT INTO UserInfo VALUES(2, 'Shevelev',		'Ilya',		 2,	37)
INSERT INTO UserInfo VALUES(3, 'Krasnov',		'Gregory',   3,	68)
INSERT INTO UserInfo VALUES(1, 'Sokolova',		'Ekaterina', 2,	30)
INSERT INTO UserInfo VALUES(1, 'Stepanova',		'Fatima',	 3,	66)
INSERT INTO UserInfo VALUES(2, 'Sokolov',		'Vladimir',	 2,	42)
INSERT INTO UserInfo VALUES(3, 'Ivanova',		'Faith',	 4,	51)
INSERT INTO UserInfo VALUES(5, 'Filippova',		'Hope',		 3,	72)
INSERT INTO UserInfo VALUES(1, 'Bespalova',		'Ekaterina', 2,	22)
INSERT INTO UserInfo VALUES(1, 'Galkin',		'Savva',	 2,	25)
INSERT INTO UserInfo VALUES(2, 'Popov',			'Alexander', 3,	62)
INSERT INTO UserInfo VALUES(3, 'Novikov',		'Ibrahim',	 2,	33)
INSERT INTO UserInfo VALUES(4, 'Smirnov',		'Alexander', 3,	71)
INSERT INTO UserInfo VALUES(5, 'Tkachev',		'Victor',	 4,	44)
INSERT INTO UserInfo VALUES(3, 'Zakharov',		'Adam',		 4,	39)
INSERT INTO UserInfo VALUES(1, 'Prokofiev',		'Bilal',	 2,	28)

INSERT INTO BankBranches VALUES(1, 1, 'Any adress')
INSERT INTO BankBranches VALUES(2, 1, 'Any adress')
INSERT INTO BankBranches VALUES(3, 1, 'Any adress')
INSERT INTO BankBranches VALUES(4, 1, 'Any adress')
INSERT INTO BankBranches VALUES(5, 1, 'Any adress')
INSERT INTO BankBranches VALUES(6, 1, 'Any adress')
INSERT INTO BankBranches VALUES(1, 2, 'Any adress')
INSERT INTO BankBranches VALUES(2, 2, 'Any adress')
INSERT INTO BankBranches VALUES(3, 2, 'Any adress')
INSERT INTO BankBranches VALUES(4, 3, 'Any adress')
INSERT INTO BankBranches VALUES(5, 3, 'Any adress')
INSERT INTO BankBranches VALUES(1, 3, 'Any adress')
INSERT INTO BankBranches VALUES(3, 3, 'Any adress')
INSERT INTO BankBranches VALUES(1, 4, 'Any adress')
INSERT INTO BankBranches VALUES(2, 4, 'Any adress')
INSERT INTO BankBranches VALUES(3, 4, 'Any adress')
INSERT INTO BankBranches VALUES(4, 4, 'Any adress')
INSERT INTO BankBranches VALUES(5, 4, 'Any adress')
INSERT INTO BankBranches VALUES(6, 4, 'Any adress')
INSERT INTO BankBranches VALUES(5, 5, 'Any adress')
INSERT INTO BankBranches VALUES(6, 5, 'Any adress')

INSERT INTO Account VALUES (1,  1, 'SomeEmail_1@gmail.com', 100.25)
INSERT INTO Account VALUES (2,  2, 'SomeEmail_2@gmail.com', 1500)
INSERT INTO Account VALUES (3,  3, 'SomeEmail_3@gmail.com', 120.30)
INSERT INTO Account VALUES (2,  4, 'SomeEmail_4@gmail.com', 755.35)
INSERT INTO Account VALUES (1,  5, 'SomeEmail_5@gmail.com', 730)
INSERT INTO Account VALUES (1,  6, 'SomeEmail_6@gmail.com', 390)
INSERT INTO Account VALUES (1,  7, 'SomeEmail_7@gmail.com', 115.15)
INSERT INTO Account VALUES (1,  8, 'SomeEmail_8@gmail.com', 855.15)
INSERT INTO Account VALUES (2,  9, 'SomeEmail_9@gmail.com', 230.30)
INSERT INTO Account VALUES (2, 10, 'SomeEmail_10@gmail.com', 230.30)
INSERT INTO Account VALUES (3, 11, 'SomeEmail_11@gmail.com', 150)
INSERT INTO Account VALUES (2, 12, 'SomeEmail_12@gmail.com', 670)
INSERT INTO Account VALUES (1, 13, 'SomeEmail_13@gmail.com', 700)
INSERT INTO Account VALUES (4, 14, 'SomeEmail_14@gmail.com', 620)
INSERT INTO Account VALUES (1, 15, 'SomeEmail_15@gmail.com', 560)
INSERT INTO Account VALUES (1, 16, 'SomeEmail_16@gmail.com', 371.35)
INSERT INTO Account VALUES (2, 17, 'SomeEmail_17@gmail.com', 150.50)
INSERT INTO Account VALUES (3, 18, 'SomeEmail_18@gmail.com', 100)
INSERT INTO Account VALUES (1, 19, 'SomeEmail_19@gmail.com', 65)
INSERT INTO Account VALUES (1, 20, 'SomeEmail_20@gmail.com', 1030)

INSERT INTO CardInfo VALUES (1, 90)
INSERT INTO CardInfo VALUES (1, 10)
INSERT INTO CardInfo VALUES (2, 1500)
INSERT INTO CardInfo VALUES (2, 0)
INSERT INTO CardInfo VALUES (3, 0.20)
INSERT INTO CardInfo VALUES (4, 110)
INSERT INTO CardInfo VALUES (4, 320)
INSERT INTO CardInfo VALUES (5, 730)
INSERT INTO CardInfo VALUES (6, 20.40)
INSERT INTO CardInfo VALUES (6, 355)
INSERT INTO CardInfo VALUES (7, 115.15)
INSERT INTO CardInfo VALUES (7, 0)
INSERT INTO CardInfo VALUES (8, 345.90)
INSERT INTO CardInfo VALUES (8, 120)
INSERT INTO CardInfo VALUES (8, 210.35)
INSERT INTO CardInfo VALUES (9, 230.30)
INSERT INTO CardInfo VALUES (10, 150)
INSERT INTO CardInfo VALUES (11, 40)
INSERT INTO CardInfo VALUES (11, 15)
INSERT INTO CardInfo VALUES (12, 120)
INSERT INTO CardInfo VALUES (13, 120.45)
INSERT INTO CardInfo VALUES (13, 155.15)
INSERT INTO CardInfo VALUES (14, 20)
INSERT INTO CardInfo VALUES (14, 325.35)
INSERT INTO CardInfo VALUES (14, 140.40)
INSERT INTO CardInfo VALUES (15, 370.55)
INSERT INTO CardInfo VALUES (15, 0.80)
INSERT INTO CardInfo VALUES (16, 20)
INSERT INTO CardInfo VALUES (17, 15.10)
INSERT INTO CardInfo VALUES (17, 40.75)
INSERT INTO CardInfo VALUES (18, 25.60)
INSERT INTO CardInfo VALUES (19, 35) 
INSERT INTO CardInfo VALUES (20, 700)
INSERT INTO CardInfo VALUES (20, 210.20)

--------------------------------------------------Query-1----------------------------------------------
------Displays a list of banks that have a branch in city X
GO
SELECT BankInfo.BankName 
FROM BankInfo INNER JOIN BankBranches ON BankInfo.BankId = BankBranches.BankId 
			  INNER JOIN City ON City.CityId = BankBranches.CityId
WHERE City.CityName = 'Brest'

--------------------------------------------------Query-2----------------------------------------------
------Displays a list of cards indicating the name of the owner, balance and the name of the bank
GO
SELECT BankInfo.BankName, UserInfo.FirstName, CardInfo.CardBalance 
FROM CardInfo INNER JOIN Account ON Account.AccountId = CardInfo.AccountId 
			  INNER JOIN UserInfo ON UserInfo.UserId = Account.UserId
			  INNER JOIN BankInfo ON Account.BankId = BankInfo.BankId

--------------------------------------------------Query-3----------------------------------------------
------Displays a list of bank accounts where balance doesn't match the sum of the card balance and shows the difference
GO
SELECT Account.AccountName, Account.AccountBalance - SUM(ISNULL(CardInfo.CardBalance, 0)) as SumBalanceVal, Account.AccountBalance
FROM Account LEFT JOIN CardInfo ON CardInfo.AccountId = Account.AccountId
GROUP BY Account.AccountName, Account.AccountBalance
HAVING Account.AccountBalance - SUM(CardInfo.CardBalance) != 0 OR AccountBalance > 0

------------------------------------------------Query-4----------------------------------------------
----Display the number of the bank cards for each social status: Group by
GO
SELECT UserStatus.SocialStatus, COUNT(UserInfo.SocialStatusId) AS CountCards
FROM UserStatus LEFT JOIN UserInfo ON UserInfo.SocialStatusId = UserStatus.SocialStatusId
GROUP BY UserStatus.SocialStatus

----Display the number of the bank cards for each social status: Subquery
GO
SELECT UserStatus.SocialStatus, 
	(SELECT COUNT(UserInfo.SocialStatusId) 
	FROM UserInfo
	WHERE UserStatus.SocialStatusId = UserInfo.SocialStatusId)  AS CountCards
FROM UserStatus
ORDER BY CountCards

------------------------------------------------Query-5----------------------------------------------
----Add 10$ for each bank account for a special social status
GO
CREATE PROCEDURE AddTenDollars
(
	@SocialStatus varchar(125), @AddSomeMoney decimal(6,2)
)
AS
BEGIN
	UPDATE Account
	SET AccountBalance = AccountBalance + @AddSomeMoney
	FROM Account INNER JOIN UserInfo ON UserInfo.UserId = Account.UserId
				 INNER JOIN UserStatus ON UserStatus.SocialStatusId = UserInfo.SocialStatusId
	WHERE UserStatus.SocialStatus = @SocialStatus
END
GO

EXEC AddTenDollars 'Disable', 10

SELECT Account.AccountName, Account.AccountBalance FROM Account

DROP PROCEDURE AddTenDollars

------------------------------------------------Query-6----------------------------------------------
----Displays a list of available funds for each client to transfer funds to any card
----Available transfer amount for each account on an accrual basis
GO
SELECT Account.AccountName, Account.AccountBalance - SUM(CardInfo.CardBalance) AS CardsSumBalance
FROM Account INNER JOIN CardInfo ON Account.AccountId = CardInfo.AccountId
GROUP BY Account.AccountName, CardInfo.AccountId, Account.AccountBalance

------------------------------------------------Query-7----------------------------------------------
----Procedure that safely transfer money from an account to a card of this account using transaction
GO
CREATE PROCEDURE TransactionProcedure
(
	@TransitCardAccount int, @TransitAccount int, @FromTransitToCard decimal(6,2)
)
AS
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
	BEGIN TRANSACTION;
		UPDATE CardInfo
		SET CardBalance = CardInfo.CardBalance + @FromTransitToCard
		FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId
		WHERE CardInfo.CardId = @TransitCardAccount AND CardInfo.CardBalance <= Account.AccountBalance

		UPDATE Account
		SET AccountBalance = Account.AccountBalance - @FromTransitToCard
		FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId
		WHERE Account.AccountId = @TransitAccount AND Account.AccountBalance >= @FromTransitToCard AND Account.AccountBalance > CardInfo.CardBalance
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	DECLARE @msg nvarchar(2048) = error_message()
	RAISERROR (@msg, 16, 1)
	RETURN 0
END CATCH
GO

EXEC TransactionProcedure 4, 2, 50

SELECT CardInfo.CardId, CardInfo.CardBalance, Account.AccountId, Account.AccountBalance
FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId

DROP PROCEDURE TransactionProcedure
------------------------------------------------Query-8----------------------------------------------
-------------------------------------------------------Trigger for card-----------------------------------------------------
GO
CREATE TRIGGER CardInfoTrigger ON CardInfo 
	FOR UPDATE
AS 
	IF UPDATE(CardBalance)
	BEGIN
		IF (SELECT SUM(CardBalance) FROM inserted) < 0
			BEGIN
				PRINT 'Bad transaction!'
				ROLLBACK TRANSACTION
				RETURN
			END
		ELSE IF (SELECT SUM(CardBalance) FROM inserted) > (SELECT AccountBalance FROM Account JOIN inserted ON inserted.AccountId = Account.AccountId)
			BEGIN
				PRINT 'Bad transaction!'
				ROLLBACK TRANSACTION
				RETURN
			END
	END;

-------------------------------------------------------Trigger for account-----------------------------------------------------
GO
CREATE TRIGGER AccountTrigger ON Account 
	FOR UPDATE
AS 
	IF UPDATE(AccountBalance)
	BEGIN
		IF (SELECT SUM(AccountBalance) FROM inserted) < 0
			BEGIN
				PRINT 'Bad transaction!'
				ROLLBACK TRANSACTION
				RETURN
			END
		ELSE IF (SELECT SUM(CardInfo.CardBalance) FROM inserted INNER JOIN CardInfo ON CardInfo.AccountId = inserted.AccountId) > (SELECT Account.AccountBalance FROM Account JOIN inserted ON inserted.AccountId = Account.AccountId)
			BEGIN
				PRINT 'Bad transaction!'
				ROLLBACK TRANSACTION
				RETURN
			END
	END;
--------------------------------------------------Tests for trigger---------------------------------------------
DROP TRIGGER CardInfoTrigger
DROP TRIGGER AccountTrigger


--Immitation of transaction for card
DECLARE @CardBalance decimal(6,2) = -10
UPDATE CardInfo SET CardBalance = CardInfo.CardBalance + @CardBalance WHERE CardInfo.CardId = 1
UPDATE CardInfo SET CardBalance = CardInfo.CardBalance + @CardBalance WHERE CardInfo.CardId = 2
UPDATE CardInfo SET CardBalance = CardInfo.CardBalance + @CardBalance WHERE CardInfo.CardId = 3
UPDATE CardInfo SET CardBalance = CardInfo.CardBalance + @CardBalance WHERE CardInfo.CardId = 4
UPDATE CardInfo SET CardBalance = CardInfo.CardBalance + @CardBalance WHERE CardInfo.CardId = 5

--Immitation of transaction for account
DECLARE @AccountBalance decimal(6,2) = -0.25
UPDATE Account SET AccountBalance = Account.AccountBalance + @AccountBalance WHERE AccountId = 1
UPDATE Account SET AccountBalance = Account.AccountBalance + @AccountBalance WHERE AccountId = 2
UPDATE Account SET AccountBalance = Account.AccountBalance + @AccountBalance WHERE AccountId = 3
UPDATE Account SET AccountBalance = Account.AccountBalance + @AccountBalance WHERE AccountId = 4
UPDATE Account SET AccountBalance = Account.AccountBalance + @AccountBalance WHERE AccountId = 5

--Table output
SELECT CardId, AccountName, CardBalance, AccountBalance
FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId