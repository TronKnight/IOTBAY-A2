/**
 * Author:  Dev
 * Created: 10 May, 2023
 */

INSERT INTO IOTBAY.Users (FirstName, LastName, Email, Pass, PhoneNumber, StreetNumber, StreetName, Suburb, UState, Postcode, Country)
VALUES
('Gordon', 'Smith', 'gordon.smith@gmail.com', 'Test1234', '1234567890', '702', 'Harris Street', 'Ultimo' , 'NSW', '2000', 'Australia'),
('Joseph', 'Parker', 'joseph.parker@gmail.com', 'Random1234', '0412345678', '710', 'Harris Street', 'Ultimo', 'NSW', '2000', 'Australia'),
('Tony', 'Stark', 'tony.stark@gmail.com', 'Tony0010', '0444444444', '6', 'Marrion', 'Street', 'NSW', '2000', 'Australia');

INSERT INTO IOTBAY.Staff (StaffFirstName, StaffLastName, StaffEmail, StaffPass, StaffPhone, StaffCountry)
VALUES
('Jack', 'Ryan', 'jack.ryan@gmail.com', 'Jack0010', '0412345678', 'Australia'),
('Mike', 'Greer', 'mike.greer@gmail.com', 'Mike4321', '0412345678', 'Australia'),
('David', 'Rose', 'david.rose@gmail.com', 'David5121', '0412345678', 'Australia');


INSERT INTO IOTBAY.UserLogs VALUES
(1, 'Registered', '2023-05-14 10:45:00'),
(2, 'Logged Out', '2023-05-14 11:45:00'),
(3, 'Logged In', '2023-05-14 12:45:00');

DBinstertionScript:


INSERT INTO Order (orderID, email, orderDate, status, paymentID)
VALUES
(1, 'gordon.smith@gmail.com', '2023-05-01', 'Submitted', 1),
(2, 'joseph.parker@gmail.com', '2023-05-10', 'Saved', 2),
(3, 'tony.stark@gmail.com', '2023-05-20', 'Cancelled', 3);

CREATE TABLE OrderItem (
    itemID INT PRIMARY KEY,
    orderID INT,
    itemName VARCHAR(255),
    quantity INT,
    FOREIGN KEY (orderID) REFERENCES Order(orderID)
);