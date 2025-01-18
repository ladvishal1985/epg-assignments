select * from Jomato;


-- 1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’
CREATE FUNCTION dbo.StuffChickenIntoQuickBites (@RestaurantType NVARCHAR(50))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @Result NVARCHAR(50)
    
    IF @RestaurantType = 'Quick Bites'
        SET @Result = 'Quick Chicken Bites'
    ELSE
        SET @Result = @RestaurantType
    
    RETURN @Result
END

-- Example of using the function in a SELECT statement
SELECT OrderId, RestaurantName, dbo.StuffChickenIntoQuickBites(RestaurantType) AS ModifiedRestaurantType, 
		Rating, No_of_Rating, AverageCost, OnlineOrder, TableBooking, CuisinesType, Area, LocalAddress, Delivery_time FROM Jomato;

-- 2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating
	CREATE FUNCTION dbo.GetMaxRating()
		RETURNS INT AS
		BEGIN
			DECLARE @MaxRating INT;
		SELECT @MaxRating = MAX(No_of_rating) FROM Jomato;
		RETURN @MaxRating;
	END

	SELECT 
		RestaurantName, CuisinesType, No_of_rating
		FROM Jomato WHERE No_of_rating = dbo.GetMaxRating();

-- 3. Create a Rating Status column to display the rating as 
-- ‘Excellent’ if it has more the 4 start rating, 
-- ‘Good’ if it has above 3.5 and below 4 star rating, 
-- ‘Average’ if it is above 3 and below 3.5 and 
-- ‘Bad’ if it is below 3 star rating.
	SELECT 
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
		Delivery_time,
		CASE
			WHEN Rating > 4 THEN 'Excellent'
			WHEN Rating > 3.5 AND Rating <= 4 THEN 'Good'
			WHEN Rating > 3 AND Rating <= 3.5 THEN 'Average'
			ELSE 'Bad'
		END AS RatingStatus
	FROM 
		Jomato;
-- 4. Find the Ceil, floor and absolute values of the rating column and 
--    display the current date and separately display the year, month_name and day
	SELECT 
		OrderId,
		RestaurantName,
		Rating,
		CEILING(Rating) AS CeilRating,
		FLOOR(Rating) AS FloorRating,
		ABS(Rating) AS AbsRating,
		GETDATE() AS CurrentDate,
		YEAR(GETDATE()) AS CurrentYear,
		DATENAME(MONTH, GETDATE()) AS CurrentMonthName,
		DAY(GETDATE()) AS CurrentDay
		FROM 
			Jomato;
-- 5. Display the restaurant type and total average cost using rollup
SELECT 
    RestaurantType,
    SUM(AverageCost) AS TotalAverageCost
    FROM Jomato
    GROUP BY ROLLUP(RestaurantType);