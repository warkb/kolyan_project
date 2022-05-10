CREATE DATABASE Passenger_Train_Schedule;
GO
USE Passenger_Train_Schedule;
GO

CREATE TABLE TrainNumber(
	TrainNumberId uniqueidentifier NOT NULL,
	RouteNumber int NOT NULL,
	CONSTRAINT [PK_TrainNumberId] PRIMARY KEY CLUSTERED ([TrainNumberId] ASC),
);
GO

CREATE TABLE TrainCategory (
	CategoryId uniqueidentifier NOT NULL,
	CategoryName varchar(100) NOT NULL,
	CONSTRAINT [PK_CategoryId] PRIMARY KEY CLUSTERED ([CategoryId] ASC),
);
GO

CREATE TABLE CarriageType (
	CarriageId uniqueidentifier NOT NULL,
	CarriageCategory varchar(100) NOT NULL,
	CONSTRAINT [PK_CarriageId] PRIMARY KEY CLUSTERED ([CarriageId] ASC),
);
GO

CREATE TABLE TrainMovement(
	ID int IDENTITY(1,1) NOT NULL,
	TrainNumberId uniqueidentifier NOT NULL,
	CategoryId uniqueidentifier NOT NULL,
	StationName varchar(100) NOT NULL,
	TimeStart time(0) NULL,
	TimeStop time(0) NULL,
	IsEndStation bit NOT NULL,
	CONSTRAINT [PK_TrainMovement] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_CategoryId] FOREIGN KEY (CategoryId) REFERENCES TrainCategory(CategoryId),
	CONSTRAINT [FK_TrainNumberId] FOREIGN KEY (TrainNumberId) REFERENCES TrainNumber(TrainNumberId)
);
GO

CREATE TABLE TrainComposition (
	ID int IDENTITY(1,1) NOT NULL,
	CarriageId uniqueidentifier NOT NULL,
	TrainNumberID uniqueidentifier NOT NULL,
	CarriageNumber int,
	CONSTRAINT [PK_TrainComposition] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_CarriageId] FOREIGN KEY (CarriageId) REFERENCES CarriageType(CarriageId),
	CONSTRAINT [FK_TrainNumberID_To_TrainNumber] FOREIGN KEY (TrainNumberID) REFERENCES TrainNumber(TrainNumberID)
);
GO

INSERT INTO CarriageType (CarriageId, CarriageCategory)
VALUES 
('1604d98c-578a-4424-ac41-5ee822d2b92c', 'Сидячий'),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', 'Плацкартный'),
('6a8b400b-f61d-461d-9134-32fb10db6864', 'Купейный'),
('edeb2689-4810-4611-b0ce-cad5354a58a8', 'СВ');

INSERT INTO TrainNumber (TrainNumberId, RouteNumber)
VALUES 
('4a39309d-d159-4aa5-b610-bd6065c97cb3', 701),
('725a9f01-e3ac-46d3-8d30-8ad993ef7af7', 702),
('77b2e348-d61b-4a81-9bf0-8985183e5c30', 11),
('da04e54f-32f6-429e-9704-152cc181fe48', 12),
('8459a4d2-0d3f-4c93-a9c5-bfb968b23f91', 301),
('1634f8d8-7d86-42de-8260-04e5c6ea8c42', 302),
('a36ec14b-47d6-416a-938c-408b1f0dcdf5', 7001),
('7e098803-917c-41ac-96f7-09ceb67e9145', 7002);

INSERT INTO TrainCategory (CategoryId, CategoryName)
VALUES 
('08d0af4c-492d-4dad-a95f-a20883ec6999', 'Скоростной'),
('07c9d858-0496-45d5-8c08-d824947fc9b0', 'Скорый'),
('8321ab22-3124-4fe9-a0dc-82d9c2ca8521', 'Пассажирский'),
('f58bfea1-3ae3-4fc0-a4c6-e6a035f9eb74', 'Пригородный');

