create database final_project;
use final_project;

CREATE TABLE ADDRESSES
	(
	ADDRESS_ID VARCHAR(50) NOT NULL ,
	ADDRESS1 VARCHAR(200) NOT NULL,
	ADDRESS2 VARCHAR(200),
	CITY VARCHAR(50),
	COUNTRY VARCHAR(50),
	FAX VARCHAR(50),
	POSTAL_CODE VARCHAR(50),
	PRIMARY KEY (ADDRESS_ID)
	);
CREATE TABLE USERS
	(
	USER_ID VARCHAR(50) NOT NULL,
	FIRST_NAME VARCHAR(200),
	LAST_NAME VARCHAR(200),
	PASSWORD VARCHAR(50),
	PHONE_NUM VARCHAR(50),
	AGE INT,
	GENDER VARCHAR(15),
	ADDRESS_ID VARCHAR(50) NOT NULL,
	PRIMARY KEY (USER_ID),
	FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESSES(ADDRESS_ID)
	);
CREATE TABLE PREMIUM
	(
	USER_ID VARCHAR(50),
	FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID),
	PRIMARY KEY (USER_ID),
	CARD_NUM VARCHAR(100)
	);
CREATE TABLE NORMAL
	(
	USER_ID VARCHAR(50),
	FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID),
	PRIMARY KEY (USER_ID)
	);
CREATE TABLE JOBS
	(
	JOB_ID VARCHAR(50) NOT NULL,
	JOB_TITLE VARCHAR(100) NOT NULL,
	PRIMARY KEY (JOB_ID)
	);
CREATE TABLE EMPLOYEES
	(
	EMP_ID VARCHAR(50),
	FIRST_NAME VARCHAR(200),
	LAST_NAME VARCHAR(200),
	EMAIL VARCHAR(100),
	PHONE_NUM VARCHAR(50),
	AGE INT,
	PHOTO_PATH VARCHAR(250),
	HIRED_DATE VARCHAR(50),
	GENDER VARCHAR(15),
	SALARY INT,
	ADDRESS_ID VARCHAR(50) NOT NULL,
	JOB_ID VARCHAR(50) NOT NULL,
	PRIMARY KEY (EMP_ID),
	FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESSES(ADDRESS_ID),
	FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID)
	);
CREATE TABLE MANAGERS
	(
	EMP_ID VARCHAR(50),
	MEETING_NO INT,
	FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES(EMP_ID),
	PRIMARY KEY (EMP_ID)
	);
CREATE TABLE CATEGORIES
	(
	CATEGORY_ID VARCHAR(50),
	NAME VARCHAR(100),
	DESCRIPTION VARCHAR(250),
	PRIMARY KEY (CATEGORY_ID)
	);
CREATE TABLE SUPPLIERS
	(
	SUPPLIER_ID VARCHAR(50),
	PHONE_NUM VARCHAR(50),
	WEBSITE VARCHAR(250),
	COMPANY_NAME VARCHAR(100),
	ADDRESS_ID VARCHAR(50) NOT NULL,
	PRIMARY KEY (SUPPLIER_ID),
	FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESSES(ADDRESS_ID)
	);
CREATE TABLE PRODUCTS
	(
	PRODUCT_ID VARCHAR(50),
	NAME VARCHAR(200),
	DESCRIPTION VARCHAR(250),
	PRICE FLOAT,
	IMAGE_PATH VARCHAR(250),
	WEIGHT FLOAT,
	STOCK INT,
	CATEGORY_ID VARCHAR(50) NOT NULL,
	SUPPLIER_ID VARCHAR(50) NOT NULL,
	PRIMARY KEY (PRODUCT_ID),
	FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID)
	);
CREATE TABLE COMMENTS
    (
        COMMENT_ID VARCHAR(50),
        COMMENT VARCHAR(200),
        USER_ID VARCHAR(50) NOT NULL,
        PRODUCT_ID VARCHAR(50) NOT NULL,
        PRIMARY KEY (COMMENT_ID),
        FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID),
        FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);
CREATE TABLE DELIVERY_METHODS
	(
	DELIVERY_ID VARCHAR(50),
	NAME VARCHAR(200),
	DESCRIPTION VARCHAR(250),
	CO_NAME VARCHAR(200),
	CO_WEBSITE VARCHAR(250),
	PRIMARY KEY (DELIVERY_ID)
	);
CREATE TABLE PAYMENT_METHODS
	(
	PAYMENT_ID VARCHAR(50),
	DESCRIPTION VARCHAR(250),
	PROVIDER VARCHAR(200),
	PRIMARY KEY (PAYMENT_ID)
	);
