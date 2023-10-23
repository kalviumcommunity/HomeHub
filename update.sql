use estate;

UPDATE Roles
SET RoleName = 'Owner', Description = 'Property Owner'
WHERE RoleName = 'Admin';

SELECT * from Roles;