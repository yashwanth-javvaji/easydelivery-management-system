-- 1. Find the names of employee who supervises the most number of deliverers.

DROP VIEW IF EXISTS NUMBER_OF_DELIVERERS_SUPERVISED;
CREATE VIEW NUMBER_OF_DELIVERERS_SUPERVISED
AS
SELECT Supervisor_id, COUNT(*) AS Number_of_deliverers_supervised
FROM DELIVERER
GROUP BY Supervisor_id;

SELECT First_name, Middle_name, Last_name, Number_of_deliverers_supervised
FROM PERSON
NATURAL JOIN EMPLOYEE
INNER JOIN (
	SELECT *
	FROM NUMBER_OF_DELIVERERS_SUPERVISED
	WHERE Number_of_deliverers_supervised = (
		SELECT MAX(Number_of_deliverers_supervised)
        FROM NUMBER_OF_DELIVERERS_SUPERVISED
	)
) T
ON EMPLOYEE.Employee_id = T.Supervisor_id;


-- 2. Find the average number of orders placed by Potential Silver Member.

SELECT AVG(Number_of_orders) AS Average_number_of_orders
FROM POTENTIAL_SILVER_MEMBER;


-- 3. Find all the customers who placed orders of the restaurants that belong to Popular Restaurant Type. Please also report the name of restaurants. 

SELECT PERSON.First_name, PERSON.Middle_name, PERSON.Last_name, Name
FROM POPULAR_RESTAURANT_TYPE
NATURAL JOIN RESTAURANT_TYPE
NATURAL JOIN RESTAURANT
INNER JOIN SHOP
ON RESTAURANT.Restaurant_id = SHOP.Shop_id
NATURAL JOIN ORDER_INFO
NATURAL JOIN CUSTOMER
NATURAL JOIN PERSON;


-- 4. List all the customers that have become a silver member within a month of joining the system.

SELECT First_name, Middle_name, Last_name
FROM PERSON
NATURAL JOIN CUSTOMER
INNER JOIN SILVER_MEMBER
ON CUSTOMER.Customer_id = SILVER_MEMBER.Silver_member_id
NATURAL JOIN MEMBER_CARD
WHERE Joining_date >= DATE_SUB(Issue_date, INTERVAL 1 MONTH);


-- 5. Find the names of deliverers who delivered the most orders in past 1 month.

DROP VIEW IF EXISTS NUMBER_OF_DELIVERIES_MADE_BY_DELIVERERS_IN_PAST_ONE_MONTH;
CREATE VIEW NUMBER_OF_DELIVERIES_MADE_BY_DELIVERERS_IN_PAST_ONE_MONTH
AS
SELECT Deliverer_id, COUNT(*) AS Number_of_deliveries
FROM DELIVERY_INFO
NATURAL JOIN ORDER_INFO
NATURAL JOIN `ORDER`
WHERE Placed_on >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 MONTH)
GROUP BY Deliverer_id;

SELECT First_name, Middle_name, Last_name, Number_of_deliveries
FROM PERSON
NATURAL JOIN EMPLOYEE
INNER JOIN (
	SELECT *
	FROM NUMBER_OF_DELIVERIES_MADE_BY_DELIVERERS_IN_PAST_ONE_MONTH
	WHERE Number_of_deliveries = (
		SELECT MAX(Number_of_deliveries)
        FROM NUMBER_OF_DELIVERIES_MADE_BY_DELIVERERS_IN_PAST_ONE_MONTH
	)
) T
ON EMPLOYEE.Employee_id = T.Deliverer_id;


-- 6. Find the restaurants that provide most promotion in past 1 month.

DROP VIEW IF EXISTS NUMBER_OF_PROMOTIONS_PROVIDED_BY_RESTAURANTS_IN_PAST_ONE_MONTH;
CREATE VIEW NUMBER_OF_PROMOTIONS_PROVIDED_BY_RESTAURANTS_IN_PAST_ONE_MONTH
AS
SELECT Shop_id, COUNT(*) AS Number_of_promotions
FROM PROMOTION
INNER JOIN RESTAURANT
ON PROMOTION.Shop_id = RESTAURANT.Restaurant_id
WHERE Start_date >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 MONTH)
GROUP BY Shop_id;

SELECT Name, Number_of_promotions
FROM SHOP
NATURAL JOIN (
    SELECT *
    FROM NUMBER_OF_PROMOTIONS_PROVIDED_BY_RESTAURANTS_IN_PAST_ONE_MONTH
    WHERE Number_of_promotions = (
        SELECT MAX(Number_of_promotions)
        FROM NUMBER_OF_PROMOTIONS_PROVIDED_BY_RESTAURANTS_IN_PAST_ONE_MONTH
    )
) T;


-- 7. Find the customer who have place orders of all Fast Food restaurants.

