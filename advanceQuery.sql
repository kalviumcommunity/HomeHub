use estate;
-- Select all users with the 'Agent' roles
SELECT U.Username, U.FirstName, U.LastName, R.RoleName
FROM Users U
JOIN UserRoles UR ON U.UserID = UR.UserID
JOIN Roles R ON UR.RoleID = R.RoleID
WHERE R.RoleName = 'Agent';

-- Select properties that are available for sale
SELECT P.PropertyID, A.Address, P.PropertyType, P.Price, P.Bedrooms, P.Bathrooms, P.SquareFootage
FROM Properties P
JOIN Addresses A ON P.AddressID = A.AddressID
WHERE P.IsForSale = 'Yes';

-- Calculate total commission earned by each agent
SELECT A.AgentID, U.Username AS AgentName, SUM(C.CommissionAmount) AS TotalCommissionEarned
FROM Agents A
JOIN Users U ON A.UserID = U.UserID
JOIN Commission C ON A.AgentID = C.AgentID
GROUP BY A.AgentID, AgentName;

-- Find properties booked by a specific client (replace 3 with the actual client ID)
SELECT P.PropertyID, A.Address, B.BookingDateTime, B.Purpose, B.Notes, B.Status
FROM Properties P
JOIN Addresses A ON P.AddressID = A.AddressID
JOIN Booking B ON P.PropertyID = B.PropertyID
WHERE B.ClientID = 3;

-- Retrieve transactions with property, agent, and address information
SELECT T.TransactionID, T.TransactionDate, T.SalePrice, T.PaymentMethod, T.Status,
       P.PropertyID, A.Address,
       U.Username AS AgentName, U.Email AS AgentEmail
FROM Transactions T
JOIN Properties P ON T.PropertyID = P.PropertyID
JOIN Addresses A ON P.AddressID = A.AddressID
JOIN Agents AG ON T.AgentID = AG.AgentID
JOIN Users U ON AG.UserID = U.UserID;

-- Find clients who have booked properties with a specific agent (replace 3 with the actual agent ID)
SELECT C.ClientID, U.Username AS ClientName, U.Email AS ClientEmail
FROM Clients C
JOIN Users U ON C.UserID = U.UserID
JOIN Booking B ON C.ClientID = B.ClientID
WHERE B.AgentID = 3;

--  List the properties with the highest sale price
SELECT PropertyID, AddressID, PropertyType, Price
FROM Properties
WHERE Price = (SELECT MAX(Price) FROM Properties);

--  Find the agents with the highest total commission earned
SELECT A.AgentID, U.Username AS AgentName, SUM(C.CommissionAmount) AS TotalCommissionEarned
FROM Agents A
JOIN Users U ON A.UserID = U.UserID
JOIN Commission C ON A.AgentID = C.AgentID
GROUP BY A.AgentID, AgentName
HAVING TotalCommissionEarned = (SELECT MAX(TotalCommissionEarned) FROM (SELECT A.AgentID, SUM(C.CommissionAmount) AS TotalCommissionEarned FROM Agents A JOIN Commission C ON A.AgentID = C.AgentID GROUP BY A.AgentID) AS AgentCommissions);

--  List the properties that are currently booked
SELECT P.PropertyID, A.Address, B.BookingDateTime, B.Purpose, B.Notes, B.Status
FROM Properties P
JOIN Addresses A ON P.AddressID = A.AddressID
JOIN Booking B ON P.PropertyID = B.PropertyID
WHERE B.BookingDateTime >= NOW();

--  Find the clients who have booked the most properties
SELECT C.ClientID, U.Username AS ClientName, COUNT(B.PropertyID) AS TotalBookings
FROM Clients C
JOIN Users U ON C.UserID = U.UserID
JOIN Booking B ON C.ClientID = B.ClientID
GROUP BY C.ClientID, ClientName
HAVING TotalBookings = (SELECT MAX(TotalBookings) FROM (SELECT C.ClientID, COUNT(B.PropertyID) AS TotalBookings FROM Clients C JOIN Booking B ON C.ClientID = B.ClientID GROUP BY C.ClientID) AS ClientBookings);

--  List properties that have not been booked at all
SELECT P.PropertyID, A.Address
FROM Properties P
JOIN Addresses A ON P.AddressID = A.AddressID
LEFT JOIN Booking B ON P.PropertyID = B.PropertyID
WHERE B.PropertyID IS NULL;

--  Calculate the total commission earned per property
SELECT P.PropertyID, A.Address, SUM(C.CommissionAmount) AS TotalCommissionEarned
FROM Properties P
JOIN Addresses A ON P.AddressID = A.AddressID
JOIN Transactions T ON P.PropertyID = T.PropertyID
JOIN Commission C ON T.TransactionID = C.TransactionID
GROUP BY P.PropertyID, A.Address;