CREATE TABLE DISCOUNTS
	(
	DISCOUNT_ID VARCHAR(50),
	NAME VARCHAR(200),
	EXP_DATE VARCHAR(50),
	DESCRIPTION VARCHAR(250),
	PRIMARY KEY (DISCOUNT_ID)
	);
CREATE TABLE ORDERS
	(
	ORDER_ID VARCHAR(50),
	DATE VARCHAR(50),
	PRODUCT_COST FLOAT,
	DELIVERY_COST FLOAT,
	TOT_DISCOUNT FLOAT,
	TOT_FEE FLOAT,
	SHIPPING_DATE VARCHAR(50),
	USER_ID VARCHAR(50) NOT NULL,
	PAYMENT_ID VARCHAR(50) NOT NULL,
	DELIVERY_ID VARCHAR(50) NOT NULL,
    DISCOUNT_ID VARCHAR(50),
    PRIMARY KEY (ORDER_ID),
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID),
    FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT_METHODS(PAYMENT_ID),
    FOREIGN KEY (DELIVERY_ID) REFERENCES DELIVERY_METHODS(DELIVERY_ID),
    FOREIGN KEY (DISCOUNT_ID) REFERENCES DISCOUNTS(DISCOUNT_ID)
);
CREATE TABLE OP
    (
        OP_ID VARCHAR(50) ,
        PRODUCT_ID VARCHAR(50) NOT NULL,
        ORDER_ID VARCHAR(50) NOT NULL,
        SUPPLIER_ID VARCHAR(50) NOT NULL,
        PRIMARY KEY (OP_ID),
        FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID),
        FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
        FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIERS(SUPPLIER_ID)
);
CREATE TABLE SUPPORT
    (
        SUPPORT_ID VARCHAR(50),
        USER_ID VARCHAR(50),
        EMPLOYEE_ID VARCHAR(50),
        ORDER_ID VARCHAR(50),
        PROB_DES VARCHAR(250),
        PRIMARY KEY (SUPPORT_ID),
        FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID),
        FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMP_ID),
        FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
);

/*PART 13 OF THE PROJECT*/
INSERT INTO ADDRESSES VALUES ('1A', '180ST. block NO.5', '', 'LA', 'america', '78965234', '123');
INSERT INTO ADDRESSES VALUES ('2A', '87 rue Pierre De Coubertin', '84 rue Isambard', 'Toulouse', 'france', '12096734', '31400');
INSERT INTO ADDRESSES VALUES ('3A', '7 Place de la Madeleine', '', 'paris', 'france', '90867432', '75008');
INSERT INTO ADDRESSES VALUES ('4A', '24 Place Charles de Gaulle', '', 'Villemomble', 'france', '98076534', '93250');
INSERT INTO ADDRESSES VALUES ('5A', ' 85 Chemin Du Lavarin Sud', '5 rue Lenotre', 'Caen', 'france', '67895643', '14000');
INSERT INTO ADDRESSES VALUES ('6A', '2891 Losh Lane', '3462 Brown Avenue', 'Pittsburgh', 'america', '12890736', '15236');
INSERT INTO ADDRESSES VALUES ('7A', '758 Sunset Drive', '', 'West Memphis', 'america', '35627846', '72301');
INSERT INTO ADDRESSES VALUES ('8A', '1988 Willison Street', '537 Oak Street', 'Minneapolis', 'america', '17384974', '55405');
INSERT INTO ADDRESSES VALUES ('9A', '538 Froe Street', '', 'West Virginia', 'america', '15627384', '26588');
INSERT INTO ADDRESSES VALUES ('10A', ' 4193 Clair Street', '63 Valley Street', 'Desdemona', 'america', '72839746', '76445');
INSERT INTO ADDRESSES VALUES ('11A', '4593 Johnny Lane', '4211 Arlington Avenue', 'Jonesboro', 'america', '57867898', '53202');
INSERT INTO ADDRESSES VALUES ('12A', '4193 Clair Street', '63 Valley Street', 'Desdemona', 'america', '728346', '76445');
INSERT INTO ADDRESSES VALUES ('13A', '3782 Bastin Drive', '', 'Philadelphia', 'america', '17836748', '532234');
INSERT INTO ADDRESSES VALUES ('14A', '3847 West Side Avenue', '1027 Spirit Drive', 'Hastings', 'america', '12675849', '32145');
INSERT INTO ADDRESSES VALUES ('15A', '4562 Adonais Way', '', 'Atlanta', 'america', '23836748', '30303');
INSERT INTO ADDRESSES VALUES ('16A', '4255 Benson Park Drive', '', 'YOUNG AMERICA', 'america', '374856', '55394');
INSERT INTO ADDRESSES VALUES ('17A', '56 rue Gustave Eiffel', '', 'RezÉ', 'france', '364785', ' 44400');
INSERT INTO ADDRESSES VALUES ('18A', '47 Rue de la Pompe', '', 'Marcq-en-baroeul', 'france', '999876', ' 59700');
INSERT INTO ADDRESSES VALUES ('19A', 'Langegade 61', '', 'København V', 'denmark', '164755', '1633');
INSERT INTO ADDRESSES VALUES ('20A', 'Havnevejen 70  ', '', 'København V', 'denmark', '384955', '1715');
INSERT INTO ADDRESSES VALUES ('21A', 'Lundsbjergvej 17', '', 'Frederiksberg C', 'denmakrd', '394855', '1915');

