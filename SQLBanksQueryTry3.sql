-------------------------------------------------------NEW STRUCTURES OF TABLES-------------------------------------------------------
CREATE TABLE BankInfo
(
	BankId int not null,
	BankName varchar(55),

	PRIMARY KEY (BankId)
)
CREATE TABLE City
(
	CityId int not null,
	City varchar(125),

	PRIMARY KEY (CityId)
)
CREATE TABLE UserInfo
(
	UserId int not null,
	CityId int,
	SocialStatus varchar(125),
	UserName varchar(125),
	Age int,

	PRIMARY KEY (UserId)
)
CREATE TABLE BankBranches
(
	BankId int,
	CityId int,
	BankAdress varchar(125),

	FOREIGN KEY (BankId) REFERENCES BankInfo(BankId),
	FOREIGN KEY (CityId) REFERENCES City(CityId)
)
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
CREATE TABLE CardInfo
(
	CardId int not null,
	AccountId int,
	CardBalance decimal(6,2),

	PRIMARY KEY (CardId),
	FOREIGN KEY (AccountId) REFERENCES Account(AccountId)
)

--------------------------------------------------Query-1----------------------------------------------
------Displays a list of banks that have a branch in city X
--GO
--SELECT BankInfo.BankId, BankName, City 
--FROM BankInfo RIGHT JOIN BankBranches ON BankInfo.BankId = BankBranches.BankId 
--WHERE City = 'Brest' 
--ORDER BY BankName

--------------------------------------------------Query-2----------------------------------------------
------Displays a list of cards indicating the name of the owner, balance and the name of the bank
--GO
--SELECT CardInfo.CardId, UserName, CardBalance, BankName
--FROM CardInfo LEFT JOIN UserInfo ON CardInfo.CardId = UserInfo.CardId INNER JOIN BankInfo ON CardInfo.BankId = BankInfo.BankId
----ORDER BY UserCardName

--------------------------------------------------Query-3----------------------------------------------
------Displays a list of bank accounts where balance doesn't match the sum of the card balance and shows the difference
--GO
--SELECT AccountName, AccountBalance, CardBalance, (AccountBalance - CardBalance) DifferenceVal
--FROM Account JOIN CardInfo ON CardInfo.CardId = Account.CardId
--WHERE AccountBalance != CardBalance

------------------------------------------------------------END----------------------------------------------------------


























--USE master
--if exists(select * from sys.tables where name='BankInfo') drop table BankInfo
--if exists(select * from sys.tables where name='BankBranches' ) drop table BankBranches
--if exists(select * from sys.tables where name='UserCardInfo' ) drop table UserCardInfo
--if exists(select * from sys.tables where name='UserAccountInfo' ) drop table UserAccountInfo

--if exists(select * from sys.procedures where name='TransactionProcedure' ) drop procedure TransactionProcedure
--if exists(select * from sys.procedures where name='AddTenDollars' ) drop procedure AddTenDollars

--if exists(select * from sys.triggers where name='UserCardsTrigger' ) drop trigger UserCardsTrigger
--if exists(select * from sys.triggers where name='UserAccountsTrigger' ) drop trigger UserAccountsTrigger
--GO
----------------------------------------------------TABLES STRUCTURE-----------------------------------------
--CREATE TABLE BankInfo
--(
--	BankId int,
--	BankName varchar(55),
--	--BankTransitAmount decimal(19,2),
--)
--GO
--CREATE TABLE BankBranches
--(
--	BankId int,
--	City varchar(125),
--	--Adress varchar(55)
--)
--GO
--CREATE TABLE UserInfo
--(
--	CardId int,
--	UserName varchar(125),
--	UserAge int,
--	City varchar(125)
--)
--GO
--CREATE TABLE CardInfo
--(
--	CardId int,
--	BankId int,
--	--UserCardName varchar(125),
--	CardBalance decimal(6,2),
--	--TotalCardsBalance decimal(6,2)
--)
--CREATE TABLE AccountInfo
--(
--	BankId int,
--	AccountName varchar(125),
--	SocialStatus varchar(125),
--	AccountBalance decimal(6,2),
--	--TotalAccountBalance decimal(6,2)
--)
--INSERT BankInfo
--	  select 1, 'Alpha-Bank', 1000500
--union select 2, 'Belinvestbank', 190000.23
--union select 3, 'Technobank', 785000.45
--union select 4, 'BelWeb', 123123123.43
--union select 5, 'MTBank', 4587555
--union select 6, 'Belarusbank', 800800

--GO
--INSERT BankBranches
--	  select 1, 'Gomel'
--union select 2, 'Gomel'
--union select 3, 'Gomel'
--union select 4, 'Gomel'
--union select 5, 'Gomel'
--union select 6, 'Gomel'

--union select 1, 'Brest'
--union select 2, 'Brest'
--union select 3, 'Brest'

--union select 4, 'Grodno'
--union select 5, 'Grodno'
--union select 1, 'Grodno'
--union select 3, 'Grodno'

