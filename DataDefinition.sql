IF NOT EXISTS(SELECT * FROM sys.databases WHERE name='TiendaLibreTest1')
BEGIN
	CREATE DATABASE TiendaLibreTest1
END

SELECT * FROM sys.databases WHERE name='TiendaLibreTest1';

USE TiendaLibreTest1;

CREATE TABLE [User](
	UserId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	UserName VARCHAR(20) NOT NULL,
	UserLastName VARCHAR(20) NOT NULL,
	UserDNI VARCHAR(10) NOT NULL,
	UserBirthdate DATE NOT NULL,
	UserCellphone VARCHAR(20) NOT NULL,
	UserAddress VARCHAR(100) NOT NULL,
	UserCountry VARCHAR(15) NOT NULL,
	UserCity VARCHAR(15) NOT NULL,
	UserRegisterDate DATE NOT NULL,
	UserEmail VARCHAR(50) NOT NULL,
	UserPwHash VARBINARY NULL,
	UserPwSalt VARBINARY NULL,
	UserReputationLvl VARCHAR(30) NULL,
	UserProfileImage VARCHAR(MAX) NULL,
);

CREATE TABLE [Products](
	ProductId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ProductName VARCHAR(50) NOT NULL,
	ProductCategory VARCHAR(20) NOT NULL,
	ProductModel VARCHAR(30) NOT NULL,
	ProductPrice FLOAT NOT NULL,
	ProductStockQty INT NOT NULL DEFAULT 1,
	ProductUserSellerId INT NOT NULL,
	
	FOREIGN KEY(ProductUserSellerId) REFERENCES [User](UserId),
);

CREATE TABLE [ProductImage](
	ProductImageId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ProductImageName VARCHAR(MAX) NOT NULL,
	ProductId INT NOT NULL,

	FOREIGN KEY(ProductId) REFERENCES[Products](ProductId),
);

CREATE TABLE [Purchase](
	PurchaseId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ProductId INT NOT NULL,
	UserCostumerId INT NOT NULL, 
	PurchaseState VARCHAR(50) NOT NULL DEFAULT 'in preparation',

	FOREIGN KEY(ProductId) REFERENCES [Products](ProductId),
	FOREIGN KEY(UserCostumerId) REFERENCES [User](UserId),
);

CREATE TABLE [Announcement](
	AnnouncementId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	AnnouncementMessage VARCHAR(200) NOT NULL,
	AnnouncementRead BIT NOT NULL DEFAULT 0,
	PurchaseId INT NOT NULL,

	FOREIGN KEY(PurchaseId) REFERENCES [Purchase](PurchaseId),
);


ALTER TABLE [User]
	ADD UserRole VARCHAR(15) NOT NULL DEFAULT 'normal';

ALTER TABLE [Products]
	ADD ProductBrand VARCHAR(25) NULL;

ALTER TABLE [Announcement]
	ADD  UserIdReceiver INT NULL;