SELECT First_name, Middle_name, Last_name
FROM PERSON
NATURAL JOIN CUSTOMER
NATURAL JOIN (
    SELECT Customer_id
    FROM ORDER_INFO
    INNER JOIN RESTAURANT
    ON ORDER_INFO.Shop_id = RESTAURANT.Restaurant_id
    NATURAL JOIN RESTAURANT_TYPE
    WHERE Type = "Fast Food"
    GROUP BY Customer_id
    HAVING COUNT(DISTINCT(Restaurant_id)) = (
        SELECT COUNT(*)
        FROM RESTAURANT_TYPE
        WHERE Type = "Fast Food"
    )
) T;
-- alternate query (using division)
SELECT DISTINCT First_name, Middle_name, Last_name 
FROM ORDER_INFO O1
NATURAL JOIN CUSTOMER
NATURAL JOIN PERSON
WHERE NOT EXISTS (
	(SELECT Restaurant_id
    FROM RESTAURANT_TYPE
    WHERE Type = "Fast Food")
    EXCEPT
    (SELECT Shop_id
    FROM ORDER_INFO O2
    WHERE O1.Customer_id = O2.Customer_id)
);


-- 8. For each restaurant, list all the customers who placed the order there, and the price of each order.

SELECT Name, First_name, Middle_name, Last_name, Subtotals
FROM RESTAURANT
INNER JOIN SHOP
ON RESTAURANT.Restaurant_id = SHOP.Shop_id
NATURAL JOIN ORDER_INFO
NATURAL JOIN `ORDER`
NATURAL JOIN CUSTOMER
NATURAL JOIN PERSON
ORDER BY Name;


-- 9. Find the area that have the most number of restaurants located.

DROP VIEW IF EXISTS NUMBER_OF_RESTAURANTS_IN_EACH_AREA;
CREATE VIEW NUMBER_OF_RESTAURANTS_IN_EACH_AREA
AS
SELECT Area, COUNT(*) AS Number_of_restaurants
FROM RESTAURANT
INNER JOIN SHOP
ON RESTAURANT.Restaurant_id = SHOP.Shop_id
GROUP BY Area;

SELECT Area, Number_of_restaurants
FROM NUMBER_OF_RESTAURANTS_IN_EACH_AREA
WHERE Number_of_restaurants = (
    SELECT MAX(Number_of_restaurants)
    FROM NUMBER_OF_RESTAURANTS_IN_EACH_AREA
);


-- 10. Find the schedule of the restaurant that have the most orders in past 1 month.

DROP VIEW IF EXISTS NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_IN_PAST_ONE_MONTH;
CREATE VIEW NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_IN_PAST_ONE_MONTH
AS
SELECT Shop_id, COUNT(*) AS Number_of_orders
FROM RESTAURANT
INNER JOIN ORDER_INFO
ON RESTAURANT.Restaurant_id = ORDER_INFO.Shop_id
NATURAL JOIN `ORDER`
WHERE Placed_on >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 MONTH)
GROUP BY Shop_id;

SELECT Name, Day, Opening_time, Closing_time
FROM SCHEDULE
NATURAL JOIN SHOP
NATURAL JOIN (
    SELECT *
    FROM NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_IN_PAST_ONE_MONTH
    WHERE Number_of_orders = (
        SELECT MAX(Number_of_orders)
        FROM NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_IN_PAST_ONE_MONTH
    )
) T;


-- 11. Find the names of employee who are also a Premium Member.

SELECT First_name, Middle_name, Last_name
FROM PERSON
NATURAL JOIN EMPLOYEE
WHERE Premium_member_id IS NOT NULL;


-- 12. Find the supermarket that have most different products in stock.

DROP VIEW IF EXISTS NUMBER_OF_DIFFERENT_PRODUCTS_IN_STOCK_FOR_EACH_SUPERMARKETS;
CREATE VIEW NUMBER_OF_DIFFERENT_PRODUCTS_IN_STOCK_FOR_EACH_SUPERMARKETS
AS
SELECT Supermarket_id, COUNT(*) AS Number_of_different_products_in_stock
FROM SUPERMARKET
NATURAL JOIN SELLS
NATURAL JOIN PRODUCT
WHERE Stock > 0
GROUP BY Supermarket_id;

SELECT Name, Number_of_different_products_in_stock
FROM SHOP
INNER JOIN (
    SELECT *
    FROM NUMBER_OF_DIFFERENT_PRODUCTS_IN_STOCK_FOR_EACH_SUPERMARKETS
    WHERE Number_of_different_products_in_stock = (
        SELECT MAX(Number_of_different_products_in_stock)
        FROM NUMBER_OF_DIFFERENT_PRODUCTS_IN_STOCK_FOR_EACH_SUPERMARKETS
    )
) T
ON SHOP.Shop_id = T.Supermarket_id;


-- 13. For each product, list all the supermarket selling it, and the price of the product at the supermarket.

SELECT PRODUCT.Name AS Product_name, SHOP.Name AS Supermarket_name, Price
FROM SELLS
NATURAL JOIN PRODUCT
NATURAL JOIN SUPERMARKET
INNER JOIN SHOP
ON SUPERMARKET.Supermarket_id = SHOP.Shop_id
ORDER BY Product_name;