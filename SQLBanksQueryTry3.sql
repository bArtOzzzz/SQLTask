USE master
if exists(select * from sys.tables where name='BankInfo') drop table BankInfo
if exists(select * from sys.tables where name='BankBranches' ) drop table BankBranches
if exists(select * from sys.tables where name='UserCardInfo' ) drop table UserCardInfo
if exists(select * from sys.tables where name='UserAccountInfo' ) drop table UserAccountInfo

if exists(select * from sys.procedures where name='TransactionProcedure' ) drop procedure TransactionProcedure
if exists(select * from sys.procedures where name='AddTenDollars' ) drop procedure AddTenDollars

if exists(select * from sys.triggers where name='UserCardsTrigger' ) drop trigger UserCardsTrigger
if exists(select * from sys.triggers where name='UserAccountsTrigger' ) drop trigger UserAccountsTrigger
GO
CREATE TABLE BankInfo
(
	BankId int,
	BankName varchar(55),
	BankTransitAmount decimal(19,2),
)
GO
INSERT BankInfo
	  select 1, 'Альфа-Банк', 1000500
union select 2, 'Белинвестбанк', 190000.23
union select 3, 'Технобанк', 785000.45
union select 4, 'БелВЭБ', 123123123.43
union select 5, 'МТБанк', 4587555
union select 6, 'Беларусьбанк', 800800
GO
CREATE TABLE BankBranches
(
	BankId int,
	City varchar(125),
	--Adress varchar(55)
)
GO
INSERT BankBranches
	  select 1, 'Гомель'
union select 2, 'Гомель'
union select 3, 'Гомель'
union select 4, 'Гомель'
union select 5, 'Гомель'
union select 6, 'Гомель'

union select 1, 'Брест'
union select 2, 'Брест'
union select 3, 'Брест'

union select 4, 'Гродно'
union select 5, 'Гродно'
union select 1, 'Гродно'
union select 3, 'Гродно'

union select 1, 'Могилев'
union select 2, 'Могилев'
union select 3, 'Могилев'
union select 4, 'Могилев'
union select 5, 'Могилев'
union select 6, 'Могилев'

union select 5, 'Витебск'
union select 6, 'Витебск'
GO
CREATE TABLE UserCardInfo
(
	CardId int,
	BankId int,
	UserCardName varchar(125),
	CardBalance decimal(6,2),
	TotalCardsBalance decimal(6,2)
)
GO
INSERT UserCardInfo
	  select 1, 1, 'Анастасия', 100.25, null
union select 2, 2, 'Анастасия', 125, null

union select 3, 2, 'Лев', 10.20, null

union select 4, 3, 'Анна', 65.90, null
union select 5, 3, 'Анна', 0.50, null
union select 6, 4, 'Анна', 230.90, null
union select 7, 5, 'Анна', 115.45, null

union select 8, 6, 'Мария', 230.95, null
union select 9, 5, 'Мария', 55.55, null
union select 10, 5, 'Мария', 1100,  null

union select 11, 4, 'Александр', 2000.15, null
union select 12, 6, 'Александр', 1340.40, null
union select 13, 2, 'Александр', 2022, null
GO
CREATE TABLE UserAccountInfo
(
	AccountId int,
	UserAccountName varchar(125),
	SocialStatus varchar(125),
	AccountBalance decimal(6,2),
	TotalAccountBalance decimal(6,2)
)
GO
INSERT UserAccountInfo
	  select 1, 'Anastasiya', 'Worker', 100.25, null
union select 2, 'Anastasiya', 'Worker', 150, null

union select 3, 'Lev', 'Pensioner', 100.75, null

union select 4, 'Anna', 'Disable', 65.90, null
union select 5, 'Anna', 'Disable', 0.50, null
union select 6, 'Anna', 'Disable', 730.90, null
union select 7, 'Anna', 'Disable', 190, null

union select 8, 'Maria', 'Student', 275.45, null
union select 9, 'Maria', 'Student', 55.55, null
union select 10, 'Maria', 'Student', 1500, null

