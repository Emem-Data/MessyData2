-- Create a table into an existing Database
CREATE TABLE dbo.customers_Info(
    ID INT NOT NULL IDENTITY(1,1) , 
    FullName VARCHAR(255), 
    Age INT, 
    Email VARCHAR(255), 
    Phone BIGINT,
    PhoneNumber VARCHAR(20)
);
----------------------------------------------------------------------------------------------------------------------------------------

-- Drop Column Phone from table
ALTER TABLE dbo.customers_Info
    DROP COLUMN Phone;
----------------------------------------------------------------------------------------------------------------------------------------

-- Insert data into the table created
INSERT INTO customers_Info ([FullName], [Age], [Email], [PhoneNumber]) 
VALUES
    ('John Doe', 32, 'john.doe@gmail.com', '555-123-4567'),
    ('Jane Smith', 28, 'jane.smith@yahoo.com', '(555) 987-6543'),
    ('Bob Johnson', 45, 'bobjohnson@hotmail.com', '555-555-5555'),
    ('Sarah Lee', 27, 'sarahlee@gmail.com', '5551234567'),
    ('Tom Wilson', 36, 'tomwilson@gmail.com', NULL),
    ('Mary Brown', 52, 'mary.brown@gmail.com', '(555) 555-1234'),
    ('Joe Jackson', NULL, 'joejackson@yahoo.com', '555-987-6543'),
    ('Lisa Green', 41, 'lisagreen@gmail.com', '555-321-6548'),
    ('Chris Brown', 33, 'chris.brown@gmail.com', '555-555-1212'),
    ('Alex Kim', 29, 'alexkim@', '(555) 123-4567'),
    ('Tim Jones', 47, 'timjones@gmail.com', '555-555-5555'),
    ('Anne Lee', 31, 'annelee@yahoo.com', NULL ),
    ('Mark Johnson', 28, 'markjohnson@gmail.com', '555-555-1234'),
    ('Grace Kim', 24, NULL, '555-987-6543'),
    ('David Smith', 42, 'davidsmith@yahoo.com', '555-555-3215'),
    ('Samantha Lee', 25, 'samantha.lee@yahoo.com', '555-123-4567'),
    ('Brian Johnson', 52, 'brianjohnson@hotmail.com', '(555) 555-5555'),
    ('Linda Brown', 48, 'linda.brown@gmail.com', '555-555-1212'),
    ('Jack White', NULL, 'jackwhite@yahoo.com', NULL ),
    ('Alex Jones', 29, 'alexjones@gmail.com', '555-321-6548'),
    ('Lily Kim', 31, 'lilykim@', '555-555-5555'),
    ('Jason Chen', 27, 'jason.chen@hotmail.com', '5551234567'),
    ('Karen Lee', 38, 'karen.lee@gmail.com', '(555) 987-6543'),
    ('Kevin Davis', 45, 'kevindavis@gmail.com', '555-555-1234'),
    ('Lisa Kim', 26, 'lisakim@gmail.com', '555-321-6548'),
    ('Sarah Brown', 39, 'sarahbrown@yahoo.com', '555-555-5555'),
    ('Mike Johnson', NULL , 'mikejohnson@gmail.com', '(555) 555-1234'),
    ('Amy Kim', 34, 'amykim@yahoo.com', '555-987-6543'),
    ('Greg Smith', 31, 'gregsmith@gmail.com', '555-321-6548'),
    ('Tina Lee', 27, 'tinalee@', '555-555-5555'),
    ('Patrick Johnson', 36, 'patrickjohnson@hotmail.com', '555-123-4567'),
    ('Rachel Brown', 49, 'rachelbrown@gmail.com', '(555) 555-5555'),
    ('Michael Kim', 26, 'michaelkim@yahoo.com', '555-555-1212'),
    ('Jessica Lee', 30, 'jessicalee@gmail.com', '555-555-5555'),
    ('William Smith', NULL , 'williamsmith@yahoo.com', '(555) 123-4567');
 ----------------------------------------------------------------------------------------------------------------------------------------

--  Now Let's view our table
SELECT * FROM customers_Info;
----------------------------------------------------------------------------------------------------------------------------------------

-- Check Numbers of Rows and Columns
SELECT COUNT(*) No_of_rows FROM customers_Info;
SELECT COUNT(*) No_of_columns FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers_Info';
----------------------------------------------------------------------------------------------------------------------------------------

-- Check for missing data across every column
SELECT 
    SUM(CASE WHEN [Age] IS NULL THEN 1 ELSE 0 END) AS Age_missing_values,
    SUM(CASE WHEN [Email] IS NULL THEN 1 ELSE 0 END) AS Email_missing_values,
    SUM( CASE WHEN [PhoneNumber] IS NULL THEN 1 ELSE 0 END) AS Phone_missing_values
FROM customers_Info;
----------------------------------------------------------------------------------------------------------------------------------------

-- Check for outliers
SELECT *
FROM customers_Info
WHERE Age > (SELECT AVG(Age) + 3 * STDEV(Age) FROM customers_Info)
   OR Age < (SELECT AVG(Age) - 3 * STDEV(Age) FROM customers_Info);
----------------------------------------------------------------------------------------------------------------------------------------

-- Replace null Values with the mean age
SELECT AVG(Age) AvgNumber
FROM customers_Info;

UPDATE customers_Info 
SET Age = (SELECT AVG(Age) AvgNumber FROM customers_Info)
WHERE Age IS NULL;

SELECT [Age] FROM customers_Info;
----------------------------------------------------------------------------------------------------------------------------------------

-- Fix Email Column

---- We have one null value in the email column, "." in-between some email address, and
---- some emails don't have the suffice domain.

-- 1.
SELECT [Email] FROM customers_Info
WHERE Email LIKE '_%.%@%._%'; ---Select values with "." between firstname and lastname in the email address

-- Testing the result before using the UPDATE keyword.
SELECT REPLACE(Email, '.', '') FROM customers_Info 
WHERE Email LIKE '_%.%@%._%';

-- Updating the table
UPDATE customers_Info
SET Email = REPLACE(Email, '.', '')
WHERE Email LIKE '_%.%@%._%';

SELECT [Email] FROM customers_Info;
----------------------------------------------------------------------------------------------------------------------------------------
-- 2. Emails Without domain
SELECT * FROM customers_Info
WHERE Email LIKE '_%@';

-- Emails Without domain
DELETE FROM customers_Info
WHERE Email LIKE '_%@';
----------------------------------------------------------------------------------------------------------------------------------------
-- 3. Delete null values
DELETE FROM customers_Info
WHERE Email IS NULL;

SELECT * FROM customers_Info;
----------------------------------------------------------------------------------------------------------------------------------------
-- Fix Phone column

-- 1. check for length

SELECT [PhoneNumber], LEN([PhoneNumber]) FROM customers_Info
WHERE  LEN([PhoneNumber]) >10;

UPDATE customers_Info
SET [PhoneNumber] = REPLACE(REPLACE(REPLACE(REPLACE(PhoneNumber, '-', ''), '(', ''), ')', ''), ' ', '') 
WHERE LEN([PhoneNumber]) >10 ;




SELECT * FROM customers_Info;








