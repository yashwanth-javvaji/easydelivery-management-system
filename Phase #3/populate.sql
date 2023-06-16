USE EASY_DELIVERY;

-- PERSON
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("John", "B", "Smith");
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("Franklin", "T", "Wong");
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("Alicia", "J", "Zelaya");
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("Jennifer", "S", "Wallace");
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("Ramesh", "K", "Narayan");
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("Joyce", "A", "English");
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("Ahmad", "V", "Jabbar");
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("James", "E", "Borg");
INSERT INTO PERSON (First_name, Middle_name, Last_name) VALUES ("John", NULL, "Doe");

-- MEAL_PASS
INSERT INTO MEAL_PASS (Effective_date) VALUES ('2022-01-01');
INSERT INTO MEAL_PASS (Effective_date) VALUES ('2022-04-13');
INSERT INTO MEAL_PASS (Effective_date) VALUES ('2022-01-01');
INSERT INTO MEAL_PASS (Effective_date) VALUES ('2022-04-01');
INSERT INTO MEAL_PASS (Effective_date) VALUES ('2022-09-09');

-- PREMIUM_MEMBER
INSERT INTO PREMIUM_MEMBER (Pass_number) VALUES (1);
INSERT INTO PREMIUM_MEMBER (Pass_number) VALUES (2);
INSERT INTO PREMIUM_MEMBER (Pass_number) VALUES (3);
INSERT INTO PREMIUM_MEMBER (Pass_number) VALUES (4);
INSERT INTO PREMIUM_MEMBER (Pass_number) VALUES (5);

-- EMPLOYEE
INSERT INTO EMPLOYEE VALUES ('E001', '731 Fondren, Houston, TX', '1965-01-09', 'Male', 1, 4);
INSERT INTO EMPLOYEE VALUES ('E002', '638 Voss, Houston, TX', '1955-11-08', 'Male', 2, 1);
INSERT INTO EMPLOYEE VALUES ('E003', '3321 Castle, Spring, TX', '1968-01-19', 'Female', 3, 3);
INSERT INTO EMPLOYEE VALUES ('E004', '291 Berry, Bellaire, TX', '1941-06-20', 'Female', 4, NULL);
INSERT INTO EMPLOYEE VALUES ('E005', '601 Causley Avenue, Austin, TX', '1962-09-15', 'Male', 5, NULL);
INSERT INTO EMPLOYEE VALUES ('E006', '800 W. Campbell Road, Richardson, TX', '2000-09-15', 'Female', 6, NULL);
INSERT INTO EMPLOYEE VALUES ('E007', '5631 Rice, Houston, TX', '1974-07-12', 'Male', 7, NULL);
INSERT INTO EMPLOYEE VALUES ('E008', '980 Dallas, Houston, TX', '1983-08-19', 'Male', 8, NULL);
INSERT INTO EMPLOYEE VALUES ('E009', '975 Fire Oak, Humble, TX', '1984-03-28', 'Male', 9, NULL);

-- EMPLOYEE_PHONE_NUMBER
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E001', '1234567890');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E002', '4534534533');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E003', '9876543214');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E004', '9879879872');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E005', '6668844445');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E005', '5684182639');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E006', '6524372867');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E007', '7623864523');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E008', '3476543890');
INSERT INTO EMPLOYEE_PHONE_NUMBER VALUES ('E009', '8367297224');

-- EMPLOYMENT
INSERT INTO EMPLOYMENT VALUES ('E001', 'Area Manager', '2022-01-01');
INSERT INTO EMPLOYMENT VALUES ('E002', 'Staff', '2022-01-01');
INSERT INTO EMPLOYMENT VALUES ('E003', 'Deliverer', '2022-01-01');
INSERT INTO EMPLOYMENT VALUES ('E004', 'Staff', '2022-01-01');
INSERT INTO EMPLOYMENT VALUES ('E005', 'Deliverer', '2022-01-01');
INSERT INTO EMPLOYMENT VALUES ('E006', 'Area Manager', '2022-01-01');
INSERT INTO EMPLOYMENT VALUES ('E007', 'Area Manager', '2022-01-01');
INSERT INTO EMPLOYMENT VALUES ('E008', 'Area Manager', '2022-01-01');
INSERT INTO EMPLOYMENT VALUES ('E009', 'Area Manager', '2022-01-01');

-- AREA_MANAGER
INSERT INTO AREA_MANAGER VALUES ('E001', 'Plano');
INSERT INTO AREA_MANAGER VALUES ('E006', 'Richardson');
INSERT INTO AREA_MANAGER VALUES ('E007', 'Dallas');
INSERT INTO AREA_MANAGER VALUES ('E008', 'Irving');
INSERT INTO AREA_MANAGER VALUES ('E009', 'Plano');

-- DELIVERER
INSERT INTO DELIVERER VALUES ('E003', 'E001');
INSERT INTO DELIVERER VALUES ('E005', 'E001');

-- STAFF
INSERT INTO STAFF VALUES ('E002');
INSERT INTO STAFF VALUES ('E004');

-- VEHICLE
INSERT INTO VEHICLE VALUES ('77KR117', 'Silver', 'Hyundai', 'Elantra', 'E003');
INSERT INTO VEHICLE VALUES ('FGY5597', 'Black', 'Honda', 'Accord', 'E003');
INSERT INTO VEHICLE VALUES ('AAA0286', 'Blue', 'Hyundai', 'Accent', 'E005');

-- MEMBER_CARD
INSERT INTO MEMBER_CARD (Issue_date, Issuer_id) VALUES ('2022-04-13', 'E002');
INSERT INTO MEMBER_CARD (Issue_date, Issuer_id) VALUES ('2022-01-30', 'E002');
INSERT INTO MEMBER_CARD (Issue_date, Issuer_id) VALUES ('2022-09-09', 'E002');
INSERT INTO MEMBER_CARD (Issue_date, Issuer_id) VALUES ('2022-09-20', 'E004');

-- CUSTOMER
INSERT INTO CUSTOMER VALUES ('C001', '2022-01-01', '4534534533', 2);
INSERT INTO CUSTOMER VALUES ('C002', '2022-01-01', '9876543214', 3);
INSERT INTO CUSTOMER VALUES ('C003', '2022-01-01', '9879879872', 4);
INSERT INTO CUSTOMER VALUES ('C004', '2022-01-01', '6524372867', 6);
INSERT INTO CUSTOMER VALUES ('C005', '2022-01-01', '7623864523', 7);
INSERT INTO CUSTOMER VALUES ('C006', '2022-01-01', '3476543890', 8);

-- CUSTOMER_DELIVERY_ADDRESS
INSERT INTO CUSTOMER_DELIVERY_ADDRESS VALUES ('C001', '638 Voss, Houston, TX');
INSERT INTO CUSTOMER_DELIVERY_ADDRESS VALUES ('C001', '800 W. Campbell Road, Richardson, TX');
INSERT INTO CUSTOMER_DELIVERY_ADDRESS VALUES ('C003', '291 Berry, Bellaire, TX');
INSERT INTO CUSTOMER_DELIVERY_ADDRESS VALUES ('C004', '5631 Rice, Houston, TX');
INSERT INTO CUSTOMER_DELIVERY_ADDRESS VALUES ('C005', '7575 Frankford Rd, Dallas, TX');
INSERT INTO CUSTOMER_DELIVERY_ADDRESS VALUES ('C005', '980 Dallas, Houston, TX');
INSERT INTO CUSTOMER_DELIVERY_ADDRESS VALUES ('C006', '450 Stone, Houston, TX');

-- ORDINARY_CUSTOMER
INSERT INTO ORDINARY_CUSTOMER VALUES ('C003');
INSERT INTO ORDINARY_CUSTOMER VALUES ('C004');

-- SILVER_MEMBER
INSERT INTO SILVER_MEMBER VALUES ('C001', 2, 1);
INSERT INTO SILVER_MEMBER VALUES ('C002', NULL, 2);
INSERT INTO SILVER_MEMBER VALUES ('C005', 5, 3);
INSERT INTO SILVER_MEMBER VALUES ('C006', NULL, 4);

-- SHOP
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ("McDonald's", 'Plano', '216 Coit Rd, Plano, TX', '9727580282');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('Taco Bell', 'Richardson', '2828 Rutford Ave Ste 4, Richardson, TX', '9728837471');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('Braums', 'Dallas', '17879 Preston Road, Dallas, TX', '9722487379');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('The Irishman Pub', 'Dallas', '18101 Preston Rd Suite 102, Dallas, TX', '9727331852');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('Great Wall Super Buffet', 'Plano', '901 W Plano Pkwy, Plano, TX', '9725788887');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('BBQ Chicken', 'Plano', '121 Spring Creek Pkwy Suite 311, Plano, TX', '4693669040');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ("Domino's", 'Plano', '4120 W 15th St #101, Plano, TX', '4695430420');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('KFC', 'Plano', '1504 Custer Rd, Plano, TX', '9725094869');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('Walmart', 'Irving', '1635 Market Pl Blvd, Irving, TX', '2145744517');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('Target', 'Plano', '725 Hebron Pkwy, Plano, TX', '9724592605');
INSERT INTO SHOP (Name, Area, Address, Business_phone_number) VALUES ('Costco Wholesale', 'Plano', '1701 Dallas Pkwy, Plano, TX', '9722462203');

-- RESTAURANT
INSERT INTO RESTAURANT VALUES (1);
INSERT INTO RESTAURANT VALUES (2);
INSERT INTO RESTAURANT VALUES (3);
INSERT INTO RESTAURANT VALUES (4);
INSERT INTO RESTAURANT VALUES (5);
INSERT INTO RESTAURANT VALUES (6);
INSERT INTO RESTAURANT VALUES (7);
INSERT INTO RESTAURANT VALUES (8);

-- RESTAURANT_TYPE
INSERT INTO RESTAURANT_TYPE VALUES (1, 'Fast Food');
INSERT INTO RESTAURANT_TYPE VALUES (2, 'Fast Food');
INSERT INTO RESTAURANT_TYPE VALUES (3, 'Fast Food');
INSERT INTO RESTAURANT_TYPE VALUES (4, 'Drinks');
INSERT INTO RESTAURANT_TYPE VALUES (5, 'Buffet');
INSERT INTO RESTAURANT_TYPE VALUES (6, 'BBQ');
INSERT INTO RESTAURANT_TYPE VALUES (7, 'Fast Food');
INSERT INTO RESTAURANT_TYPE VALUES (8, 'Fast Food');

-- SUPERMARKET
INSERT INTO SUPERMARKET VALUES (9);
INSERT INTO SUPERMARKET VALUES (10);
INSERT INTO SUPERMARKET VALUES (11);

-- PRODUCT
INSERT INTO PRODUCT (Name, Description) VALUES ("Crocs", "The most delightfully comfortable shoes in the world");
INSERT INTO PRODUCT (Name, Description) VALUES ("Fresh Roma Tomato, Each", "With Roma Tomatoes, it's easy to make a wholesome, delicious meal");
INSERT INTO PRODUCT (Name, Description) VALUES ("Ferrero Rocher Premium Gourmet Milk Chocolate", "Ferrero Rocher offers a unique taste experience of contrasting layers: a whole crunchy hazelnut in the heart, a delicious creamy hazelnut filling, a crisp wafer shell covered with chocolate and gently roasted pieces. And thanks to its inimitable golden wrapper Ferrero Rocher is even more unique and special. The iconic original.");
INSERT INTO PRODUCT (Name, Description) VALUES ("Great Value Whole Vitamin D Milk, Gallon, 128 fl oz", "Enjoy the wholesome goodness of Great Value Whole Milk at any time. This Grade A quality milk is pasteurized and delivers fresh from the farm taste. This kitchen staple is great for using in cereal, to bake desserts and more. This gallon of milk is also wonderful for milkshakes, smoothies, chocolate milk and more. Enjoy a delicious classic and serve a cold glass of this milk with soft, chocolate chip cookies for dipping. It offers an abundance of nutritional benefits as it is a rich source of protein, calcium, potassium and vitamin D. Our farms have pledged to not treat any cows with any artificial growth hormones.");
INSERT INTO PRODUCT (Name, Description) VALUES ("Yaheetech Convertible Sofa Bed", "Yaheetech Convertible Sofa Bed with USB Ports Sleeper Couch Futon Daybed Sleeper Sofa for Living Room");
INSERT INTO PRODUCT (Name, Description) VALUES ("Beats Studio3 Over-Ear Noise Canceling Bluetooth Wireless Headphones", "Beats Studio3 Wireless headphones deliver a premium listening experience with Pure Active Noise Cancelling (Pure ANC). Beats’ Pure ANC actively blocks external noise and uses real-time audio calibration to preserve clarity, range and emotion. They continuously pinpoint external sounds to block while automatically responding to individual fit in real time, optimising sound output to preserve a premium listening experience the way artists intended.");
INSERT INTO PRODUCT (Name, Description) VALUES ("Lindor Holiday Sugar Cookie Bag - 6oz", "Remind a friend or loved one of how much they mean to you this holiday season with Lindt LINDOR Sugar Cookie White Chocolate Truffles. Featuring festive holiday packaging, these white chocolate candy truffles make perfect gifts and stocking stuffers for family and friends. Bring a bit of sparkle to your Christmas candy dishes and table decor with the addition of these LINDOR holiday chocolates. Each Lindt LINDOR chocolate truffle is finely crafted with a delicate white chocolate shell that envelops an irresistibly smooth sugar cookie truffle filling. Make Holiday Moments Magical with Lindt.");
INSERT INTO PRODUCT (Name, Description) VALUES ("MacBook Air", 'MacBook Air 13.3" - Apple M1 Chip 8-core CPU, 7-core GPU - 8GB Memory - 256GB SSD Space Gray');
INSERT INTO PRODUCT (Name, Description) VALUES ("Holiday Extravaganza Gift Basket", "Divine chocolates, decadent sweets and savory nibbles abound in this beautiful gift that a special someone deserves.  They'll love the sweets from Harry & David®,The Popcorn Factory, Ghirardelli ® and more.  A truly impressive gift!  After the snacks are gone, the basket makes a great daily decor or storage of numerous collections for years to come!");
INSERT INTO PRODUCT (Name, Description) VALUES ("Snapware Pyrex 18-piece Glass Food Storage Set", "This Snapware® set is made of Pyrex® tempered glass, which is safe to use in both the microwave and oven. The lids are airtight to keep food fresher longer, yet are easy to put on and take off. Plus, you can write on the lids to eliminate the guesswork of what's inside. Then, erase the lid and reuse.");
INSERT INTO PRODUCT (Name, Description) VALUES ("Microsoft Office Home and Student 2022", "For students and families who want classic Office 2022 versions of Word, Excel, PowerPoint and OneNote for Windows 11, installed on one PC or Mac for use at home or school, including 60 days of Microsoft support at no extra cost.");

-- SELLS
INSERT INTO SELLS VALUES (9, 1, 29.99, 60);
INSERT INTO SELLS VALUES (9, 2, 0.29, 1000);
INSERT INTO SELLS VALUES (9, 3, 10.48, 20);
INSERT INTO SELLS VALUES (9, 4, 2.98, 200);
INSERT INTO SELLS VALUES (9, 8, 749.99, 13);
INSERT INTO SELLS VALUES (10, 2, 0.33, 500);
INSERT INTO SELLS VALUES (10, 4, 3.29, 500);
INSERT INTO SELLS VALUES (10, 5, 325.99, 11);
INSERT INTO SELLS VALUES (10, 6, 169.99, 45);
INSERT INTO SELLS VALUES (10, 7, 5.29, 120);
INSERT INTO SELLS VALUES (10, 8, 799.99, 20);
INSERT INTO SELLS VALUES (11, 8, 799.99, 9);
INSERT INTO SELLS VALUES (11, 9, 159.99, 2);
INSERT INTO SELLS VALUES (11, 10, 30.99, 25);
INSERT INTO SELLS VALUES (11, 11, 119.19, 5);

-- SCHEDULE
INSERT INTO SCHEDULE VALUES (1, 'Sunday', '00:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (1, 'Monday', '00:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (1, 'Tuesday', '00:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (1, 'Wednesday', '00:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (1, 'Thursday', '00:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (1, 'Friday', '00:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (1, 'Saturday', '00:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (2, 'Sunday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (2, 'Monday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (2, 'Tuesday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (2, 'Wednesday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (2, 'Thursday', '10:00:00', '01:00:00');
INSERT INTO SCHEDULE VALUES (2, 'Friday', '10:00:00', '01:00:00');
INSERT INTO SCHEDULE VALUES (2, 'Saturday', '10:00:00', '01:00:00');
INSERT INTO SCHEDULE VALUES (3, 'Sunday', '06:00:00', '22:45:00');
INSERT INTO SCHEDULE VALUES (3, 'Monday', '06:00:00', '22:45:00');
INSERT INTO SCHEDULE VALUES (3, 'Tuesday', '06:00:00', '22:45:00');
INSERT INTO SCHEDULE VALUES (3, 'Wednesday', '06:00:00', '22:45:00');
INSERT INTO SCHEDULE VALUES (3, 'Thursday', '06:00:00', '22:45:00');
INSERT INTO SCHEDULE VALUES (3, 'Friday', '06:00:00', '22:45:00');
INSERT INTO SCHEDULE VALUES (3, 'Saturday', '06:00:00', '22:45:00');
INSERT INTO SCHEDULE VALUES (4, 'Sunday', '11:00:00', '02:00:00');
INSERT INTO SCHEDULE VALUES (4, 'Monday', '11:00:00', '02:00:00');
INSERT INTO SCHEDULE VALUES (4, 'Tuesday', '11:00:00', '02:00:00');
INSERT INTO SCHEDULE VALUES (4, 'Wednesday', '11:00:00', '02:00:00');
INSERT INTO SCHEDULE VALUES (4, 'Thursday', '11:00:00', '02:00:00');
INSERT INTO SCHEDULE VALUES (4, 'Friday', '11:00:00', '02:00:00');
INSERT INTO SCHEDULE VALUES (4, 'Saturday', '11:00:00', '02:00:00');
INSERT INTO SCHEDULE VALUES (5, 'Sunday', '11:00:00', '21:30:00');
INSERT INTO SCHEDULE VALUES (5, 'Monday', '11:00:00', '21:00:00');
INSERT INTO SCHEDULE VALUES (5, 'Tuesday', '11:00:00', '21:00:00');
INSERT INTO SCHEDULE VALUES (5, 'Wednesday', '11:00:00', '21:00:00');
INSERT INTO SCHEDULE VALUES (5, 'Thursday', '11:00:00', '21:00:00');
INSERT INTO SCHEDULE VALUES (5, 'Friday', '11:00:00', '21:00:00');
INSERT INTO SCHEDULE VALUES (5, 'Saturday', '11:00:00', '21:30:00');
INSERT INTO SCHEDULE VALUES (6, 'Sunday', '11:30:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (6, 'Monday', '11:30:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (6, 'Tuesday', '11:30:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (6, 'Wednesday', '11:30:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (6, 'Thursday', '11:30:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (6, 'Friday', '11:30:00', '22:30:00');
INSERT INTO SCHEDULE VALUES (6, 'Saturday', '11:30:00', '22:30:00');
INSERT INTO SCHEDULE VALUES (7, 'Sunday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (7, 'Monday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (7, 'Tuesday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (7, 'Wednesday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (7, 'Thursday', '10:00:00', '00:00:00');
INSERT INTO SCHEDULE VALUES (7, 'Friday', '10:00:00', '01:00:00');
INSERT INTO SCHEDULE VALUES (7, 'Saturday', '10:00:00', '01:00:00');
INSERT INTO SCHEDULE VALUES (8, 'Sunday', '10:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (8, 'Monday', '10:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (8, 'Tuesday', '10:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (8, 'Wednesday', '10:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (8, 'Thursday', '10:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (8, 'Friday', '10:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (8, 'Saturday', '10:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (9, 'Sunday', '06:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (9, 'Monday', '06:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (9, 'Tuesday', '06:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (9, 'Wednesday', '06:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (9, 'Thursday', '06:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (9, 'Friday', '06:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (9, 'Saturday', '06:00:00', '23:00:00');
INSERT INTO SCHEDULE VALUES (10, 'Sunday', '07:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (10, 'Monday', '07:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (10, 'Tuesday', '07:00:00', '23:59:59');
INSERT INTO SCHEDULE VALUES (10, 'Wednesday', '08:00:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (10, 'Thursday', '08:00:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (10, 'Friday', '08:00:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (10, 'Saturday', '08:00:00', '22:00:00');
INSERT INTO SCHEDULE VALUES (11, 'Sunday', '10:00:00', '18:00:00');
INSERT INTO SCHEDULE VALUES (11, 'Monday', '10:00:00', '20:30:00');
INSERT INTO SCHEDULE VALUES (11, 'Tuesday', '10:00:00', '20:30:00');
INSERT INTO SCHEDULE VALUES (11, 'Wednesday', '10:00:00', '20:30:00');
INSERT INTO SCHEDULE VALUES (11, 'Thursday', '10:00:00', '20:30:00');
INSERT INTO SCHEDULE VALUES (11, 'Friday', '10:00:00', '20:30:00');
INSERT INTO SCHEDULE VALUES (11, 'Saturday', '09:30:00', '19:00:00');

-- PROMOTION
INSERT INTO PROMOTION VALUES (1, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (1, '15%OFF', 'Get 15% off on spending 40$ and above', '2022-12-01');
INSERT INTO PROMOTION VALUES (1, '2$OFF', 'Get 2$ off on spending 10$ and above', '2022-04-01');
INSERT INTO PROMOTION VALUES (1, 'FREEDEL', 'Free Delivery', '2022-11-15');
INSERT INTO PROMOTION VALUES (2, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (3, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (4, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (5, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (6, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (7, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (7, 'BUY1GET1', 'Buy one get one free', '2022-04-01');
INSERT INTO PROMOTION VALUES (8, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (8, '10$BUCKET', 'Get any bucket for 10$', '2022-12-01');
INSERT INTO PROMOTION VALUES (8, 'BUY1GET1', 'Buy one bucket worth minimum of 18$ and get another bucket for free', '2022-09-01');
INSERT INTO PROMOTION VALUES (9, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (9, 'FREEDEL', 'Free Delivery', '2022-01-01');
INSERT INTO PROMOTION VALUES (10, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (10, '20$OFF', 'Get 20$ off on spending 10$ and above', '2022-11-20');
INSERT INTO PROMOTION VALUES (11, 'N/A', 'Not Applied', '2022-01-01');
INSERT INTO PROMOTION VALUES (11, '50%OFF', 'Get 50% off', '2022-11-20');

-- ORDER
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('6 x Hot and Spicy McChicken', 11.63, '2022-01-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('2 x 20 Piece McNuggets', 10.75, '2022-04-27');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x McChicken Biscuit & 1 x Hash Browns', 4.09, '2022-11-16');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x Chipotle Ranch Grilled Chicken Burrito', 2.17, '2022-12-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ("6 x Braum's - Nutty Cone", 5.41, '2022-11-24');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('2 x Golden Original Whole Chicken', 17.32, '2022-11-19');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('2 x Memphis BBQ Chicken', 20.56, '2022-11-13');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('2 x 12 pc. Chicken Bucket', 28.13, '2022-11-09');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 9.44, '2022-11-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x Crocs', 32.46, '2022-11-12');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('2 x Ferrero Rocher Premium Gourmet Milk Chocolate', 20.96, '2022-11-27');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x Yaheetech Convertible Sofa Bed', 332.88, '2022-11-22');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x MacBook Air', 432.99, '2022-11-24');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x Holiday Extravaganza Gift Basket & 1 x Microsoft Office Home and Student 2022', 302.21, '2022-11-25');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-21');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-22');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-23');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-24');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-25');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-26');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-27');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-28');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-29');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-11-30');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('12 x Fresh Roma Tomato, Each & 2 x Great Value Whole Vitamin D Milk, Gallon, 128 fl oz', 11.44, '2022-12-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x Chipotle Ranch Grilled Chicken Burrito', 2.17, '2022-12-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ("6 x Braum's - Nutty Cone", 5.41, '2022-12-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x Mojito', 6.48, '2022-12-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('1 x Meal', 12.99, '2022-12-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('2 x Golden Original Whole Chicken', 17.32, '2022-12-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('2 x Memphis BBQ Chicken', 20.56, '2022-12-01');
INSERT INTO `ORDER` (Contents, Subtotals, Placed_on) VALUES ('2 x 12 pc. Chicken Bucket', 28.13, '2022-12-01');

-- PAYMENT
INSERT INTO PAYMENT (Type, Time) VALUES ('Cash', '2022-01-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-04-27');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-16');
INSERT INTO PAYMENT (Type, Time) VALUES ('Cash', '2022-01-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Cash', '2022-11-24');
INSERT INTO PAYMENT (Type, Time) VALUES ('EFT', '2022-05-19');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-04-13');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-09-09');
INSERT INTO PAYMENT (Type, Time) VALUES ('Cash', '2022-11-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Check', '2022-11-12');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-27');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-22');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-24');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-25');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-21');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-22');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-23');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-24');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-25');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-26');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-27');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-28');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-29');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-11-30');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-12-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-12-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-12-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-12-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-12-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-12-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-12-01');
INSERT INTO PAYMENT (Type, Time) VALUES ('Credit/Debit Card', '2022-12-01');

-- DELIVERY_INFO
INSERT INTO DELIVERY_INFO VALUES ('E005', 'AAA0286', 3);
INSERT INTO DELIVERY_INFO VALUES ('E003', 'FGY5597', 10);
INSERT INTO DELIVERY_INFO VALUES ('E003', '77KR117', 11);
INSERT INTO DELIVERY_INFO VALUES ('E005', 'AAA0286', 15);
INSERT INTO DELIVERY_INFO VALUES ('E003', '77KR117', 16);
INSERT INTO DELIVERY_INFO VALUES ('E003', '77KR117', 17);
INSERT INTO DELIVERY_INFO VALUES ('E005', 'AAA0286', 18);
INSERT INTO DELIVERY_INFO VALUES ('E003', '77KR117', 19);
INSERT INTO DELIVERY_INFO VALUES ('E003', '77KR117', 20);
INSERT INTO DELIVERY_INFO VALUES ('E005', 'AAA0286', 21);
INSERT INTO DELIVERY_INFO VALUES ('E003', '77KR117', 22);
INSERT INTO DELIVERY_INFO VALUES ('E003', '77KR117', 23);
INSERT INTO DELIVERY_INFO VALUES ('E005', 'AAA0286', 24);
INSERT INTO DELIVERY_INFO VALUES ('E003', '77KR117', 25);

-- ORDER_INFO
INSERT INTO ORDER_INFO VALUES (1, 1, 'C004', 1, 'N/A');
INSERT INTO ORDER_INFO VALUES (2, 1, 'C006', 2, '2$OFF');
INSERT INTO ORDER_INFO VALUES (3, 1, 'C001', 3, 'FREEDEL');
INSERT INTO ORDER_INFO VALUES (4, 2, 'C005', 4, 'N/A');
INSERT INTO ORDER_INFO VALUES (5, 3, 'C003', 5, 'N/A');
INSERT INTO ORDER_INFO VALUES (6, 6, 'C003', 6, 'N/A');
INSERT INTO ORDER_INFO VALUES (7, 7, 'C004', 7, 'BUY1GET1');
INSERT INTO ORDER_INFO VALUES (8, 8, 'C005', 8, 'BUY1GET1');
INSERT INTO ORDER_INFO VALUES (9, 9, 'C006', 9, 'N/A');
INSERT INTO ORDER_INFO VALUES (10, 9, 'C005', 10, 'FREEDEL');
INSERT INTO ORDER_INFO VALUES (11, 9, 'C005', 11, 'FREEDEL');
INSERT INTO ORDER_INFO VALUES (12, 10, 'C002', 12, '20$OFF');
INSERT INTO ORDER_INFO VALUES (13, 11, 'C001', 13, '50%OFF');
INSERT INTO ORDER_INFO VALUES (14, 11, 'C002', 14, 'N/A');
INSERT INTO ORDER_INFO VALUES (15, 9, 'C004', 15, 'N/A');
INSERT INTO ORDER_INFO VALUES (16, 9, 'C004', 16, 'N/A');
INSERT INTO ORDER_INFO VALUES (17, 9, 'C004', 17, 'N/A');
INSERT INTO ORDER_INFO VALUES (18, 9, 'C004', 18, 'N/A');
INSERT INTO ORDER_INFO VALUES (19, 9, 'C004', 19, 'N/A');
INSERT INTO ORDER_INFO VALUES (20, 9, 'C004', 20, 'N/A');
INSERT INTO ORDER_INFO VALUES (21, 9, 'C004', 21, 'N/A');
INSERT INTO ORDER_INFO VALUES (22, 9, 'C004', 22, 'N/A');
INSERT INTO ORDER_INFO VALUES (23, 9, 'C004', 23, 'N/A');
INSERT INTO ORDER_INFO VALUES (24, 9, 'C004', 24, 'N/A');
INSERT INTO ORDER_INFO VALUES (25, 9, 'C004', 25, 'N/A');
INSERT INTO ORDER_INFO VALUES (26, 2, 'C001', 26, 'N/A');
INSERT INTO ORDER_INFO VALUES (27, 3, 'C001', 27, 'N/A');
INSERT INTO ORDER_INFO VALUES (28, 4, 'C001', 28, 'N/A');
INSERT INTO ORDER_INFO VALUES (29, 5, 'C001', 29, 'N/A');
INSERT INTO ORDER_INFO VALUES (30, 6, 'C001', 30, 'N/A');
INSERT INTO ORDER_INFO VALUES (31, 7, 'C001', 31, 'N/A');
INSERT INTO ORDER_INFO VALUES (32, 8, 'C001', 32, 'N/A');


-- CONTRACT
INSERT INTO CONTRACT VALUES (1, 'E001', '2022-01-01');
INSERT INTO CONTRACT VALUES (2, 'E006', '2022-01-01');
INSERT INTO CONTRACT VALUES (3, 'E007', '2022-01-01');
INSERT INTO CONTRACT VALUES (4, 'E007', '2022-01-01');
INSERT INTO CONTRACT VALUES (5, 'E001', '2022-01-01');
INSERT INTO CONTRACT VALUES (6, 'E001', '2022-01-01');
INSERT INTO CONTRACT VALUES (7, 'E001', '2022-01-01');
INSERT INTO CONTRACT VALUES (8, 'E001', '2022-01-01');
INSERT INTO CONTRACT VALUES (9, 'E008', '2022-01-01');
INSERT INTO CONTRACT VALUES (10, 'E009', '2022-01-01');
INSERT INTO CONTRACT VALUES (11, 'E001', '2022-01-01');

-- COMMENTS
INSERT INTO COMMENTS VALUES (1, 'C001', '1', 'Customer service is not good');
INSERT INTO COMMENTS VALUES (2, 'C005', '5', 'Amazing Food');
INSERT INTO COMMENTS VALUES (11, 'C001', '5', 'Has great deals');