INSERT INTO TrainComposition (CarriageId, TrainNumberID, CarriageNumber)
VALUES 
('1604d98c-578a-4424-ac41-5ee822d2b92c', 'a36ec14b-47d6-416a-938c-408b1f0dcdf5', 1),
('1604d98c-578a-4424-ac41-5ee822d2b92c', 'a36ec14b-47d6-416a-938c-408b1f0dcdf5', 2),
('1604d98c-578a-4424-ac41-5ee822d2b92c', 'a36ec14b-47d6-416a-938c-408b1f0dcdf5', 3),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '7e098803-917c-41ac-96f7-09ceb67e9145', 1),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '7e098803-917c-41ac-96f7-09ceb67e9145', 2),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '7e098803-917c-41ac-96f7-09ceb67e9145', 3),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', '4a39309d-d159-4aa5-b610-bd6065c97cb3', 1),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', '4a39309d-d159-4aa5-b610-bd6065c97cb3', 2),
('6a8b400b-f61d-461d-9134-32fb10db6864', '4a39309d-d159-4aa5-b610-bd6065c97cb3', 3),
('edeb2689-4810-4611-b0ce-cad5354a58a8', '4a39309d-d159-4aa5-b610-bd6065c97cb3', 4),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', '725a9f01-e3ac-46d3-8d30-8ad993ef7af7', 1),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', '725a9f01-e3ac-46d3-8d30-8ad993ef7af7', 2),
('6a8b400b-f61d-461d-9134-32fb10db6864', '725a9f01-e3ac-46d3-8d30-8ad993ef7af7', 3),
('edeb2689-4810-4611-b0ce-cad5354a58a8', '725a9f01-e3ac-46d3-8d30-8ad993ef7af7', 4),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '77b2e348-d61b-4a81-9bf0-8985183e5c30', 1),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '77b2e348-d61b-4a81-9bf0-8985183e5c30', 2),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', '77b2e348-d61b-4a81-9bf0-8985183e5c30', 3),
('6a8b400b-f61d-461d-9134-32fb10db6864', '77b2e348-d61b-4a81-9bf0-8985183e5c30', 4),
('1604d98c-578a-4424-ac41-5ee822d2b92c', 'da04e54f-32f6-429e-9704-152cc181fe48', 1),
('1604d98c-578a-4424-ac41-5ee822d2b92c', 'da04e54f-32f6-429e-9704-152cc181fe48', 2),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', 'da04e54f-32f6-429e-9704-152cc181fe48', 3),
('6a8b400b-f61d-461d-9134-32fb10db6864', 'da04e54f-32f6-429e-9704-152cc181fe48', 4),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '8459a4d2-0d3f-4c93-a9c5-bfb968b23f91', 1),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '8459a4d2-0d3f-4c93-a9c5-bfb968b23f91', 2),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', '8459a4d2-0d3f-4c93-a9c5-bfb968b23f91', 3),
('6a8b400b-f61d-461d-9134-32fb10db6864', '8459a4d2-0d3f-4c93-a9c5-bfb968b23f91', 4),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '1634f8d8-7d86-42de-8260-04e5c6ea8c42', 1),
('1604d98c-578a-4424-ac41-5ee822d2b92c', '1634f8d8-7d86-42de-8260-04e5c6ea8c42', 2),
('3096b247-a1e7-4427-b0ce-b7d847becfb0', '1634f8d8-7d86-42de-8260-04e5c6ea8c42', 3),
('6a8b400b-f61d-461d-9134-32fb10db6864', '1634f8d8-7d86-42de-8260-04e5c6ea8c42', 4);


