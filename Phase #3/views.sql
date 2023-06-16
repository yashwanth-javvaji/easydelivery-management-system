USE EASY_DELIVERY;


/*
Annual Top Customers:
This view returns the First Name, Last Name, Total Order Subtotals of the customers who paid top 3 total subtotals of all orders in past 1 year.
*/

DROP VIEW IF EXISTS ANNUAL_TOP_CUSTOMERS;
CREATE VIEW ANNUAL_TOP_CUSTOMERS
AS
SELECT First_name, Last_name, SUM(Subtotals) AS Total_order_subtotals
FROM PERSON
NATURAL JOIN CUSTOMER
NATURAL JOIN ORDER_INFO
NATURAL JOIN `ORDER`
WHERE Placed_on >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 YEAR)
GROUP BY Customer_id
ORDER BY Total_order_subtotals DESC
LIMIT 3;


/*
Popular Restaurant Type:
This view returns the Type of restaurants that have the most number of orders in past 1 year. 
*/

DROP VIEW IF EXISTS NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_TYPE_IN_PAST_ONE_YEAR;
CREATE VIEW NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_TYPE_IN_PAST_ONE_YEAR
AS
SELECT Type, COUNT(*) AS Total_orders
FROM RESTAURANT
NATURAL JOIN RESTAURANT_TYPE
INNER JOIN SHOP
ON RESTAURANT.Restaurant_id = SHOP.Shop_id
NATURAL JOIN ORDER_INFO
NATURAL JOIN `ORDER`
WHERE Placed_on >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 YEAR)
GROUP BY Type;

DROP VIEW IF EXISTS POPULAR_RESTAURANT_TYPE;
CREATE VIEW POPULAR_RESTAURANT_TYPE
AS
SELECT Type, Total_orders
FROM NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_TYPE_IN_PAST_ONE_YEAR
WHERE Total_orders = (
    SELECT MAX(Total_orders)
    FROM NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_TYPE_IN_PAST_ONE_YEAR
);


/*
Potential Silver Member:
This view returns the information of the customers (not a silver member yet) who have placed orders more than 10 times in the past 1 month. 
*/

DROP VIEW IF EXISTS POTENTIAL_SILVER_MEMBER;
CREATE VIEW POTENTIAL_SILVER_MEMBER
AS
SELECT First_name, Middle_name, Last_name, COUNT(*) AS Number_of_orders
FROM PERSON
NATURAL JOIN CUSTOMER
NATURAL JOIN ORDER_INFO
NATURAL JOIN `ORDER`
WHERE Customer_id NOT IN (
    SELECT Silver_member_id
    FROM SILVER_MEMBER
) AND Placed_on >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 MONTH)
GROUP BY Person_id
HAVING Number_of_orders > 10
ORDER BY Number_of_orders DESC;


/*
Best Area Manager:
This view returns the information of the area manager who successfully made the most number of contracts with shops in her/his working area in past 1 year.
*/

DROP VIEW IF EXISTS NUMBER_OF_CONTRACTS_BY_AREA_MANAGERS_IN_PAST_ONE_YEAR;
CREATE VIEW NUMBER_OF_CONTRACTS_BY_AREA_MANAGERS_IN_PAST_ONE_YEAR
AS
SELECT First_name, Middle_name, Last_name, Area, Total_contracts
FROM PERSON
NATURAL JOIN EMPLOYEE
INNER JOIN (
    SELECT Area_manager_id, Area, COUNT(*) AS Total_contracts
    FROM AREA_MANAGER
    NATURAL JOIN CONTRACT
    WHERE Start_time >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 YEAR)
    GROUP BY Area_manager_id, Area
) T
ON T.Area_manager_id = EMPLOYEE.Employee_id;

CREATE VIEW BEST_AREA_MANAGER
AS
SELECT First_name, Middle_name, Last_name, Area, Total_contracts
FROM NUMBER_OF_CONTRACTS_BY_AREA_MANAGERS_IN_PAST_ONE_YEAR T1
WHERE Total_contracts = (
    SELECT MAX(Total_contracts)
    FROM NUMBER_OF_CONTRACTS_BY_AREA_MANAGERS_IN_PAST_ONE_YEAR T2
    WHERE T1.Area = T2.Area
)
ORDER BY Area;


/*
Top Restaurants:
This view returns the top restaurant in each restaurant type that have the most orders in past 1 month.
*/

DROP VIEW IF EXISTS NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_IN_PAST_ONE_MONTH;
CREATE VIEW NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_IN_PAST_ONE_MONTH
AS
SELECT Name, Type, COUNT(*) AS Number_of_orders
FROM SHOP
INNER JOIN RESTAURANT
ON SHOP.Shop_id = RESTAURANT.Restaurant_id
NATURAL JOIN RESTAURANT_TYPE
NATURAL JOIN `ORDER`
NATURAL JOIN ORDER_INFO
WHERE Placed_on >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 MONTH)
GROUP BY Name, Type;

DROP VIEW IF EXISTS TOP_RESTAURANTS;
CREATE VIEW TOP_RESTAURANTS
AS
SELECT Name, Type, Number_of_orders
FROM NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_IN_PAST_ONE_MONTH T1
WHERE Number_of_orders = (
    SELECT MAX(Number_of_orders)
    FROM NUMBER_OF_ORDERS_IN_EACH_RESTAURANT_IN_PAST_ONE_MONTH T2
    WHERE T1.Type = T2.Type
)
ORDER BY Type;