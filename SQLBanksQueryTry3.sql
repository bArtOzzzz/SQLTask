USE master
GO
CREATE TABLE BankInfo
(
	BankId int not null,
	BankName varchar(55),

	PRIMARY KEY (BankId)
)
GO
CREATE TABLE City
(
	CityId int not null,
	CityName varchar(125),

	PRIMARY KEY (CityId)
)
GO
CREATE TABLE UserStatus
(
	SocialStatusId int not null,
	SocialStatus varchar(125)

	PRIMARY KEY(SocialStatusId)
)
GO
CREATE TABLE UserInfo
(
	UserId int not null,
	CityId int,
	FirstName varchar(125),
	LastName varchar(125),
	SocialStatusId int,
	Age int,

	PRIMARY KEY (UserId),
	FOREIGN KEY (SocialStatusId) REFERENCES UserStatus(SocialStatusId)
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
	AccountId int not null,
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
	CardId int not null,
	AccountId int,
	CardBalance decimal(6,2),

	PRIMARY KEY (CardId),
	FOREIGN KEY (AccountId) REFERENCES Account(AccountId)
)
GO
INSERT BankInfo
	  select 1, 'Alpha-Bank'
union select 2, 'Belinvestbank'
union select 3, 'Technobank'
union select 4, 'BelWeb'
union select 5, 'MTBank'
union select 6, 'Belarusbank'
GO
INSERT City
	  select 1, 'Gomel'
union select 2, 'Brest'
union select 3, 'Grodno'
union select 4, 'Mogilev'
union select 5, 'Vitebsk'
GO
INSERT UserStatus
	  select 1, 'Student'
union select 2, 'Worker'
union select 3, 'Pensioner'
union select 4, 'Disable'
GO
INSERT UserInfo
	  select 1,  1, 'Tikhomirova',	'Elizabeth', 1,	18
union select 2,  1, 'Smirnov',		'Maksim',	 2,	26
union select 3,  2, 'Kudryashov',	'Pavel',	 2,	23
union select 4,  4, 'Kupriyanov',	'Vladimir',	 1,	20
union select 5,  5, 'Zhdanov',		'Miron',	 1,	21
union select 6,  2, 'Shevelev',		'Ilya',		 2,	37
union select 7,  3, 'Krasnov',		'Gregory',   3,	68
union select 8,  1, 'Sokolova',		'Ekaterina', 2,	30
union select 9,  1, 'Stepanova',	'Fatima',	 3,	66
union select 10, 2, 'Sokolov',		'Vladimir',	 2,	42
union select 11, 3, 'Ivanova',		'Faith',	 4,	51
union select 12, 5, 'Filippova',	'Hope',		 3,	72
union select 13, 1, 'Bespalova',	'Ekaterina', 2,	22
union select 14, 1, 'Galkin',		'Savva',	 2,	25
union select 15, 2, 'Popov',		'Alexander', 3,	62
union select 16, 3, 'Novikov',		'Ibrahim',	 2,	33
union select 17, 4, 'Smirnov',		'Alexander', 3,	71
union select 18, 5, 'Tkachev',		'Victor',	 4,	44
union select 19, 3, 'Zakharov',		'Adam',		 4,	39
union select 20, 1, 'Prokofiev',	'Bilal',	 2,	28
GO
INSERT BankBranches
	  select 1, 1, 'Any adress'
union select 2, 1, 'Any adress'
union select 3, 1, 'Any adress'
union select 4, 1, 'Any adress'
union select 5, 1, 'Any adress'
union select 6, 1, 'Any adress'

union select 1, 2, 'Any adress'
union select 2, 2, 'Any adress'
union select 3, 2, 'Any adress'

union select 4, 3, 'Any adress'
union select 5, 3, 'Any adress'
union select 1, 3, 'Any adress'
union select 3, 3, 'Any adress'