INSERT INTO USERS VALUES ('1U', 'narges', 'babaAhmadi', '123@456', '091176', 19 , 'female', '1A');
INSERT INTO USERS VALUES ('2U', 'niloofar', 'babaAhmadi', 'nilinix123', '091456', 19, 'female', '1A');
INSERT INTO USERS VALUES ('3U', 'negin', 'shadbakhsh', 'neg1342', '091468', 20, 'female', '3A');
INSERT INTO USERS VALUES ('4U', 'soodi', 'satt', '1346@1456', '091678', 49, 'female', '5A');
INSERT INTO USERS VALUES ('5U', 'mina', 'nooshi', '1235ty56', '091098', 20, 'female', '6A');
INSERT INTO USERS VALUES ('6U', 'pedram', 'mlak', 'm21435d', '091696', 21, 'male', '6A');
INSERT INTO USERS VALUES ('7U', 'mahyar', 'joodi', 'jkhu76', '091234', 16, 'male', '9A');
INSERT INTO USERS VALUES ('8U', 'aryan', 'mank', 'sty7654', '091777', 23, 'male', '11A');
INSERT INTO USERS VALUES ('9U', 'zahra', 'jiddi', '8754gb', '0919877', 36, 'female', '3A');
INSERT INTO USERS VALUES ('10U', 'negar', 'mitri', '875jhvff', '097890', 24, 'female', '12A');
INSERT INTO USERS VALUES ('11U', 'saba', 'yoos', 'wih^5#', '090987', 9, 'female', '14A');
INSERT INTO USERS VALUES ('12U', 'gilda', 'ghaf', '##gi##', '090865', 21, 'female', '14A');
INSERT INTO USERS VALUES ('13U', 'mahsa', 'baki', '87YY%6f', '08078', 37, 'female', '9A');

INSERT INTO PREMIUM VALUES ('10U', '371705088483727');
INSERT INTO PREMIUM VALUES ('11U', '345155187938440');
INSERT INTO PREMIUM VALUES ('9U', '374761894643712');
INSERT INTO PREMIUM VALUES ('12U', '377242184492034');
INSERT INTO PREMIUM VALUES ('8U', '378472487117264');
INSERT INTO PREMIUM VALUES ('13U', '371510894814309');

INSERT INTO NORMAL VALUES ('1U');
INSERT INTO NORMAL VALUES ('2U');
INSERT INTO NORMAL VALUES ('3U');
INSERT INTO NORMAL VALUES ('4U');
INSERT INTO NORMAL VALUES ('5U');
INSERT INTO NORMAL VALUES ('6U');
INSERT INTO NORMAL VALUES ('7U');

INSERT INTO JOBS VALUES ('1J', 'manager');
INSERT INTO JOBS VALUES ('2J', 'CEO');
INSERT INTO JOBS VALUES ('3J', 'CTO');
INSERT INTO JOBS VALUES ('4J', 'backend developer');
INSERT INTO JOBS VALUES ('5J', 'frontend developer');
INSERT INTO JOBS VALUES ('6J', 'datascientist');
INSERT INTO JOBS VALUES ('7J', 'COO');
INSERT INTO JOBS VALUES ('8J', 'flutter developer');
INSERT INTO JOBS VALUES ('9J', 'HR');
INSERT INTO JOBS VALUES ('10J', 'full-stack developer');

