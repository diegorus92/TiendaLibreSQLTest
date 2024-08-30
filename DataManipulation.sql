--USE TiendaLibreTest1;

--USER INSERTS
INSERT INTO [User](
	UserName, UserLastName, UserDNI, UserBirthdate,
	UserCellphone, UserAddress, UserCountry, UserCity,
	UserRegisterDate, UserEmail
) 
VALUES(
	'Diego', 'Rus', '36674605', '1992-03-07', 
	'+543794701578', 'B� Pujol Mz7 C20, Felix De Azara',
	'Argentina', 'Corrientes', '2024-04-14', 'diegorus.1992@gmail.com'
);

INSERT INTO [User](
	UserName, UserLastName, UserDNI, UserBirthdate,
	UserCellphone, UserAddress, UserCountry, UserCity,
	UserRegisterDate, UserEmail
) 
VALUES(
	'Gabriel', 'Martinez', '38478965', '1992-05-27', 
	'+543794458789', 'Madariaga 1233',
	'Argentina', 'Resistencia', '2023-05-05',
	'gaby.Marinez123@gmail.com'
);


INSERT INTO [User](
	UserName, UserLastName, UserDNI, UserBirthdate,
	UserCellphone, UserAddress, UserCountry, UserCity,
	UserRegisterDate, UserEmail
) 
VALUES(
	'Monica', 'Castillo', '30989834', '1986-12-27', 
	'+543624875786', 'Piedra Santa 34',
	'Argentina', 'Jujuy', '2023-11-25',
	'mony_laloca34@gmail.com'
);


--PRODUCTS INSERTS
INSERT INTO [Products](ProductName, ProductCategory, ProductBrand, ProductModel, ProductPrice, ProductStockQty, ProductUserSellerId)
VALUES('Keyboard', 'Informatic', 'Logitech', 'KB-GAMER-1800', '5500.99', 35, 2);

INSERT INTO [Products](ProductName, ProductCategory, ProductBrand, ProductModel, ProductPrice, ProductStockQty, ProductUserSellerId)
VALUES('Monitor', 'Informatic', 'Samsung', 'SM-MON24S', '28000', 20, 2);

INSERT INTO [Products](ProductName, ProductCategory, ProductBrand, ProductModel, ProductPrice, ProductStockQty, ProductUserSellerId)
VALUES('Home Theatre', 'Electronic', 'Sony', 'SY-HOME2300', '32500.99', 10, 2);

INSERT INTO [Products](ProductName, ProductCategory, ProductBrand, ProductModel, ProductPrice, ProductStockQty, ProductUserSellerId)
VALUES('Acustic Guitar', 'Instruments', 'Crow', 'Crow-GA23', '12500', 10, 3);

INSERT INTO [Products](ProductName, ProductCategory, ProductBrand, ProductModel, ProductPrice, ProductStockQty, ProductUserSellerId)
VALUES('Electronic Piano', 'Instruments', 'Casio', 'CAS-EP2000', '150000.99', 0, 3);

--PRODUCTS UPDATES
UPDATE[Products] SET ProductBrand='Logitech' WHERE ProductName = 'Keyboard';
UPDATE [Products] SET ProductStockQty = (ProductStockQty+1) WHERE NOT ProductId=3;