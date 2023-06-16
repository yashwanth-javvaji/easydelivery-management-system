DROP SCHEMA IF EXISTS EASY_DELIVERY;
CREATE SCHEMA EASY_DELIVERY;

USE EASY_DELIVERY;

-- PERSON
DROP TABLE IF EXISTS PERSON;
CREATE TABLE PERSON (
    Person_id INT(9) NOT NULL AUTO_INCREMENT,
    First_name VARCHAR(63) NOT NULL,
    Middle_name VARCHAR(63),
    Last_name VARCHAR(63) NOT NULL,
    PRIMARY KEY (Person_id)
);

-- MEAL_PASS
DROP TABLE IF EXISTS MEAL_PASS;
CREATE TABLE MEAL_PASS (
    Pass_number INT(9) NOT NULL AUTO_INCREMENT,
    Effective_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Expiration_date DATETIME NOT NULL,
    Free_deliveries INT(2) DEFAULT 10,
    PRIMARY KEY (Pass_number)
);

DROP TRIGGER IF EXISTS setDefaultExpirationDate;
CREATE TRIGGER setDefaultExpirationDate
BEFORE INSERT ON MEAL_PASS
FOR EACH ROW
SET NEW.Expiration_date = DATE_ADD(New.Effective_date, INTERVAL 1 MONTH);

-- PREMIUM_MEMBER
DROP TABLE IF EXISTS PREMIUM_MEMBER;
CREATE TABLE PREMIUM_MEMBER (
    Premium_member_id INT(9) NOT NULL AUTO_INCREMENT,
    Pass_number INT(9) NOT NULL,
    PRIMARY KEY (Premium_member_id),
    FOREIGN KEY (Pass_number) REFERENCES MEAL_PASS(Pass_number)
);

-- EMPLOYEE
DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
    Employee_id VARCHAR(4) NOT NULL,
    Address VARCHAR(511) NOT NULL,
    Date_of_birth DATE NOT NULL,
    Gender ENUM('Male', 'Female') NOT NULL,
    Person_id INT(9) NOT NULL,
    Premium_member_id INT(9),
    PRIMARY KEY (Employee_id),
    FOREIGN KEY (Person_id) REFERENCES PERSON(Person_id),
    FOREIGN KEY (Premium_member_id) REFERENCES PREMIUM_MEMBER(Premium_member_id),
    CONSTRAINT Employee_id_check CHECK (REGEXP_LIKE(Employee_id, 'E[0-9]{3}'))
);

DROP PROCEDURE IF EXISTS Validate_employee_age;
DELIMITER $$
CREATE PROCEDURE Validate_employee_age(
	IN Date_of_birth DATE
)
DETERMINISTIC
NO SQL
BEGIN
	IF ((DATEDIFF(CURRENT_TIMESTAMP, Date_of_birth) / 365.25) - (CASE WHEN MONTH(Date_of_birth) = MONTH(CURRENT_TIMESTAMP) AND DAY(Date_of_birth) > DAY(CURRENT_TIMESTAMP) THEN 1 ELSE 0 END)) < 16 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Age must be not be less than 16';
	END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS Validate_employee_insert;
DELIMITER $$
CREATE TRIGGER Validate_employee_insert
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
	CALL Validate_employee_age(NEW.Date_of_birth);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS Validate_employee_update;
DELIMITER $$
CREATE TRIGGER Validate_employee_update
BEFORE UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN
	CALL Validate_employee_age(NEW.Date_of_birth);
END$$
DELIMITER ;

-- EMPLOYEE_PHONE_NUMBER
DROP TABLE IF EXISTS EMPLOYEE_PHONE_NUMBER;
CREATE TABLE EMPLOYEE_PHONE_NUMBER (
    Employee_id VARCHAR(4) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    PRIMARY KEY (Employee_id, Phone_number),
    FOREIGN KEY (Employee_id) REFERENCES EMPLOYEE(Employee_id)
);

-- EMPLOYMENT
DROP TABLE IF EXISTS EMPLOYMENT;
CREATE TABLE EMPLOYMENT (
    Employee_id VARCHAR(4) NOT NULL,
    Designation ENUM('Area Manager', 'Deliverer', 'Staff') NOT NULL,
    Start_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Employee_id, Designation, Start_date),
    FOREIGN KEY (Employee_id) REFERENCES EMPLOYEE(Employee_id)
);

-- AREA_MANAGER
DROP TABLE IF EXISTS AREA_MANAGER;
CREATE TABLE AREA_MANAGER (
    Area_manager_id VARCHAR(4) NOT NULL,
    Area VARCHAR(31) NOT NULL,
    PRIMARY KEY (Area_manager_id),
    FOREIGN KEY (Area_manager_id) REFERENCES EMPLOYEE(Employee_id)
);

-- DELIVERER
DROP TABLE IF EXISTS DELIVERER;
CREATE TABLE DELIVERER (
    Deliverer_id VARCHAR(4) NOT NULL,
    Supervisor_id VARCHAR(4) NOT NULL,
    PRIMARY KEY (Deliverer_id),
    FOREIGN KEY (Deliverer_id) REFERENCES EMPLOYEE(Employee_id),
    FOREIGN KEY (Supervisor_id) REFERENCES AREA_MANAGER(Area_manager_id)
);

-- STAFF
DROP TABLE IF EXISTS STAFF;
CREATE TABLE STAFF (
    Staff_id VARCHAR(4) NOT NULL,
    PRIMARY KEY (Staff_id),
    FOREIGN KEY (Staff_id) REFERENCES EMPLOYEE(Employee_id)
);

-- VEHICLE
DROP TABLE IF EXISTS VEHICLE;
CREATE TABLE VEHICLE (
    Plate_number VARCHAR(7) NOT NULL,
    Color VARCHAR(31) NOT NULL,
    Maker VARCHAR(31) NOT NULL,
    Model VARCHAR(31) NOT NULL,
    Registrar_id VARCHAR(4) NOT NULL,
    PRIMARY KEY (Plate_number),
    FOREIGN KEY (Registrar_id) REFERENCES DELIVERER(Deliverer_id)
);

-- MEMBER_CARD
DROP TABLE IF EXISTS MEMBER_CARD;
CREATE TABLE MEMBER_CARD (
    Card_number INT(9) NOT NULL AUTO_INCREMENT,
    Issue_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Issuer_id VARCHAR(4) NOT NULL,
    PRIMARY KEY (Card_number),
    FOREIGN KEY (Issuer_id) REFERENCES STAFF(Staff_id)
);

-- CUSTOMER
DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER (
    Customer_id VARCHAR(4) NOT NULL,
    Joining_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Phone_number VARCHAR(10) NOT NULL,
    Person_id INT(9) NOT NULL,
    PRIMARY KEY (Customer_id),
    FOREIGN KEY (Person_id) REFERENCES PERSON(Person_id),
    CONSTRAINT Customer_id_check CHECK (REGEXP_LIKE(Customer_id, 'C[0-9]{3}'))
);

-- CUSTOMER_DELIVERY_ADDRESS
DROP TABLE IF EXISTS CUSTOMER_DELIVERY_ADDRESS;
CREATE TABLE CUSTOMER_DELIVERY_ADDRESS (
    Customer_id VARCHAR(4) NOT NULL,
    Delivery_address VARCHAR(511) NOT NULL,
    PRIMARY KEY (Customer_id, Delivery_address),
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id)
);

-- ORDINARY_CUSTOMER
DROP TABLE IF EXISTS ORDINARY_CUSTOMER;
CREATE TABLE ORDINARY_CUSTOMER (
    Ordinary_customer_id VARCHAR(4) NOT NULL,
    PRIMARY KEY (Ordinary_customer_id),
    FOREIGN KEY (Ordinary_customer_id) REFERENCES CUSTOMER(Customer_id)
);

-- SILVER_MEMBER
DROP TABLE IF EXISTS SILVER_MEMBER;
CREATE TABLE SILVER_MEMBER (
    Silver_member_id VARCHAR(4) NOT NULL,
    Premium_member_id INT(9),
    Card_number INT(9) NOT NULL,
    PRIMARY KEY (Silver_member_id),
    FOREIGN KEY (Silver_member_id) REFERENCES CUSTOMER(Customer_id),
    FOREIGN KEY (Premium_member_id) REFERENCES PREMIUM_MEMBER(Premium_member_id),
    FOREIGN KEY (Card_number) REFERENCES MEMBER_CARD(Card_number)
);

-- SHOP
DROP TABLE IF EXISTS SHOP;
CREATE TABLE SHOP (
    Shop_id INT(9) NOT NULL AUTO_INCREMENT,
    Name VARCHAR(63) NOT NULL,
    Area VARCHAR(31) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Business_phone_number VARCHAR(10) NOT NULL,
    PRIMARY KEY (Shop_id)
);

-- RESTAURANT
DROP TABLE IF EXISTS RESTAURANT;
CREATE TABLE RESTAURANT (
    Restaurant_id INT(9) NOT NULL,
    PRIMARY KEY (Restaurant_id),
    FOREIGN KEY (Restaurant_id) REFERENCES SHOP(Shop_id)
);

-- RESTAURANT_TYPE
DROP TABLE IF EXISTS RESTAURANT_TYPE;
CREATE TABLE RESTAURANT_TYPE (
    Restaurant_id INT(9) NOT NULL,
    Type VARCHAR(31) NOT NULL,
    PRIMARY KEY (Restaurant_id, Type),
    FOREIGN KEY (Restaurant_id) REFERENCES RESTAURANT(Restaurant_id)
);

-- SUPERMARKET
DROP TABLE IF EXISTS SUPERMARKET;
CREATE TABLE SUPERMARKET (
    Supermarket_id INT(9) NOT NULL,
    PRIMARY KEY (Supermarket_id),
    FOREIGN KEY (Supermarket_id) REFERENCES SHOP(Shop_id)
);