union select 1, 4, 'Any adress'
union select 2, 4, 'Any adress'
union select 3, 4, 'Any adress'
union select 4, 4, 'Any adress'
union select 5, 4, 'Any adress'
union select 6, 4, 'Any adress'

union select 5, 5, 'Any adress'
union select 6, 5, 'Any adress'
GO
INSERT Account
	  select  1, 1,  1, 'SomeEmail_1@gmail.com', 100.25
union select  2, 2,  2, 'SomeEmail_2@gmail.com', 1500
union select  3, 3,  3, 'SomeEmail_3@gmail.com', 120.30
union select  4, 2,  4, 'SomeEmail_4@gmail.com', 755.35
union select  5, 1,  5, 'SomeEmail_5@gmail.com', 730
union select  6, 1,  6, 'SomeEmail_6@gmail.com', 390
union select  7, 1,  7, 'SomeEmail_7@gmail.com', 115.15
union select  8, 1,  8, 'SomeEmail_8@gmail.com', 855.15
union select  9, 2,  9, 'SomeEmail_9@gmail.com', 230.30
union select 10, 3, 10, 'SomeEmail_10@gmail.com', 150
union select 11, 2, 11, 'SomeEmail_11@gmail.com', 670
union select 12, 1, 12, 'SomeEmail_12@gmail.com', 125
union select 13, 4, 13, 'SomeEmail_13@gmail.com', 345
union select 14, 1, 14, 'SomeEmail_14@gmail.com', 560
union select 15, 1, 15, 'SomeEmail_15@gmail.com', 371.35
union select 16, 2, 16, 'SomeEmail_16@gmail.com', 20
union select 17, 3, 17, 'SomeEmail_17@gmail.com', 100
union select 18, 1, 18, 'SomeEmail_18@gmail.com', 65
union select 19, 1, 19, 'SomeEmail_19@gmail.com', 35
union select 20, 1, 20, 'SomeEmail_20@gmail.com', 1000
GO
INSERT CardInfo
	  select 1, 1, 90
union select 2, 1, 10

union select 3, 2, 1500
union select 4, 2, 0

union select 5, 3, 0.20

union select 6, 4, 110
union select 7, 4, 320

union select 8, 5, 730

union select 9, 6, 20.40
union select 10, 6, 355

union select 11, 7, 115.15
union select 12, 7, 0

union select 13, 8, 345.90
union select 14, 8, 120
union select 15, 8, 210.35

union select 16, 9, 230.30

union select 17, 10, 150

union select 18, 11, 180
union select 19, 11, 345

union select 20, 12, 120

union select 21, 13, 120.45
union select 22, 13, 155.15

union select 23, 14, 20
union select 24, 14, 325.35
union select 25, 14, 140.40

union select 26, 15, 370.55
union select 27, 15, 0.80

union select 28, 16, 20

union select 29, 17, 15.10
union select 30, 17, 40.75

union select 31, 18, 25.60

union select 32, 19, 35

union select 33, 20, 700
union select 34, 20, 210.20

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
SELECT SUM(CardInfo.CardBalance) AS SumCardBalance
FROM Account INNER JOIN CardInfo ON CardInfo.AccountId = Account.AccountId
GROUP BY CardInfo.AccountId

SELECT CardInfo.CardBalance - Account.AccountBalance AS SumCardBalance
FROM Account INNER JOIN CardInfo ON CardInfo.AccountId = Account.AccountId
GROUP BY CardInfo.AccountId

SELECT SUM(Account.AccountBalance)
FROM Account 
GROUP BY Account.AccountId


