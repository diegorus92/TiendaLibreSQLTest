--USE TiendaLibreTest1

CREATE PROCEDURE ViewSellingProductsFromUser @user_id INT
AS
	SELECT U.UserId, U.UserName, U.UserLastName, P.* FROM [Products] P
	INNER JOIN [User] U
	ON P.ProductUserSellerId = U.UserId
	WHERE U.UserId = @user_id
GO


CREATE PROCEDURE BuyAProduct @product_id INT, @costumer_id INT
AS
	INSERT INTO [Purchase](ProductId, UserCostumerId) VALUES(@product_id, @costumer_id)

	DECLARE @seller_id INT
	SELECT @seller_id=ProductUserSellerId FROM [Products] WHERE ProductId=@product_id

	DECLARE @current_purchaseId INT = IDENT_CURRENT('Purchase') --IDENT_CURRENT('tableName') return the last identity value generated from an especific table
	--Message for seller
	INSERT INTO [Announcement](AnnouncementMessage, UserIdReceiver, PurchaseId) VALUES('You have a new sell!', @seller_id, @current_purchaseId)
	
	--Message for costumer
	INSERT INTO [Announcement](AnnouncementMessage, UserIdReceiver, PurchaseId) VALUES('You have a new purchase!', @costumer_id, @current_purchaseId)

GO

--Modify Store Procedure
ALTER PROCEDURE BuyAProduct @product_id INT, @costumer_id INT
AS
	
	BEGIN TRAN --Transaction opened
	INSERT INTO [Purchase](ProductId, UserCostumerId) VALUES(@product_id, @costumer_id)

	DECLARE @seller_id INT
	SELECT @seller_id=ProductUserSellerId FROM [Products] WHERE ProductId=@product_id

	DECLARE @current_purchaseId INT = IDENT_CURRENT('Purchase') --IDENT_CURRENT('tableName') return the last identity value generated from an especific table
	--Message for seller
	INSERT INTO [Announcement](AnnouncementMessage, UserIdReceiver, PurchaseId) VALUES('You have a new sell!', @seller_id, @current_purchaseId)
	
	--Message for costumer
	INSERT INTO [Announcement](AnnouncementMessage, UserIdReceiver, PurchaseId) VALUES('You have a new purchase!', @costumer_id, @current_purchaseId)

	--Disccount product stockQty
	DECLARE @stock INT 
	SELECT @stock=ProductStockQty FROM [Products] WHERE ProductId = @product_id
	if(@stock > 0)
		BEGIN
			UPDATE [Products] SET ProductStockQty = (ProductStockQty - 1) WHERE ProductId=@product_id
			COMMIT TRAN --End Transaction, OP successful
		END
	ELSE
		BEGIN
			SELECT 'Without stock. Operation cancelled'
			ROLLBACK --End Transaction OP failed
		END
GO

