create DATABASE salaries;
use salaries;
select * from ds_salaries;

-- 1. What is the ranking of employees within each job title based on their salary, ordered from highest to lowest?
select work_year,job_title,salary,company_location,ROW_NUMBER() over(PARTITION BY job_title ORDER BY salary DESC)as id from ds_salaries;

-- 2. What is the salary-based ranking of employees within each job title, with ties for employees earning the same salary?
select work_year,job_title,salary,company_location,rank() over(partition by job_title ORDER BY salary desc) as employee_rank from ds_salaries;

-- 3. How can I rank employees by salary within each job title, ensuring consecutive ranks even when multiple employees have the same salary?
select work_year,job_title,salary,company_location,DENSE_RANK() OVER(PARTITION BY job_title ORDER BY salary desc) as employee_rank from ds_salaries;

-- 4. How can I find the maximum salary within each job title while displaying each employee's work year, job title, salary, and company location?
select work_year,job_title,salary,company_location,max(salary) over(PARTITION BY job_title) as maximum_salary from ds_salaries;

-- 5. How can I find the minimum salary within each job title while showing each employee’s work year, job title, salary, and company location?
select work_year,job_title,salary,company_location,min(salary) OVER(PARTITION BY job_title) as minimum_salary from ds_salaries;

-- 6. How can I calculate the average salary for each job title while displaying each employee's work year, job title, salary, and company location?
select work_year,job_title,salary,company_location,avg(salary) OVER(PARTITION BY job_title) as average_salary from ds_salaries;

-- 7. How can I calculate the total salary for each job title while displaying each employee's work year, job title, salary, and company location?
select work_year,job_title,salary,company_location,sum(salary) OVER(PARTITION BY job_title) as total_salary from ds_salaries;

-- 8. How can you retrieve the job title, salary, company location, and previous salary of employees for each job title, ordered by highest salary, using a window function?
select work_year,job_title,salary,company_location,lag(salary,1,0) over(PARTITION BY job_title ORDER BY salary desc)as previous_salary from ds_salaries;

-- 9. How can you retrieve the work_year, job_title, salary, company_location, and the next (future) salary for each job title from the ds_salaries table?
select work_year,job_title,salary,company_location,lead(salary,1,0) over(PARTITION BY job_title ORDER BY salary desc)as future_salary from ds_salaries;

-- 10. How can you display each employee’s salary alongside the highest salary within their job title?
select work_year,job_title,salary,company_location,FIRST_VALUE(salary) OVER(PARTITION BY job_title ORDER BY salary desc) as first_salary from ds_salaries;

-- 11. How can you display each employee’s salary alongside the lowest salary in their job title, regardless of their position within the salary ranking?
select work_year,job_title,salary,company_location,LAST_VALUE(salary) over(PARTITION BY job_title ORDER BY salary desc 
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)as last_salary from ds_salaries;

-- 12. How can you display each employee’s salary along with the second-highest salary within their job title group?
select work_year,job_title,salary,company_location,NTH_VALUE(salary,2) OVER(PARTITION BY job_title ORDER BY salary desc RANGE
BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)as second_largest_salary from ds_salaries;

-- 13. How can you display each employee's salary along with their rank (row number) within their experience level group, based on salary?
select experience_level,job_title,salary,ROW_NUMBER() OVER(PARTITION BY experience_level ORDER BY salary desc)as roll_number from ds_salaries;

-- 14. How can you display each employee’s salary along with their rank within their experience level group, where employees with the same salary receive the same rank?
select experience_level,job_title,salary,RANK() OVER(PARTITION BY experience_level ORDER BY salary desc) as experience_rank from ds_salaries;

-- 15. How can you display each employee’s salary along with their dense rank within their experience level group, ensuring that employees with the same salary receive the same rank without skipping subsequent ranks?
select experience_level,employment_type,job_title,salary,DENSE_RANK() OVER(PARTITION BY experience_level ORDER BY salary desc) as rankers from ds_salaries;

select * from ds_salaries;

-- 16. How can you display each employee’s salary along with their dense rank within their employment type group, ensuring that employees with the same salary receive the same rank without skipping subsequent ranks?
select employment_type,job_title,salary,DENSE_RANK() OVER(PARTITION BY employment_type ORDER BY salary_in_usd desc)as rank_type from ds_salaries;