------------------------------------------------Query-4----------------------------------------------
----Display the number of the bank cards for each social status: Group by
GO
SELECT UserStatus.SocialStatus, COUNT(UserStatus.SocialStatus) AS CountCards
FROM UserStatus INNER JOIN UserInfo ON UserInfo.SocialStatusId = UserStatus.SocialStatusId
GROUP BY UserStatus.SocialStatus
ORDER BY CountCards

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
	SELECT Account.AccountName, @AddSomeMoney AS AddMoney, (Account.AccountBalance + @AddSomeMoney) AS AfterAddMoney
	FROM Account INNER JOIN UserInfo ON UserInfo.UserId = Account.UserId
				 INNER JOIN UserStatus ON UserStatus.SocialStatusId = UserInfo.SocialStatusId
	WHERE UserStatus.SocialStatus = @SocialStatus
END
GO
EXEC AddTenDollars 'Disable', 10

DROP PROCEDURE AddTenDollars

------------------------------------------------Query-6----------------------------------------------
----Displays a list of available funds for each client to transfer funds to any card
----Available transfer amount for each account on an accrual basis
GO
SELECT Account.AccountName, SUM(Account.AccountBalance - CardInfo.CardBalance) OVER(PARTITION BY Account.AccountId ORDER BY CardInfo.CardBalance) AS AvailableTransferAmount
FROM Account INNER JOIN CardInfo ON CardInfo.AccountId = Account.AccountId

------------------------------------------------Query-7----------------------------------------------
----Procedure that safely transfer money from an account to a card of this account using transaction
GO
CREATE PROCEDURE TransactionProcedure
(
	@TransitAccount int, @FromTransitToCard decimal(6,2)
)
AS
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
	BEGIN TRANSACTION;
		SELECT @TransitAccount AS TransitAccount, Account.AccountName, @FromTransitToCard AS ExpectedAmountCredited, CardInfo.CardBalance, (CardBalance + @FromTransitToCard) AS AfterTransactionCardBalance
		FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId
		WHERE CardInfo.CardId = @TransitAccount
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	DECLARE @msg nvarchar(2048) = error_message()
	RAISERROR (@msg, 16, 1)
	RETURN 0
END CATCH
GO
EXEC TransactionProcedure 4, 500

------------------------------------------------Query-8----------------------------------------------
-------------------------------------------------------Trigger for card-----------------------------------------------------
GO
CREATE TRIGGER CardInfoTrigger ON CardInfo
AFTER UPDATE AS
IF EXISTS
(
	SELECT CardInfo.CardBalance
	FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId
	WHERE CardInfo.CardBalance > Account.AccountBalance
)
BEGIN
	RAISERROR ('Sorry, nothing to find', 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END
ELSE IF EXISTS
(
	SELECT CardInfo.CardBalance
	FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId
	WHERE CardInfo.CardBalance < 0
)
BEGIN
	RAISERROR ('Sorry, nothing to find', 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END;

-------------------------------------------------------Trigger for account-----------------------------------------------------
GO
CREATE TRIGGER AccountTrigger ON Account
AFTER UPDATE AS
IF EXISTS
(
	SELECT Account.AccountBalance
	FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId
	WHERE Account.AccountBalance < CardInfo.CardBalance
)
BEGIN
	RAISERROR ('Sorry, nothing to find', 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END
ELSE IF EXISTS
(
	SELECT Account.AccountBalance
	FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId
	WHERE Account.AccountBalance < 0
)
BEGIN
	RAISERROR ('Sorry, nothing to find', 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END

--------------------------------------------------Tests for trigger---------------------------------------------
DROP TRIGGER CardInfoTrigger
DROP TRIGGER AccountTrigger

DROP PROCEDURE TransactionProcedure

--Immitation of transaction for card
DECLARE @CardBalance decimal(6,2) = 10.25
UPDATE CardInfo  SET CardBalance = CardInfo.CardBalance + @CardBalance WHERE CardInfo.CardId = 1

--Immitation of transaction for account
DECLARE @AccountBalance decimal(6,2) = 100
UPDATE Account  SET AccountBalance = Account.AccountBalance + @AccountBalance WHERE AccountId = 1

--Table output
SELECT CardId, AccountName, CardBalance, AccountBalance 
FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId