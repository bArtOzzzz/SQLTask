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
	City varchar(125),

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
	  select 1,  1, 'Тихомирова',	'Елизавета', 1,	18
union select 2,  1, 'Смирнов',		'Максим',	 2,	26
union select 3,  2, 'Кудряшов',		'Павел',	 2,	23
union select 4,  4, 'Куприянов',	'Владимир',	 1,	20
union select 5,  5, 'Жданов',		'Мирон',	 1,	21
union select 6,  2, 'Шевелев',		'Илья',		 2,	37
union select 7,  3, 'Краснов',		'Григорий',  3,	68
union select 8,  1, 'Соколова',		'Екатерина', 2,	30
union select 9,  1, 'Степанова',	'Фатима',	 3,	66
union select 10, 2, 'Соколов',		'Владимир',	 2,	42
union select 11, 3, 'Иванова',		'Вера',		 4,	51
union select 12, 5, 'Филиппова',	'Надежда',	 3,	72
union select 13, 1, 'Беспалова',	'Екатерина', 2,	22
union select 14, 1, 'Галкин',		'Савва',	 2,	25
union select 15, 2, 'Попов',		'Александр', 3,	62
union select 16, 3, 'Новиков',		'Ибрагим',	 2,	33
union select 17, 4, 'Смирнов',		'Александр', 3,	71
union select 18, 5, 'Ткачев',		'Виктор',	 4,	44
union select 19, 3, 'Захаров',		'Адам',		 4,	39
union select 20, 1, 'Прокофьев',	'Билал',	 2,	28
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
	  select  1, 1,  1, 'SomeEmail@gmail.com', 100.25
union select  2, 1,  1, 'SomeEmail@gmail.com', 150

union select  3, 2,  2, 'SomeEmail@gmail.com', 1500
union select  4, 5,  2, 'SomeEmail@gmail.com', 10
union select  5, 1,  2, 'SomeEmail@gmail.com', 0.20

union select  6, 3,  3, 'SomeEmail@gmail.com', 120.30
union select  7, 3,  3, 'SomeEmail@gmail.com', 560.35

union select  8, 2,  4, 'SomeEmail@gmail.com', 755.35

union select  9, 1,  5, 'SomeEmail@gmail.com', 20.40

union select 10, 1,  6, 'SomeEmail@gmail.com', 355
union select 11, 4,  6, 'SomeEmail@gmail.com', 450

union select 12, 1,  7, 'SomeEmail@gmail.com', 115.15

union select 13, 1,  8, 'SomeEmail@gmail.com', 855.15
union select 14, 3,  8, 'SomeEmail@gmail.com', 345.75
union select 15, 1,  8, 'SomeEmail@gmail.com', 340

union select 16, 2,  9, 'SomeEmail@gmail.com', 230.30

union select 17, 3, 10, 'SomeEmail@gmail.com', 150

union select 18, 2, 11, 'SomeEmail@gmail.com', 670
union select 19, 1, 11, 'SomeEmail@gmail.com', 345

union select 20, 1, 12, 'SomeEmail@gmail.com', 125
union select 21, 1, 12, 'SomeEmail@gmail.com', 455

union select 22, 4, 13, 'SomeEmail@gmail.com', 345
union select 23, 4, 13, 'SomeEmail@gmail.com', 785

union select 24, 1, 14, 'SomeEmail@gmail.com', 560
union select 25, 5, 14, 'SomeEmail@gmail.com', 370
union select 26, 5, 14, 'SomeEmail@gmail.com', 810

union select 27, 1, 15, 'SomeEmail@gmail.com', 0.80

union select 28, 2, 16, 'SomeEmail@gmail.com', 20

union select 29, 3, 17, 'SomeEmail@gmail.com', 30

union select 30, 1, 18, 'SomeEmail@gmail.com', 65
union select 31, 3, 18, 'SomeEmail@gmail.com', 40

union select 32, 1, 19, 'SomeEmail@gmail.com', 35
union select 33, 2, 19, 'SomeEmail@gmail.com', 700

union select 34, 1, 20, 'SomeEmail@gmail.com', 365
GO
INSERT CardInfo
	  select 1, 1, 90
union select 2, 2, 100
union select 3, 3, 1500
union select 4, 4, 0
union select 5, 5, 0.20
union select 6, 6, 110
union select 7, 7, 320
union select 8, 8, 730
union select 9, 9, 20.40
union select 10, 10, 355
union select 11, 11, 350
union select 12, 12, 0
union select 13, 13, 345.90
union select 14, 14, 120
union select 15, 15, 210.35
union select 16, 16, 130.50
union select 17, 17, 150
union select 18, 18, 670
union select 19, 19, 345
union select 20, 20, 120
union select 21, 21, 120.45
union select 22, 22, 155.15
union select 23, 23, 785
union select 24, 24, 325.35
union select 25, 25, 140.40
union select 26, 26, 370.55
union select 27, 27, 0.80
union select 28, 28, 20
union select 29, 29, 15.10
union select 30, 30, 40.75
union select 31, 31, 25.60
union select 32, 32, 35
union select 33, 33, 700
union select 34, 34, 210.20