-- 17. How can you count the number of job titles in the ds_salaries table?
select count(job_title) count_of_jobs from ds_salaries;

-- 18. How can you retrieve the unique job titles from the ds_salaries table?
select DISTINCT job_title as unique_job from ds_salaries;

-- 19. How can you retrieve the unique experience levels from the ds_salaries table?
select DISTINCT experience_level as unique_experience_level from ds_salaries;

-- 20. How can you retrieve the unique employment types from the ds_salaries table?
select DISTINCT employment_type as unique_employment_type from ds_salaries;

-- 21. How can you retrieve the unique company locations from the ds_salaries table?
select distinct company_location as unique_location from ds_salaries;

-- 22. How can you retrieve the unique company sizes from the ds_salaries table?
select DISTINCT company_size as unique_company_size from ds_salaries;

-- 23. How can you retrieve all records from the ds_salaries table where the salary is greater than 200,000?
select * from ds_salaries where salary>200000;

-- 24. How can you retrieve all records from the ds_salaries table where the job title is 'Data Analyst'?
select * from ds_salaries where job_title="Data Analyst";

-- 25. How can you retrieve all records from the ds_salaries table where the job title is 'Data Scientist', the company size is 'S', and the company location is 'US'?
select * from ds_salaries where job_title="Data Scientist" and company_size="S" and company_location="US";

-- 26. How can you retrieve all records from the ds_salaries table where the job title is either 'ML Engineer' or 'AI Engineer'?
select * from ds_salaries where job_title="ML Engineer" or job_title="AI Engineer";

-- 27. How can you retrieve all records from the ds_salaries table where the company location is either 'CA' or 'BR'?
select * from ds_salaries where company_location="CA" or company_location="BR";

-- 28. How can you retrieve all records from the ds_salaries table where the job title is either 'Machine Learning Engineer', 'AI Developer', or 'Applied Scientist'?
select * from ds_salaries where job_title in("Machine Learning Engineer","AI Developer","Applied Scientist");

-- 29. How can you retrieve all records from the ds_salaries table where the employee residence is either 'ES', 'DE', 'GB', or 'CA'?
select * from ds_salaries where employee_residence IN("ES","DE","GB","CA");

-- 30. How can you retrieve all records from the ds_salaries table where the salary is between 50,000 and 100,000?
SELECT * FROM DS_SALARIES WHERE SALARY BETWEEN 50000 AND 100000;

-- 31. How can you retrieve all records from the ds_salaries table where the salary is less than 50,000?
SELECT * FROM DS_SALARIES WHERE SALARY<50000;

-- 32. How can you retrieve all records from the ds_salaries table where both the salary and salary in USD are less than 10,000?
SELECT * FROM DS_SALARIES WHERE SALARY<10000 AND salary_in_usd<10000;

-- 33. How can you retrieve all records from the ds_salaries table where the salary currency is neither 'USD' nor 'EUR'?
SELECT *FROM DS_SALARIES WHERE salary_currency NOT IN("USD","EUR");

-- 34. How can you retrieve all records from the ds_salaries table where the salary currency is 'INR'?
SELECT * FROM DS_SALARIES WHERE salary_currency="INR";

-- 35. How can you count the number of distinct job titles in the ds_salaries table?
SELECT COUNT(DISTINCT job_title) AS COUNT_OF_JOBS FROM DS_SALARIES;

-- 36. How can you count the number of distinct company locations in the ds_salaries table?
SELECT COUNT(DISTINCT company_location) AS COUNT_OF_LOCATION FROM DS_SALARIES;

-- 37. How can you count the number of distinct salary currencies in the ds_salaries table?
SELECT COUNT(DISTINCT salary_currency) AS COUNT_OF_SALARY_CURRENCY FROM DS_SALARIES;

-- 38. How can you retrieve the unique salary currencies from the ds_salaries table?
SELECT DISTINCT salary_currency AS UNIQUE_SALARY_CURRENCY FROM DS_SALARIES;

-- 39. How can you retrieve all records from the ds_salaries table where the salary is not between 100,000 and 250,000?
SELECT * FROM DS_SALARIES WHERE SALARY NOT BETWEEN 100000 AND 250000;

-- 40. How can you retrieve all records from the ds_salaries table?
select * from ds_salaries;