union select 11, 'Alexander', 'Worker', 2022.15, null
union select 12, 'Alexander', 'Worker', 1765.35, null
union select 13, 'Alexander', 'Worker', 2022, null

----------------------------------------------ЗАПРОС-1----------------------------------------------
--Выводит список банков у которых есть филиалы в Городе Х
GO
SELECT BankName, City 
FROM BankInfo RIGHT JOIN BankBranches ON BankInfo.BankId = BankBranches.BankId 
WHERE City = 'Брест' 
ORDER BY BankName

----------------------------------------------ЗАПРОС-2----------------------------------------------
--Выводит список карточек с указанием имени владельца, баланса и названия банка
GO
SELECT CardId, BankInfo.BankId, UserCardName, BankName, CardBalance 
FROM UserCardInfo LEFT JOIN BankInfo ON UserCardInfo.BankId = BankInfo.BankId
ORDER BY UserCardName

----------------------------------------------ЗАПРОС-3----------------------------------------------
--Выводит список банковских аккаунтов у которых баланс не совпадает с суммой баланса по карточке и показывает разность
GO
SELECT UserAccountName, CardBalance, AccountBalance, (AccountBalance - CardBalance) DifferenceVal 
FROM UserAccountInfo INNER JOIN UserCardInfo ON CardId = AccountId 
WHERE AccountBalance != CardBalance

----------------------------------------------ЗАПРОС-4----------------------------------------------
--Выводит количество банковских карточек для каждого социального статуса: РЕАЛИЗАЦИЯ GROUP BY
GO
SELECT SocialStatus, COUNT(SocialStatus) CountCards 
FROM UserAccountInfo 
WHERE SocialStatus IS NOT NULL 
GROUP BY SocialStatus 
ORDER BY CountCards DESC

--Выводит количество банковских карточек для каждого социального статуса: РЕАЛИЗАЦИЯ ПОДЗАПРОСОМ
GO
SELECT SocialStatus, COUNT(SocialStatus) CountCards
FROM
(
	SELECT SocialStatus, COUNT(SocialStatus) CountCards
	FROM UserAccountInfo INNER JOIN UserCardInfo ON AccountId = CardId
	GROUP BY SocialStatus, AccountId
)t1
GROUP BY SocialStatus 
ORDER BY CountCards DESC

----------------------------------------------ЗАПРОС-5----------------------------------------------
--Добавление по 10$ на каждый банковский аккаунт для определенного социального статуса
GO
CREATE PROCEDURE AddTenDollars 
(
	@SocialStatus varchar(125), @AddSomeMoney decimal(6,2)
)
AS
BEGIN 
	SELECT UserAccountName, AccountBalance, @AddSomeMoney PlusMoney,(AccountBalance + @AddSomeMoney) AfterAddMoney 
	FROM UserAccountInfo
	WHERE SocialStatus = @SocialStatus
END
GO
EXEC AddTenDollars 'Student', 30

----------------------------------------------ЗАПРОС-6----------------------------------------------
--Выводит список доступных средств для каждого клиента для перевода денежных средств на любую из карт
--Доступная сумма перевода для каждого аккуанта нарастающим итогом
GO
SELECT UserAccountName, AccountBalance, CardBalance, sum(AccountBalance - CardBalance) OVER(PARTITION BY UserAccountName ORDER BY CardBalance DESC) AvailableTransferAmount
FROM UserAccountInfo INNER JOIN UserCardInfo ON CardId = AccountId

