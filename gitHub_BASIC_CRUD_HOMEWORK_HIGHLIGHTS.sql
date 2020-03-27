
/*** Task17.Create View Employees with Job Titles. 
     Write a SQL query to create view V_EmployeeNameJobTitle with full employee name and job title.
	 When middle name is NULL replace it with empty string (‘’).
 ***/
 
CREATE VIEW `v_employees_job_titles` AS SELECT
CASE WHEN `middle_name` IS NOT NULL THEN
 CONCAT(`first_name`,' ',`middle_name`,' ',`last_name`) ELSE
 CONCAT(`first_name`,'  ',`last_name`) END
AS `full_name`,`job_title` FROM employees;
SELECT *FROM `v_employees_job_titles`;

/*** alter ***/

CREATE VIEW `v_employees_job_titles` AS SELECT 
concat_ws(' ',`first_name`,IF(`middle_name` IS NULL,'',`middle_name`),`last_name`)
AS 'full_name',`job_title` FROM employees;
SELECT *FROM v_employees_job_titles;

/***Task21 - Increase Salaries. Write a SQL query to increase salaries of all employees that are in the 
Engineering, Tool Design, Marketing or Information Services department by 12%. 
Then select Salaries column from the Employees table. After that exercise restore your database to revert those changes. ***/

UPDATE `employees`
 SET `salary` = `salary`*'1.12' 
 WHERE `department_id` IN (1,2,4,11);
 SELECT `salary` FROM `employees`;
 
 /***Task23 - Biggest Countries by Population
Find the 30 biggest countries by population from Europe.
Display the country name and population. 
Sort the results by population (from biggest to smallest),
 then by country alphabetically. ***/

SELECT *FROM `countries`;
SELECT `population` AS 'Population',`country_name` AS 'CountryName' 
FROM `countries` WHERE `continent_code` = 'EU'ORDER BY `population` DESC,
 `country_name` ASC LIMIT 30;
 
 /***Task24 *Countries and Currency (Euro / Not Euro)
Find all countries along with information about their currency. 
Display the country name, country code and information about its currency:
 either "Euro" or "Not Euro". Sort the results by country name alphabetically.
*Hint: Use CASE … WHEN. ***/

 SELECT `country_name` AS 'CountryName',
 `country_code` AS 'CountryCode',
 IF(`currency_code` = 'EUR','Euro','Not Euro') AS 'Currency'
 FROM `countries` 
 ORDER BY `country_name` ASC;
