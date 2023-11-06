use estate;

-- INSERT INTO Users (Username, PasswordHash, Email, FirstName, LastName)
-- VALUES
--     ('User4', 'password_hash_here', 'user4@example.com', 'krittika', 'Tiwari');

DELETE FROM Users
WHERE Username = 'User4';

select * from Users;