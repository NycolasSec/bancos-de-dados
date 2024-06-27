--- --- ---
CREATE USER 'nycolas'@'localhost' IDENTIFIED BY 'senha';

CREATE USER 'atylas'@'localhost' IDENTIFIED BY '123';

CREATE USER 'admin'@'localhost' IDENTIFIED BY '456';
--- --- ---


--- --- ---
select user from mysql.user;
--- --- ---


--- --- ---
GRANT CREATE, INSERT
ON *.*
TO "nycolas"@"localhost";

GRANT SELECT
ON *.*
TO 'atylas'@'localhost';

GRANT UPDATE, DROP
ON *.*
TO 'admin'@'localhost';

--- --- ---