-- PRODUCT
DROP TABLE IF EXISTS PRODUCT;
CREATE TABLE PRODUCT (
    Product_id INT(9) NOT NULL AUTO_INCREMENT,
    Name VARCHAR(127) NOT NULL,
    Description VARCHAR(1023) NOT NULL,
    PRIMARY KEY (Product_id)
);

-- SELLS
DROP TABLE IF EXISTS SELLS;
CREATE TABLE SELLS (
    Supermarket_id INT(9) NOT NULL,
    Product_id INT(9) NOT NULL,
    Price FLOAT(8, 2) NOT NULL,
    Stock INT(6) NOT NULL,
    PRIMARY KEY (Supermarket_id, Product_id),
    FOREIGN KEY (Supermarket_id) REFERENCES SUPERMARKET(Supermarket_id),
    FOREIGN KEY (Product_id) REFERENCES PRODUCT(Product_id)
);

-- SCHEDULE
DROP TABLE IF EXISTS SCHEDULE;
CREATE TABLE SCHEDULE (
    Shop_id INT(9) NOT NULL,
    Day ENUM('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL,
    Opening_time TIME NOT NULL,
    Closing_time TIME NOT NULL,
    PRIMARY KEY (Shop_id, Day),
    FOREIGN KEY (Shop_id) REFERENCES SHOP(Shop_id)
);

-- PROMOTION
DROP TABLE IF EXISTS PROMOTION;
CREATE TABLE PROMOTION (
    Shop_id INT(9) NOT NULL,
    Code VARCHAR(15) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Start_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Shop_id, Code),
    FOREIGN KEY (Shop_id) REFERENCES SHOP(Shop_id)
);

-- ORDER
DROP TABLE IF EXISTS `ORDER`;
CREATE TABLE `ORDER` (
    Order_id INT(9) NOT NULL AUTO_INCREMENT,
    Contents VARCHAR(511) NOT NULL,
    Subtotals FLOAT(9, 2) NOT NULL,
    Placed_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Order_id)
);

-- PAYMENT
DROP TABLE IF EXISTS PAYMENT;
CREATE TABLE PAYMENT (
    Confirmation_number INT(9) NOT NULL AUTO_INCREMENT,
    Type ENUM('Credit/Debit Card', 'Cash', 'Check', 'EFT', 'Crypto') NOT NULL,
    Time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Confirmation_number)
);

-- DELIVERY_INFO
DROP TABLE IF EXISTS DELIVERY_INFO;
CREATE TABLE DELIVERY_INFO (
    Deliverer_id VARCHAR(4) NOT NULL,
    Vehicle_plate_number VARCHAR(7) NOT NULL,
    Order_id INT(9) NOT NULL,
    PRIMARY KEY (Deliverer_id, Vehicle_plate_number, Order_id),
    FOREIGN KEY (Deliverer_id) REFERENCES DELIVERER(Deliverer_id),
    FOREIGN KEY (Vehicle_plate_number) REFERENCES VEHICLE(Plate_number),
    FOREIGN KEY (Order_id) REFERENCES `ORDER`(Order_id)
);

-- ORDER_INFO
DROP TABLE IF EXISTS ORDER_INFO;
CREATE TABLE ORDER_INFO (
    Order_id INT(9) NOT NULL,
    Shop_id INT(9) NOT NULL,
    Customer_id VARCHAR(4) NOT NULL,
    Payment_confirmation_number INT(9) NOT NULL,
    Promotion_code VARCHAR(15) DEFAULT 'N/A',
    PRIMARY KEY (Order_id, Shop_id, Customer_id, Payment_confirmation_number, Promotion_code),
    FOREIGN KEY (Order_id) REFERENCES `ORDER`(Order_id),
    FOREIGN KEY (Shop_id) REFERENCES SHOP(Shop_id),
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id),
    FOREIGN KEY (Payment_confirmation_number) REFERENCES PAYMENT(Confirmation_number),
    FOREIGN KEY (Shop_id, Promotion_code) REFERENCES PROMOTION(Shop_id, Code)
);

-- CONTRACT
DROP TABLE IF EXISTS CONTRACT;
CREATE TABLE CONTRACT (
    Shop_id INT(9) NOT NULL,
    Area_manager_id VARCHAR(4) NOT NULL,
    Start_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Shop_id, Area_manager_id),
    FOREIGN KEY (Shop_id) REFERENCES SHOP(Shop_id),
    FOREIGN KEY (Area_manager_id) REFERENCES AREA_MANAGER(Area_manager_id)
);

-- COMMENTS
DROP TABLE IF EXISTS COMMENTS;
CREATE TABLE COMMENTS (
    Shop_id INT(9) NOT NULL,
    Customer_id VARCHAR(4) NOT NULL,
    Rating ENUM('1', '2', '3', '4', '5') NOT NULL,
    Content VARCHAR(255) NOT NULL,
    PRIMARY KEY (Shop_id, Customer_id),
    FOREIGN KEY (Shop_id) REFERENCES SHOP(Shop_id),
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id)
);