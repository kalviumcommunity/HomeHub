use estate;

INSERT INTO Users (Username, PasswordHash, Email, FirstName, LastName)
VALUES
    ('john_doe', 'password_hash_here', 'john@example.com', 'John', 'Doe'),
    ('jane_smith', 'password_hash_here', 'jane@example.com', 'Jane', 'Smith'),
    ('user3', 'password_hash_here', 'user3@example.com', 'User', 'Three');

INSERT INTO Roles (RoleName, Description)
VALUES
    ('Admin', 'System Administrator'),
    ('Agent', 'Real Estate Agent'),
    ('Client', 'Property Buyer');


INSERT INTO UserRoles (UserID, RoleID)
VALUES
    (1, 1),  
    (2, 2),  
    (3, 3);  

INSERT INTO Agents (UserID, LicenseNumber)
VALUES
    (1, '12345'),
    (3, '67891');

INSERT INTO Clients (UserID, Phone)
VALUES
    (3, '555-555-5555');
    (4, '444-444-4444');


INSERT INTO Owners (UserID, OwnerName, OwnerContactInfo, OwnershipStartDate, OwnershipEndDate)
VALUES
    (1, 'ABC Corporation', 'contact@example.com', '2023-01-01', '2023-12-31');
   


INSERT INTO Addresses (Address, City, State, ZIPCode)
VALUES
    ('123 Main St', 'Cityville', 'CA', '12345'),
    ('456 Elm St', 'Townsville', 'NY', '54321');


INSERT INTO Properties (AddressID, PropertyType, Price, Bedrooms, Bathrooms, SquareFootage, Description, AgentID, OwnerID, IsForSale, IsForRent)
VALUES
    (1, 'Single Family', 250000.00, 3, 2.5, 2000, 'Beautiful home', 1, 1, 'Yes', 'No'),
    (2, 'Condo', 150000.00, 2, 1.5, 1200, 'Cozy condo', 1, 1, 'Yes', 'No');


INSERT INTO Transactions (PropertyID, ClientID, AgentID, TransactionDate, SalePrice, PaymentMethod, Status)
VALUES
    (5, 3, 1, '2023-10-15', 245000.00, 'Credit Card', 'Completed'),
    (6, 3, 1, '2023-10-20', 140000.00, 'Cash', 'Completed');

INSERT INTO Commission (AgentID, TransactionID, CommissionAmount, CommissionPercentage, CommissionDate)
VALUES
    (1, 7, 12250.00, 5.0, '2023-10-15'),
    (1, 8, 7000.00, 5.0, '2023-10-20');

INSERT INTO PropertyImages (PropertyID, ImageURL)
VALUES
    (5, 'image_url_1'),
    (5, 'image_url_2'),
    (6, 'image_url_3');

INSERT INTO Booking (PropertyID, ClientID, AgentID, BookingDateTime, Purpose, Notes, Status)
VALUES
    (5, 3, 1, '2023-10-20 15:00:00', 'Property Viewing', 'Interested in viewing the property', 'Scheduled'),
    (6, 3, 1, '2023-10-22 14:00:00', 'Property Inspection', 'Checking condo details', 'Scheduled');