--union select 1, 'Mogilev'
--union select 2, 'Mogilev'
--union select 3, 'Mogilev'
--union select 4, 'Mogilev'
--union select 5, 'Mogilev'
--union select 6, 'Mogilev'

--union select 5, 'Vitebsk'
--union select 6, 'Vitebsk'
--GO
--INSERT UserCardInfo
--	  select 1, 1, 'Anastasia', 100.25, null
--union select 2, 2, 'Anastasia', 125, null

--union select 3, 2, 'Lev', 10.20, null

--union select 4, 3, 'Anna', 65.90, null
--union select 5, 3, 'Anna', 0.50, null
--union select 6, 4, 'Anna', 230.90, null
--union select 7, 5, 'Anna', 115.45, null

--union select 8, 6, 'Maria', 230.95, null
--union select 9, 5, 'Maria', 55.55, null
--union select 10, 5, 'Maria', 1100,  null

--union select 11, 4, 'Alexander', 2000.15, null
--union select 12, 6, 'Alexander', 1340.40, null
--union select 13, 2, 'Alexander', 2022, null
--GO
--INSERT UserAccountInfo
--	  select 1, 'Anastasiya@gmail.com', 'Worker', 100.25, null
--union select 2, 'Anastasiya@gmail.com', 'Worker', 150, null

--union select 3, 'Lev@gmail.com', 'Pensioner', 100.75, null

--union select 4, 'Anna@gmail.com', 'Disable', 65.90, null
--union select 5, 'Anna@gmail.com', 'Disable', 0.50, null
--union select 6, 'Anna@gmail.com', 'Disable', 730.90, null
--union select 7, 'Anna@gmail.com', 'Disable', 190, null

--union select 8, 'Maria@gmail.com', 'Student', 275.45, null
--union select 9, 'Maria@gmail.com', 'Student', 55.55, null
--union select 10, 'Maria@gmail.com', 'Student', 1500, null

--union select 11, 'Alexander@gmail.com', 'Worker', 2022.15, null
--union select 12, 'Alexander@gmail.com', 'Worker', 1765.35, null
--union select 13, 'Alexander@gmail.com', 'Worker', 2022, null

------------------------------------------------Query-1----------------------------------------------
----Displays a list of banks that have a branch in city X
--GO
--SELECT BankName, City 
--FROM BankInfo RIGHT JOIN BankBranches ON BankInfo.BankId = BankBranches.BankId 
--WHERE City = 'Brest' 
--ORDER BY BankName

------------------------------------------------Query-2----------------------------------------------
----Displays a list of cards indicating the name of the owner, balance and the name of the bank
--GO
--SELECT CardId, BankInfo.BankId, UserCardName, BankName, CardBalance 
--FROM UserCardInfo LEFT JOIN BankInfo ON UserCardInfo.BankId = BankInfo.BankId
--ORDER BY UserCardName

------------------------------------------------Query-3----------------------------------------------
----Displays a list of bank accounts where balance doesn't match the sum of the card balance and shows the difference
--GO
--SELECT UserAccountName, CardBalance, AccountBalance, (AccountBalance - CardBalance) DifferenceVal 
--FROM UserAccountInfo INNER JOIN UserCardInfo ON CardId = AccountId 
--WHERE AccountBalance != CardBalance

------------------------------------------------Query-4----------------------------------------------
----Display the number of the bank cards for each social status: Group by
--GO
--SELECT SocialStatus, COUNT(SocialStatus) CountCards 
--FROM UserAccountInfo 
--WHERE SocialStatus IS NOT NULL 
--GROUP BY SocialStatus 
--ORDER BY CountCards DESC

----Display the number of the bank cards for each social status: Subquery
--GO
--SELECT SocialStatus, COUNT(SocialStatus) CountCards
--FROM
--(
--	SELECT SocialStatus, COUNT(SocialStatus) CountCards
--	FROM UserAccountInfo INNER JOIN UserCardInfo ON AccountId = CardId
--	GROUP BY SocialStatus, AccountId
--)t1
--GROUP BY SocialStatus 
--ORDER BY CountCards DESC

------------------------------------------------Query-5----------------------------------------------
----Add 10$ for each bank account for a special social status
--GO
--CREATE PROCEDURE AddTenDollars 
--(
--	@SocialStatus varchar(125), @AddSomeMoney decimal(6,2)
--)
--AS
--BEGIN 
--	SELECT UserAccountName, AccountBalance, @AddSomeMoney PlusMoney,(AccountBalance + @AddSomeMoney) AfterAddMoney 
--	FROM UserAccountInfo
--	WHERE SocialStatus = @SocialStatus
--END
--GO
--EXEC AddTenDollars 'Student', 30

