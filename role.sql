-- Create the estate database

USE estate;

-- Create the roles
CREATE ROLE Admin;
CREATE ROLE Agent;
CREATE ROLE Client;

-- Grant privileges to the roles
GRANT ALL PRIVILEGES ON estate.* TO Admin;

-- Assign specific privileges to each role
-- Example: Agent role
GRANT SELECT, INSERT, UPDATE, DELETE ON estate.Properties TO Agent;
GRANT SELECT, INSERT, UPDATE, DELETE ON estate.Transactions TO Agent;
-- Add more privileges as needed for this role

-- Example: Client role
GRANT SELECT ON estate.Clients TO Client;
GRANT SELECT, INSERT, UPDATE ON estate.Bookings TO Client;
-- Add more privileges as needed for this role
