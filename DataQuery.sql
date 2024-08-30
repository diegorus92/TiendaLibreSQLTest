--USE TiendaLibreTest1;

SELECT * FROM [User];
SELECT * FROM [Products];
SELECT * FROM [ProductImage];
SELECT * FROM [Purchase];
SELECT * FROM [Announcement];



--COMPLEX SELECTS
SELECT U.UserId, U.UserName, U.UserLastName, P.* FROM [Products] P
INNER JOIN [User] U
ON P.ProductUserSellerId = U.UserId
WHERE U.UserName = 'Gabriel' AND U.UserLastName='Martinez';

SELECT * FROM [Products] WHERE NOT ProductId=3;

SELECT U.UserId, U.UserLastName AS 'Costumer Last Name', U.UserName AS 'Costumer Name',
PROD.ProductName, PROD.ProductCategory, PROD.ProductPrice, 
PROD.ProductUserSellerId,
SELLER.UserId, SELLER.UserLastName AS 'Seller Last Name', SELLER.UserName AS 'Seller Name',
P.* FROM [Purchase] P
INNER JOIN [User] U
ON P.UserCostumerId = U.UserId
	INNER JOIN [Products] PROD
	ON P.ProductId=PROD.ProductID
		INNER JOIN [User] SELLER
		ON PROD.ProductUserSellerId=SELLER.UserId
WHERE U.UserDNI='36674605';
	


--Execution of sp
EXEC ViewSellingProductsFromUser @user_id=2;
EXEC BuyAProduct @product_id=6, @costumer_id=1;


--variables testing
DECLARE @id INT --DECLARE @id INT = 5 (definition and setting in one line)
SET @id = 5
PRINT @id;

DECLARE @seller_id INT
SELECT @seller_id = UserId FROM [User] WHERE [User].UserName='Gabriel' AND [User].UserLastName='Martinez'
PRINT @seller_id;

DECLARE @sellerUser_id INT
SELECT @sellerUser_id=ProductUserSellerId FROM [Products] WHERE ProductId=4
PRINT @sellerUser_id;