------------------------------------------------Query-6----------------------------------------------
----Displays a list of available funds for each client to transfer funds to any card
----Available transfer amount for each account on an accrual basis
--GO
--SELECT UserAccountName, AccountBalance, CardBalance, sum(AccountBalance - CardBalance) OVER(PARTITION BY UserAccountName ORDER BY CardBalance DESC) AvailableTransferAmount
--FROM UserAccountInfo INNER JOIN UserCardInfo ON CardId = AccountId

------------------------------------------------Query-7----------------------------------------------
----Procedure that safely transfer money from an account to a card of this account using transaction
--GO
--CREATE PROCEDURE TransactionProcedure
--(
--	@TransitAccount int,
--	@FromTransitToCard decimal(6,2)
--)
--AS
--SET NOCOUNT ON
--SET XACT_ABORT ON
--BEGIN TRY
--	BEGIN TRANSACTION;
--	INSERT UserCardInfo(UserCardName, CardBalance) VALUES (@TransitAccount, @FromTransitToCard) 
--	SELECT @TransitAccount TransitAccount, UserCardName, @FromTransitToCard ExpectedAmountCredited, BankTransitAmount, (BankTransitAmount - @FromTransitToCard) TransitOperation, CardBalance, (CardBalance + @FromTransitToCard) AfterTransactionCardBalance
--	FROM UserCardInfo INNER JOIN BankInfo ON @TransitAccount = UserCardInfo.CardId
--	WHERE UserCardInfo.CardId = @TransitAccount AND UserCardInfo.BankId = BankInfo.BankId;  
--	COMMIT TRANSACTION;
--END TRY
--BEGIN CATCH
--	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
--	DECLARE @msg nvarchar(2048) = error_message()
--	RAISERROR (@msg, 16, 1)
--	RETURN 0
--END CATCH
--GO
--EXEC TransactionProcedure 2, 500

------------------------------------------------Query-8----------------------------------------------
-------------------------------------------------------Trigger for card-----------------------------------------------------
--GO
--CREATE TRIGGER UserCardsTrigger ON UserCardInfo
--AFTER INSERT, UPDATE, DELETE AS
-----------------------------id of card for transaction--------
--DECLARE @Id int = 1
---------------------------------------------------------------
--	IF EXISTS
--	(
--		SELECT CardBalance 
--		FROM UserCardInfo, UserAccountInfo
--		WHERE TotalCardsBalance > AccountBalance
--	)
--BEGIN
--	RAISERROR ('Sorry, nothing to find', 16, 1)
--	ROLLBACK TRANSACTION
--	RETURN
--END
--ELSE
--	UPDATE UserCardInfo SET CardBalance = TotalCardsBalance WHERE CardId = @Id
--IF EXISTS
--	(
--		SELECT CardBalance 
--		FROM UserCardInfo, UserAccountInfo
--		WHERE TotalCardsBalance < 0
--	)
--BEGIN
--	RAISERROR ('Sorry, nothing to find', 16, 1)
--	ROLLBACK TRANSACTION
--	RETURN
--END
--ELSE
--UPDATE UserCardInfo SET CardBalance = TotalCardsBalance WHERE CardId = @Id;

-------------------------------------------------------Trigger for account-----------------------------------------------------
--GO
--CREATE TRIGGER UserAccountsTrigger ON UserAccountInfo
--AFTER INSERT, UPDATE, DELETE AS
-----------------------------id of card for transaction--------
--DECLARE @Id int = 1
---------------------------------------------------------------
--	IF EXISTS
--	(
--		SELECT AccountBalance 
--		FROM UserCardInfo, UserAccountInfo
--		WHERE TotalAccountBalance < CardBalance
--	)
--BEGIN
--	RAISERROR ('Sorry, nothing to find', 16, 1)
--	ROLLBACK TRANSACTION
--	RETURN
--END
--ELSE
--	UPDATE UserAccountInfo SET AccountBalance = TotalAccountBalance WHERE AccountId = @Id
--IF EXISTS
--	(
--		SELECT CardBalance 
--		FROM UserCardInfo, UserAccountInfo
--		WHERE TotalAccountBalance < 0
--	)
--BEGIN
--	RAISERROR ('Sorry, nothing to find', 16, 1)
--	ROLLBACK TRANSACTION
--	RETURN
--END
--ELSE
--UPDATE UserAccountInfo SET AccountBalance = TotalAccountBalance WHERE AccountId = @Id;

--------------------------------------------------Tests for trigger---------------------------------------------

----Immitation of transaction for card
--DECLARE @CardBalance decimal(6,2) = -100
--UPDATE UserCardInfo  SET TotalCardsBalance = CardBalance + @CardBalance WHERE CardId = 1

----Immitation of transaction for account
--DECLARE @AccountBalance decimal(6,2) = 100
--UPDATE UserAccountInfo  SET TotalAccountBalance = AccountBalance + @AccountBalance WHERE AccountId = 1

----Table output
--SELECT CardId, UserCardName, CardBalance, TotalCardsBalance , SocialStatus, AccountBalance, TotalAccountBalance
--FROM UserCardInfo INNER JOIN UserAccountInfo ON CardId = AccountId