INSERT INTO EMPLOYEES VALUES ('1E', 'jessie', 'malik', 'jessie@gmail.com', '01456', 25, 'emp1-picture-path', '6-9-19', 'female', 10000, '2A', '1J');
INSERT INTO EMPLOYEES VALUES ('2E', 'monika', 'backli', 'backli@gmail.com', '012456', 35, 'emp2-picture-path', '7-10-15', 'female', 15000, '7A', '10J');
INSERT INTO EMPLOYEES VALUES ('3E', 'erric', 'jackson', 'erric@yahoo.com', '13956', 29, 'emp3-picture-path', '5-6-20', 'male', 7000, '7A', '9J');
INSERT INTO EMPLOYEES VALUES ('4E', 'perssie', 'payn', 'payn@yahoo.com', '99956', 47, 'emp4-picture-path', '6-9-10', 'male', 25000, '4A', '2J');
INSERT INTO EMPLOYEES VALUES ('5E', 'maddison', 'ray', 'maddison-ray@gmail.com', '9087', 43, 'emp5-picture-path', '6-9-10', 'female', 25000, '4A', '3J');
INSERT INTO EMPLOYEES VALUES ('6E', 'andy', 'meladi', 'andy@yahoo.com', '67546', 38, 'emp6-picture-path', '23-6-18', 'male', 6500, '5A', '8J');
INSERT INTO EMPLOYEES VALUES ('7E', 'alexander', 'moochini', 'moochini@gmail.com', '8789', 44, 'emp7-picture-path', '9-10-07', 'male',9000, '11A', '6J');
INSERT INTO EMPLOYEES VALUES ('8E', 'amelia', 'clark', 'clark@gmail.com', '87230', 19, 'emp8-picture-path', '9-10-21', 'female',7500, '5A', '6J');
INSERT INTO EMPLOYEES VALUES ('9E', 'joe', 'siva', 'siva@gmail.com', '89999', 28, 'emp9-picture-path', '11-8-21', 'male',7800, '10A', '8J');

INSERT INTO MANAGERS VALUES ('2E', 12);
INSERT INTO MANAGERS VALUES ('4E', 5);
INSERT INTO MANAGERS VALUES ('5E', 7);
INSERT INTO MANAGERS VALUES ('3E', 8);
INSERT INTO MANAGERS VALUES ('8E', 4);
INSERT INTO MANAGERS VALUES ('6E', 17);

