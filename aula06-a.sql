-- Questão 01.
CREATE USER User_A WITH PASSWORD = 'Senh4@Exempl0';
CREATE USER User_B WITH PASSWORD = 'Senh4@Exempl0';
CREATE USER User_C WITH PASSWORD = 'Senh4@Exempl0';
CREATE USER User_D WITH PASSWORD = 'Senh4@Exempl0';
CREATE USER User_E WITH PASSWORD = 'Senh4@Exempl0';

-- Questão 02.
GRANT SELECT, INSERT, UPDATE, DELETE ON address TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON advisor TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON course TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON department TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON instructor TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON person TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON prereq TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON section TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON student TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON takes TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON teaches TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON time_slot TO User_A WITH GRANT OPTION;

-- Questão 03.
SELECT 
    princ.name AS user_name
  , princ.type_desc
  , perm.permission_name
  , perm.state_desc
  , perm.class_desc
  , object_name(perm.major_id) AS object_name
FROM sys.database_principals princ
LEFT JOIN sys.database_permissions perm
    ON perm.grantee_principal_id = princ.principal_id
WHERE princ.type_desc = 'SQL_USER'
  AND princ.name = 'User_A'
ORDER BY princ.name;