--------------------------------------------------Query-1----------------------------------------------
------Displays a list of banks that have a branch in city X
GO
SELECT BankInfo.BankId, City.City, BankInfo.BankName 
FROM BankInfo INNER JOIN BankBranches ON BankInfo.BankId = BankBranches.BankId 
			  INNER JOIN City ON City.CityId = BankBranches.CityId
WHERE BankBranches.CityId = 2

--------------------------------------------------Query-2----------------------------------------------
------Displays a list of cards indicating the name of the owner, balance and the name of the bank
GO
SELECT CardInfo.CardId, BankInfo.BankName, UserInfo.FirstName, UserInfo.LastName, CardInfo.CardBalance 
FROM CardInfo INNER JOIN Account ON Account.AccountId = CardInfo.AccountId 
			  INNER JOIN UserInfo ON UserInfo.UserId = Account.UserId
			  INNER JOIN BankInfo ON Account.BankId = BankInfo.BankId

--------------------------------------------------Query-3----------------------------------------------
------Displays a list of bank accounts where balance doesn't match the sum of the card balance and shows the difference
GO
SELECT Account.AccountId, Account.AccountName, Account.AccountBalance, CardInfo.CardBalance, (Account.AccountBalance - CardInfo.CardBalance) AS DifferenceVal
FROM Account INNER JOIN CardInfo ON CardInfo.AccountId = Account.AccountId
WHERE Account.AccountBalance != CardInfo.CardBalance

------------------------------------------------Query-4----------------------------------------------
----Display the number of the bank cards for each social status: Group by
GO
SELECT UserStatus.SocialStatus, COUNT(UserStatus.SocialStatus) AS CountCards
FROM UserStatus INNER JOIN UserInfo ON UserInfo.SocialStatusId = UserStatus.SocialStatusId
GROUP BY UserStatus.SocialStatus
ORDER BY CountCards

----Display the number of the bank cards for each social status: Subquery
GO
SELECT SocialStatus, COUNT(SocialStatus) AS CountCards 
FROM 
(
	SELECT UserStatus.SocialStatus, UserStatus.SocialStatus AS CountCards
	FROM UserStatus INNER JOIN UserInfo ON UserInfo.SocialStatusId = UserStatus.SocialStatusId
)t1
GROUP BY SocialStatus
ORDER BY CountCards DESC

------------------------------------------------Query-5----------------------------------------------
----Add 10$ for each bank account for a special social status
GO
CREATE PROCEDURE AddTenDollars
(
	@SocialStatus varchar(125), @AddSomeMoney decimal(6,2)
)
AS
BEGIN
	SELECT Account.AccountName, Account.AccountBalance, @AddSomeMoney AS AddMoney, (Account.AccountBalance + @AddSomeMoney) AS AfterAddMoney, UserStatus.SocialStatus
	FROM Account INNER JOIN UserInfo ON UserInfo.UserId = Account.UserId
				 INNER JOIN UserStatus ON UserStatus.SocialStatusId = UserInfo.SocialStatusId
	WHERE UserInfo.SocialStatusId = 1
END
GO
EXEC AddTenDollars 1, 30

------------------------------------------------Query-6----------------------------------------------
----Displays a list of available funds for each client to transfer funds to any card
----Available transfer amount for each account on an accrual basis
GO
SELECT Account.AccountName, Account.AccountBalance, CardInfo.CardBalance, SUM(Account.AccountBalance - CardInfo.CardBalance) OVER(PARTITION BY Account.AccountName ORDER BY CardInfo.CardBalance DESC) AS AvailableTransferAmount
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

--Immitation of transaction for card
DECLARE @CardBalance decimal(6,2) = 10.25
UPDATE CardInfo  SET CardBalance = CardInfo.CardBalance + @CardBalance WHERE CardInfo.CardId = 1

--Immitation of transaction for account
DECLARE @AccountBalance decimal(6,2) = 100
UPDATE Account  SET AccountBalance = Account.AccountBalance + @AccountBalance WHERE AccountId = 1

--Table output
SELECT CardId, AccountName, CardBalance, AccountBalance 
FROM CardInfo INNER JOIN Account ON CardInfo.AccountId = Account.AccountId