INSERT INTO CATEGORIES VALUES ('1C', 'electronics', 'this category includes devices like mobile phones, TVs, PCs and any other digital device you can think of.');
INSERT INTO CATEGORIES VALUES ('2C', 'toys', 'dolls, ball, toy trucks and every other gaming tools for kids');
INSERT INTO CATEGORIES VALUES ('3C', 'groceries', 'bakery, bread, meat, vegetable, frozzen foods, pasta, oil and any other thing that some one uses in the kitchen');
INSERT INTO CATEGORIES VALUES ('4C', 'arts', 'painting and any other expression or application of human creative skill and imagination');
INSERT INTO CATEGORIES VALUES ('5C', 'furniture', 'the movable articles that are used to make a room or building suitable for living or working in, such as tables, chairs, or desks.');
INSERT INTO CATEGORIES VALUES ('6C', 'pet supplies', 'everything related to pets. like toys, food, clothings and ...');
INSERT INTO CATEGORIES VALUES ('7C', 'books', 'all kinds of books including prints and digitals and also magazines and newspapers');
INSERT INTO CATEGORIES VALUES ('8C', 'clothing', 'T-shirts, pants, jackets and every item some one wears');
INSERT INTO CATEGORIES VALUES ('9C', 'fitness supplies', 'any apparatus or device used during physical activity to enhance the strength or conditioning effects of 
that exercise by providing either fixed or adjustable amounts of resistance');
INSERT INTO CATEGORIES VALUES ('10C', 'cleaning supplies', 'substances (usually liquids, powders, sprays, or granules) used to remove dirt, including 
dust, stains, bad smells, and clutter on surfaces');

INSERT INTO SUPPLIERS VALUES ('1S','156728', 'Ipsos.com', 'Ipsos', '8A');
INSERT INTO SUPPLIERS VALUES ('2S','134528', 'Kantar.com', 'Kantar', '10A');
INSERT INTO SUPPLIERS VALUES ('3S','124608', 'Hotspex.org', 'Hotspex', '13A');
INSERT INTO SUPPLIERS VALUES ('4S','245097', 'Nielsen.org', 'olgNielsen', '15A');
INSERT INTO SUPPLIERS VALUES ('5S','102758', 'Qualtrics.org', 'Qualtrics', '16A');
INSERT INTO SUPPLIERS VALUES ('6S','193657', 'Dynata.org', 'Dynatarok', '17A');
INSERT INTO SUPPLIERS VALUES ('7S','193647', 'Zappi.com', 'Zappi', '18A');
INSERT INTO SUPPLIERS VALUES ('8S','184657', 'Toluna.com', 'Toluna', '19A');
INSERT INTO SUPPLIERS VALUES ('9S','184657', 'Remesh.com', 'Remesh', '20A');
INSERT INTO SUPPLIERS VALUES ('10S','264756', 'Voxpopme.com', '   Voxpopme.', '21A');

INSERT INTO PRODUCTS VALUES ('1P','x13 mobile', 'this phone has 15gig ram and 3 cameras', 1300, 'product1-picture-path', 1.3, 100, '1C', '3S');
INSERT INTO PRODUCTS VALUES ('2P','xbox series x', 'Introducing Xbox Series X, the fastest, most powerful Xbox ever. Play thousands of titles from four 
generations of consoles-all games look and play best on Xbox Series X.', 700, 'product2-picture-path', 2, 230, '1C', '1S');
INSERT INTO PRODUCTS VALUES ('3P','Android 10.0 Tablet', ' M7 tablet | Case for tablet 2-1  Capacitive pen | Instruction manual USA standard charger | 
Type C data cable ', 150, 'product3-picture-path', 0.5, 310, '1C', '3S');
INSERT INTO PRODUCTS VALUES ('4P','Instant Pot Smart Wifi 6 Quart Multi-use Electric Pressure', 'The Instant Pot Smart Wifi combines 8 kitchen appliances in  yogurt maker ', 1300, 'product4-picture-path', 3, 50, '1C', '7S');
INSERT INTO PRODUCTS VALUES ('5P','Bounty Quick-Size Paper Towels', 'Pack contains 12 Family Rolls of 
Bounty white Quick Size paper towels, 12 Family Rolls equals 30 Regular Rolls ', 21, 'product5-picture-path', 0.2, 1000, '3C', '5S');
INSERT INTO PRODUCTS VALUES ('6P','Grandma Cookies Variety Pack of 3', 'this phone has 15gig ram and 3 cameras', 12, 'product6-picture-path', 0.65, 230, '3C', '7S');
INSERT INTO PRODUCTS VALUES ('7P','Endura Flap Pet Door Double Fla', ': your dogs and cats will love their new independence to go in and out without your help; 
easy to use and durable, energy efficient and secure', 340, 'product7-picture-path', 1, 210, '6C', '5S');
INSERT INTO PRODUCTS VALUES ('8P','ORDORA Pet Hair Remover', ' This pet hair remover roller can easily clean 
cat/dog hair from your bed,...', 25, 'product8-picture-path', 0.1, 166, '6C', '2S');
INSERT INTO PRODUCTS VALUES ('9P','USANOOKS Microfiber Cleaning Cloth', ' 85%polyester, 15%polyamideUltra-absorbent microfiber towels Grip Root weave works 
like PLANT ROOT FOLLICLES', 24, 'product9-picture-path', 0.3, 554, '10C', '10S');
INSERT INTO PRODUCTS VALUES ('10P','The Miracle Cleaning Paste', 'The Pink Stuff Bundle,Miracle Cleaning Paste,Multi-purpose Cleaner,Bathroom Foam Cleaner', 30, 'product10-picture-path', 1.3, 120, '10C', '10S');

INSERT INTO COMMENTS VALUE ('C1','I USED THIS PRODUCT AND I REALLY RECOMMEND THIS', '7U', '5P');
INSERT INTO COMMENTS VALUE ('C2', 'WHAT EVER YOU DO JUST DONT BY THIS!!', '8U', '2P');
INSERT INTO COMMENTS VALUE ('C3', 'GOOD QUALITY AND EASY TO USE', '9U', '1P');
INSERT INTO COMMENTS VALUE ('C4','ONE OF THE BEST PRODUCTS I HAVE EVER ORDERED ONLINE', '3U', '9P');
INSERT INTO COMMENTS VALUE ('C5', 'STOP SELLING BAD PRODUCTS LIKE THIS!', '8U', '3P');
INSERT INTO COMMENTS VALUE ('C6', 'I REALLY RECOMMEND BYING THIS', '10U', '9P');
INSERT INTO COMMENTS VALUE ('C7', 'A BIIGG DISLIKE!', '7U', '3P');
INSERT INTO COMMENTS VALUE ('C8', 'BY THIS IF YOU LIKE WASTING MONEY', '1U', '2P');
INSERT INTO COMMENTS VALUE ('C9', 'I USE THIS EVERY WEEK AND I LOVE IT', '9U', '10P');
INSERT INTO COMMENTS VALUE ('C10', 'ONE OF THE BEST COOKIES I HAVE EVER EAT', '2U', '6P');

INSERT INTO DISCOUNTS VALUES ('1D','summer discount', '6-9-20', '15% OFF');
INSERT INTO DISCOUNTS VALUES ('2D','daily discount', '8-11-19', '25% OFF');
INSERT INTO DISCOUNTS VALUES ('3D','min discount', '6-7-20', '10% OFF');
INSERT INTO DISCOUNTS VALUES ('4D','holiday discount', '3-12-19', '5% OFF');
INSERT INTO DISCOUNTS VALUES ('5D','school discount', '8-5-17', '50% OFF');
INSERT INTO DISCOUNTS VALUES ('6D','miracle discount', '17-8-20', '70% OFF');
INSERT INTO DISCOUNTS VALUES ('7D','black friday discount', '24-2-20', '18% OFF');
INSERT INTO DISCOUNTS VALUES ('8D','tokyo discount', '6-9-21', '23% OFF');
INSERT INTO DISCOUNTS VALUES ('9D','nestle discount', '4-12-20', '35% OFF');
INSERT INTO DISCOUNTS VALUES ('10D','summer discount', '3-1-21', '8% OFF');

INSERT INTO DELIVERY_METHODS VALUES ('1D','International shipping', ' International shipping is the process of importing and exporting goods between different countries', 'Maersk Line', 'Maersk_Line.com');
INSERT INTO DELIVERY_METHODS VALUES ('2D','Parcel shipping', 'parcel means packages that weigh 100 pounds or less and can be moved without assistance', 'Matson Inc', 'Matson-Inc.com');
INSERT INTO DELIVERY_METHODS VALUES ('3D','Sea shipping', 'shipping your orders through the sea', 'Atlantic Container Line', 'Atlantic.com');
INSERT INTO DELIVERY_METHODS VALUES ('4D','trailer service', 'A trailer is a container on wheels pulled by a car or another vehicle used to transport large or heavy cargo.', 'Angelicoussis Shipping Group', 'Angelicoussis.org');
INSERT INTO DELIVERY_METHODS VALUES ('5D','Haulage', 'the commercial act of transporting goods by road or railway', 'ONE Ocean Network Express', 'Ocean.org');
INSERT INTO DELIVERY_METHODS VALUES ('6D','Pallet shipping', 'a packaging material used to transport goods. Its use can range from storing, securing, stacking', 'Cargill Inc', 'Cargill.com');
INSERT INTO DELIVERY_METHODS VALUES ('7D','Fragile goods transport', 'If you’re buying breakables or selling a sculpture online you eill use this kind', 'Maersk Line', 'Maersk_Line.org');
INSERT INTO DELIVERY_METHODS VALUES ('8D','Full Truckload or FTL shipping', 'a type of shipping mode whereby a truck carries one dedicated shipment', 'ONE Ocean Network Express', 'Ocean.com');
INSERT INTO DELIVERY_METHODS VALUES ('9D','Less than Truckload or LTL shipping', 'a shipping service for relatively small loads or quantities of freight.', 'Cargill Inc', 'Cargill.com');
INSERT INTO DELIVERY_METHODS VALUES ('10D','Expedited Freight', 'a method of shipping freight that ensures goods arrive faster than regular transit times', 'Matson Inc', 'Matson-Inc.com');

INSERT INTO PAYMENT_METHODS VALUES ('1P', 'paying 100% of order fee in your place by cash', 'Zbank');
INSERT INTO PAYMENT_METHODS VALUES ('2P','paying online in whatever way', 'Paypal');
INSERT INTO PAYMENT_METHODS VALUES ('3P','Apple Pay is a mobile payment and digital wallet service by Apple Inc. 
that allows users to make payments in person, in iOS app', 'Apple Pay');
INSERT INTO PAYMENT_METHODS VALUES ('4P', 'a digital wallet platform and online payment system developed by Google to power in-app, online, and in-person 
contactless purchases on mobile devices, enabling users to make payments with Android phones', 'Google Pay');
INSERT INTO PAYMENT_METHODS VALUES ('5P','a leading technology driven Payment Institute delivering cutting edge ‘one-stop-solution’ 
for all payments & value-added services from checkout to debt collection', 'Novalnet ');
INSERT INTO PAYMENT_METHODS VALUES ('6P','it gives the opportunity for customers to issue their own payment methods, and also 
provides digital banking and commerce services.', 'Wirecard ');
INSERT INTO PAYMENT_METHODS VALUES ('7P','operates with e-payment', 'Hipay');
INSERT INTO PAYMENT_METHODS VALUES ('8P','Heidelpay allows online merchants to accept different payments from all regions of the world', 'Heidelpay');
INSERT INTO PAYMENT_METHODS VALUES ('9P','provided a digital enablement service, which gives cardholders the opportunity 
to make more secure digital payments from a variety of connected devices through a tap', 'Mastercard');
INSERT INTO PAYMENT_METHODS VALUES ('10P','credit card processing for Visa, MasterCard, PayPal ', 'Paymill');

INSERT INTO ORDERS VALUES ('1O', '12-4-20', 700, 25, 25, 700, '14-4-20', '1U', '1P', '2D', '6D');
INSERT INTO ORDERS VALUES ('2O', '13-3-20', 340, 13, 13, 340, '15-3-20', '5U', '3P', '2D', '1D');
INSERT INTO ORDERS VALUES ('3O', '28-7-19', 871, 10, 21, 860, '30-7-19', '6U', '7P', '8D', '3D');
INSERT INTO ORDERS VALUES ('4O', '3-4-19', 1324, 24, 0, 1348, '7-4-19', '7U', '3P', '5D', NULL);
INSERT INTO ORDERS VALUES ('5O', '12-8-17', 30, 12, 0, 42, '15-8-17', '8U', '5P', '9D', NULL);
INSERT INTO ORDERS VALUES ('6O', '24-4-19', 180, 5, 0, 185, '29-4-19', '10U', '4P', '10D', NULL);
INSERT INTO ORDERS VALUES ('7O', '18-10-20', 1450, 13, 0, 1463, '21-10-20', '8U', '2P', '8D', NULL);
INSERT INTO ORDERS VALUES ('8O', '19-4-20', 12, 5, 8.5, 8.5, '20-4-20', '3U', '3P', '1D', '5D');

INSERT INTO OP VALUES ('1OP', '2P', '1O', '6S');
INSERT INTO OP VALUES ('2OP', '4P', '7O', '7S');
INSERT INTO OP VALUES ('3OP', '7P', '2O', '1S');
INSERT INTO OP VALUES ('4OP', '2P', '3O', '8S');
INSERT INTO OP VALUES ('5OP', '3P', '3O', '1S');
INSERT INTO OP VALUES ('6OP', '9P', '4O', '9S');
INSERT INTO OP VALUES ('7OP', '10P', '6O', '9S');
INSERT INTO OP VALUES ('8OP', '3P', '7O', '7S');
INSERT INTO OP VALUES ('9OP', '10P', '5O', '7S');
INSERT INTO OP VALUES ('10OP', '6P', '8O', '4S');
INSERT INTO OP VALUES ('11OP', '3P', '6O', '3S');
INSERT INTO OP VALUES ('12OP', '1P', '4O', '4S');
INSERT INTO OP VALUES ('13OP', '5P', '3O', '2S');

INSERT INTO SUPPORT VALUES ('1SU', '1U', '4E','1O', 'my order supposed to come tommoro but it has not arrived yet.');
INSERT INTO SUPPORT VALUES ('2SU', '1U', '5E','1O', 'it has been nearly 10 days and i have also talked to your co worker ms.smith, but he did not do any thing and my order is not here yet.');
INSERT INTO SUPPORT VALUES ('3SU', '6U', '5E','3O','the product which you sent, is not what i have ordered!');
INSERT INTO SUPPORT VALUES ('4SU','3U', '4E', '8O', 'the tablet which arrived is broken and you should change it for me !!!');
INSERT INTO SUPPORT VALUES ('5SU', '8U', '5E', '5O', 'the towels you sent are not the coolor that i ordered.');
INSERT INTO SUPPORT VALUES ('6SU', '8U', '4E', '7O', 'this is not the quality that i was promised and i want my money back.');
INSERT INTO SUPPORT VALUES ('7SU', '6U', '5E', '3O', 'this does not hold on my door so i want to exchange this product.');
INSERT INTO SUPPORT VALUES ('8SU', '10U', '4E','6O', 'these smell so bad i guess these are outdated.');

/*creating 5 views for part 8 */
/*1*/
CREATE VIEW paris_users AS
SELECT U.FIRST_NAME, U.LAST_NAME, U.PHONE_NUM, U.GENDER
FROM USERS U
INNER JOIN ADDRESSES A
ON U.ADDRESS_ID = A.ADDRESS_ID
WHERE A.CITY= 'paris' ;

/*2*/
CREATE VIEW adult_user AS
SELECT FIRST_NAME, LAST_NAME, AGE
FROM USERS
WHERE AGE>18;


/*3*/
CREATE VIEW stored_product AS
SELECT PRODUCT_ID, DESCRIPTION, STOCK,PRICE
FROM PRODUCTS
WHERE STOCK>0;


/*4*/
CREATE VIEW royal_mail_info AS
SELECT CO_WEBSITE, NAME, DESCRIPTION
FROM DELIVERY_METHODS
WHERE CO_NAME= 'Maersk Line';


/*5*/
CREATE VIEW datascientists AS
SELECT E.FIRST_NAME, E.LAST_NAME, E.EMAIL
FROM EMPLOYEES E
INNER JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
WHERE J.JOB_TITLE = 'datascientist' ;

/*selecting and inserting for part 9*/

/*1*/
SELECT P.NAME, P.DESCRIPTION, P.PRICE
FROM PRODUCTS P
INNER JOIN CATEGORIES C
ON P.CATEGORY_ID = C.CATEGORY_ID
WHERE C.NAME = 'groceries';

/*2*/
SELECT U.USER_ID, U.FIRST_NAME, U.LAST_NAME
FROM USERS U
INNER JOIN PREMIUM P
ON U.USER_ID = P.USER_ID;

/*3*/
SELECT DISCOUNT_ID, EXP_DATE
FROM DISCOUNTS
WHERE DESCRIPTION = '15% OFF';

/*4*/
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE AGE > 40;

/*5*/
SELECT ORDER_ID, SHIPPING_DATE
FROM ORDERS
WHERE TOT_FEE > 150;

/*6*/
SELECT P.IMAGE_PATH, P.DESCRIPTION,  S.WEBSITE
FROM PRODUCTS P
INNER JOIN SUPPLIERS S
ON P.SUPPLIER_ID = S.SUPPLIER_ID
WHERE P.STOCK > 0;

/*7*/
SELECT * FROM DISCOUNTS;
INSERT INTO DISCOUNTS
VALUES ('11D', '21-3-10', 'legendary discount', '15% OFF');
SELECT * FROM DISCOUNTS;

/*8*/
SELECT * FROM USERS;
INSERT INTO USERS (USER_ID, FIRST_NAME, LAST_NAME, PASSWORD, PHONE_NUM, ADDRESS_ID)
VALUES ('NARGES__', 'narges', 'baba ahmadi', '1234567890', '091123', '1A');
SELECT * FROM USERS;

/*9*/
SELECT *
FROM ADDRESSES
WHERE CITY LIKE 'a%' OR CITY LIKE '%a';

/*10*/
SELECT *
FROM USERS
WHERE AGE > 20 AND AGE < 40;

/*creating two triggers*/
delimiter //
CREATE TRIGGER user_age_check
    BEFORE INSERT ON  USERS
    FOR EACH ROW
    BEGIN
    IF NEW.AGE<0 OR NEW.AGE>100 THEN
    signal sqlstate '45000' set message_text = 'PLEASE ENTER AN APPROPRIATE AGE!!!';
    END IF;
    END//
    delimiter ;

delimiter //
CREATE TRIGGER product_tr
    AFTER update ON PRODUCTS
    FOR EACH ROW
    BEGIN
    IF NEW.PRICE != OLD.PRICE THEN
        UPDATE ORDERS INNER JOIN  OP ON ORDERS.ORDER_ID = OP.ORDER_ID SET ORDERS.PRODUCT_COST = ORDERS.PRODUCT_COST + (NEW.PRICE - OLD.PRICE) ,
        ORDERS.TOT_FEE = ORDERS.TOT_FEE + (NEW.PRICE - OLD.PRICE) WHERE OP.PRODUCT_ID = OLD.PRODUCT_ID;
    end if;
    END//
    delimiter ;
select * from orders;

update products set PRICE = 500 where PRODUCT_ID = '2p';

select * from orders;

/*creating two functions*/
DELIMITER //
CREATE FUNCTION FIND_DISCOUNT(PR_COST INT, DEL_COST INT, TOT_COST INT) RETURNS int DETERMINISTIC
BEGIN
  RETURN (PR_COST + DEL_COST) - TOT_COST;
END
//
DELIMITER ;

SELECT FIND_DISCOUNT(30, 10, 25);

DELIMITER //
CREATE FUNCTION CALCULATE_DISCOUNT(PR_COST INT, DISCOUNT_PERCENTAGE INT) RETURNS int DETERMINISTIC
BEGIN
  RETURN PR_COST - ((DISCOUNT_PERCENTAGE/100) * PR_COST) ;
END
//
DELIMITER ;

SELECT CALCULATE_DISCOUNT(40, 20);

/*creating two stored procedure*/
DELIMITER  //
CREATE PROCEDURE FIND_BY_LASTNAME (LASTNAME varchar(200))
BEGIN
SELECT FIRST_NAME, PHONE_NUM, GENDER
FROM USERS
WHERE LAST_NAME= LASTNAME ;
END //
DELIMITER ;


DELIMITER  //
CREATE PROCEDURE ABOVE_INCOME_FINDER (INCOME INT)
BEGIN
SELECT FIRST_NAME, LAST_NAME, EMAIL, SALARY
FROM EMPLOYEES
WHERE SALARY > INCOME ;
END //
DELIMITER ;

call ABOVE_INCOME_FINDER(5000);