----------------------------------------------ЗАПРОС-7----------------------------------------------
--Процедура, которая безопасно переводит деньги со счета на карту этого аккаунта используя транзакцию
GO
CREATE PROCEDURE TransactionProcedure
(
	@TransitAccount int,
	@FromTransitToCard decimal(6,2)
)
AS
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
	BEGIN TRANSACTION;
	INSERT UserCardInfo(UserCardName, CardBalance) VALUES (@TransitAccount, @FromTransitToCard) 
	SELECT @TransitAccount TransitAccount, UserCardName, @FromTransitToCard ExpectedAmountCredited, BankTransitAmount, (BankTransitAmount - @FromTransitToCard) TransitOperation, CardBalance, (CardBalance + @FromTransitToCard) AfterTransactionCardBalance
	FROM UserCardInfo INNER JOIN BankInfo ON @TransitAccount = UserCardInfo.CardId
	WHERE UserCardInfo.CardId = @TransitAccount AND UserCardInfo.BankId = BankInfo.BankId;  
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	DECLARE @msg nvarchar(2048) = error_message()
	RAISERROR (@msg, 16, 1)
	RETURN 0
END CATCH
GO
EXEC TransactionProcedure 2, 500

----------------------------------------------ЗАПРОС-8----------------------------------------------
-----------------------------------------------------Триггер для карты-----------------------------------------------------
GO
CREATE TRIGGER UserCardsTrigger ON UserCardInfo
AFTER INSERT, UPDATE, DELETE AS
---------------------------Выбирается-id-карты-для-транзакции
DECLARE @Id int = 1
-------------------------------------------------------------
	IF EXISTS
	(
		SELECT CardBalance 
		FROM UserCardInfo, UserAccountInfo
		WHERE TotalCardsBalance > AccountBalance
	)
BEGIN
	RAISERROR ('Sorry, nothing to find', 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END
ELSE
	UPDATE UserCardInfo SET CardBalance = TotalCardsBalance WHERE CardId = @Id
IF EXISTS
	(
		SELECT CardBalance 
		FROM UserCardInfo, UserAccountInfo
		WHERE TotalCardsBalance < 0
	)
BEGIN
	RAISERROR ('Sorry, nothing to find', 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END
ELSE
UPDATE UserCardInfo SET CardBalance = TotalCardsBalance WHERE CardId = @Id;

-----------------------------------------------------Триггер для аккаунта-----------------------------------------------------
GO
CREATE TRIGGER UserAccountsTrigger ON UserAccountInfo
AFTER INSERT, UPDATE, DELETE AS
---------------------------Выбирается-id-карты-для-транзакции
DECLARE @Id int = 1
-------------------------------------------------------------
	IF EXISTS
	(
		SELECT AccountBalance 
		FROM UserCardInfo, UserAccountInfo
		WHERE TotalAccountBalance < CardBalance
	)
BEGIN
	RAISERROR ('Sorry, nothing to find', 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END
ELSE
	UPDATE UserAccountInfo SET AccountBalance = TotalAccountBalance WHERE AccountId = @Id
IF EXISTS
	(
		SELECT CardBalance 
		FROM UserCardInfo, UserAccountInfo
		WHERE TotalAccountBalance < 0
	)
BEGIN
	RAISERROR ('Sorry, nothing to find', 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END
ELSE
UPDATE UserAccountInfo SET AccountBalance = TotalAccountBalance WHERE AccountId = @Id;

------------------------------------------------ТЕСТЫ ДЛЯ ТРИГГЕРОВ---------------------------------------------

--Для карты
--Иммитация транзакции. Поступление или снятие денежных средств на карту
DECLARE @CardBalance decimal(6,2) = -100
UPDATE UserCardInfo  SET TotalCardsBalance = CardBalance + @CardBalance WHERE CardId = 1

--Для аккаунта
--Иммитация транзакции. Поступление или снятие денежных средств с аккаунта
DECLARE @AccountBalance decimal(6,2) = 100
UPDATE UserAccountInfo  SET TotalAccountBalance = AccountBalance + @AccountBalance WHERE AccountId = 1

--Вывод таблицы
SELECT CardId, UserCardName, CardBalance, TotalCardsBalance , SocialStatus, AccountBalance, TotalAccountBalance
FROM UserCardInfo INNER JOIN UserAccountInfo ON CardId = AccountId