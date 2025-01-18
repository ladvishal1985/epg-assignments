-- 1. Create a stored procedure to display the restaurant name, type and cuisine where the
--    table booking is not zero.
	CREATE PROCEDURE GetRestaurantsWithTableBooking
	AS
	BEGIN
		SELECT 
			RestaurantName,
			RestaurantType,
			CuisinesType
		FROM 
			Jomato
		WHERE 
			TableBooking <> 0;
	END;

	EXEC GetRestaurantsWithTableBooking;
	
-- 2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. 
--	  Check the result and rollback it.
	BEGIN TRANSACTION;

	-- Update the cuisine type
	UPDATE Jomato
	SET CuisinesType = 'Cafeteria'
	WHERE CuisinesType = 'Cafe';

	-- Check the result
	SELECT 
		RestaurantName,
		CuisinesType
	FROM 
		Jomato
	WHERE 
		CuisinesType = 'Cafeteria';

	-- Rollback the transaction
	ROLLBACK TRANSACTION;
-- 3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.
	WITH RankedAreas AS (
		SELECT 
			Area,
			Rating,
			ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNum
		FROM 
			Jomato
	)
	SELECT 
		RowNum,
		Area,
		Rating
	FROM 
		RankedAreas
	WHERE 
		RowNum <= 5;
-- 4. Use the while loop to display the 1 to 50.
	DECLARE @Counter INT = 1;

	WHILE @Counter <= 50
	BEGIN
		PRINT @Counter;
		SET @Counter = @Counter + 1;
	END;
-- 5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.
	CREATE VIEW TopRatingView AS
		WITH RankedRestaurants AS (
			SELECT 
				RestaurantName,
				Rating,
				ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNum
			FROM 
				Jomato
		)
		SELECT 
			RestaurantName,
			Rating
		FROM 
			RankedRestaurants
		WHERE 
			RowNum <= 5;
	SELECT * FROM TopRatingView;
-- 6. Create a trigger that give an message whenever a new record is inserted.
	CREATE TRIGGER trgAfterInsertJomato
	ON Jomato
	AFTER INSERT
	AS
	BEGIN
		PRINT 'A new record has been inserted into the Jomato table.';
	END;

	INSERT INTO Jomato (
		OrderId,
		RestaurantName,
		Rating,
		RestaurantType,
		No_of_rating,
		AverageCost,
		OnlineOrder,
		TableBooking,
		CuisinesType,
		Area,
		LocalAddress,
		Delivery_time
	) VALUES (
		1, -- OrderId
		'The Food Place', -- RestaurantName
		4.5, -- Rating
		'QuickBites', -- RestaurantType
		150, -- No_of_rating
		500, -- AverageCost
		1, -- OnlineOrder (1 for true, 0 for false)
		1, -- TableBooking (1 for true, 0 for false)
		'Italian, Chinese', -- CuisineTypes
		'Downtown', -- Area
		'123 Main St', -- LocalAddress
		30 -- DeliveryTime
	);