INSERT INTO TrainMovement (TrainNumberId, CategoryId, StationName, TimeStart, TimeStop, IsEndStation)
VALUES 
('4a39309d-d159-4aa5-b610-bd6065c97cb3', '08d0af4c-492d-4dad-a95f-a20883ec6999', 'Москва', '1:00', NULL, 1),
('4a39309d-d159-4aa5-b610-bd6065c97cb3', '08d0af4c-492d-4dad-a95f-a20883ec6999', 'Владимир', '2:20', '2:00', 0),
('4a39309d-d159-4aa5-b610-bd6065c97cb3', '08d0af4c-492d-4dad-a95f-a20883ec6999', 'Нижний Новгород', NULL, '4:00', 1),
('725a9f01-e3ac-46d3-8d30-8ad993ef7af7', '08d0af4c-492d-4dad-a95f-a20883ec6999', 'Нижний Новгород', '5:00', NULL, 1),
('725a9f01-e3ac-46d3-8d30-8ad993ef7af7', '08d0af4c-492d-4dad-a95f-a20883ec6999', 'Владимир', '6:20', '6:00', 0),
('725a9f01-e3ac-46d3-8d30-8ad993ef7af7', '08d0af4c-492d-4dad-a95f-a20883ec6999', 'Москва', NULL, '8:00', 1),
('77b2e348-d61b-4a81-9bf0-8985183e5c30', '07c9d858-0496-45d5-8c08-d824947fc9b0', 'Самара', '12:00',	NULL, 1),
('77b2e348-d61b-4a81-9bf0-8985183e5c30', '07c9d858-0496-45d5-8c08-d824947fc9b0', 'Сызрань', '14:30', '14:15', 0),
('77b2e348-d61b-4a81-9bf0-8985183e5c30', '07c9d858-0496-45d5-8c08-d824947fc9b0', 'Саратов', NULL, '16:00', 1),
('da04e54f-32f6-429e-9704-152cc181fe48', '07c9d858-0496-45d5-8c08-d824947fc9b0', 'Саратов', '17:00', NULL, 1),
('da04e54f-32f6-429e-9704-152cc181fe48', '07c9d858-0496-45d5-8c08-d824947fc9b0', 'Сызрань', '19:30', '19:15', 0),
('da04e54f-32f6-429e-9704-152cc181fe48', '07c9d858-0496-45d5-8c08-d824947fc9b0', 'Самара', NULL, '21:00', 1),
('8459a4d2-0d3f-4c93-a9c5-bfb968b23f91', '8321ab22-3124-4fe9-a0dc-82d9c2ca8521', 'Адлер', '9:00', NULL,	1),
('8459a4d2-0d3f-4c93-a9c5-bfb968b23f91', '8321ab22-3124-4fe9-a0dc-82d9c2ca8521', 'Краснодар', '11:20', '10:50', 0),
('8459a4d2-0d3f-4c93-a9c5-bfb968b23f91', '8321ab22-3124-4fe9-a0dc-82d9c2ca8521', 'Воронеж', NULL, '17:00', 1),
('1634f8d8-7d86-42de-8260-04e5c6ea8c42', '8321ab22-3124-4fe9-a0dc-82d9c2ca8521', 'Воронеж', '18:00', NULL, 1),
('1634f8d8-7d86-42de-8260-04e5c6ea8c42', '8321ab22-3124-4fe9-a0dc-82d9c2ca8521', 'Краснодар', '20:20', '19:50', 0),
('1634f8d8-7d86-42de-8260-04e5c6ea8c42', '8321ab22-3124-4fe9-a0dc-82d9c2ca8521', 'Адлер', NULL,	'4:00',	1),
('a36ec14b-47d6-416a-938c-408b1f0dcdf5', 'f58bfea1-3ae3-4fc0-a4c6-e6a035f9eb74', 'Санкт-Петербург', '12:00', NULL, 1),
('a36ec14b-47d6-416a-938c-408b1f0dcdf5', 'f58bfea1-3ae3-4fc0-a4c6-e6a035f9eb74', 'Трегубово', '12:43', '12:40',	0),
('a36ec14b-47d6-416a-938c-408b1f0dcdf5', 'f58bfea1-3ae3-4fc0-a4c6-e6a035f9eb74', 'Менделеевская', NULL, '13:20', 1),
('7e098803-917c-41ac-96f7-09ceb67e9145', 'f58bfea1-3ae3-4fc0-a4c6-e6a035f9eb74', 'Санкт-Петербург', '14:00', NULL, 1),
('7e098803-917c-41ac-96f7-09ceb67e9145', 'f58bfea1-3ae3-4fc0-a4c6-e6a035f9eb74', 'Трегубово', '14:43', '14:40',	0),
('7e098803-917c-41ac-96f7-09ceb67e9145', 'f58bfea1-3ae3-4fc0-a4c6-e6a035f9eb74', 'Менделеевская', NULL,	'15:20', 1);


select * from CarriageType;
select * from TrainNumber;
select * from TrainCategory;
select * from TrainComposition;
select * from TrainMovement;