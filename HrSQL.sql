
select * from hr
-- 1. How many people are in each job

select job_title,count(*)[no of jobers in each job] from hr
group by job_title
--2 gender break down of the staff
select gender,count(*)[Gender Count] from hr
group by gender

--3 Age spread of staff

SELECT 
    CASE 
        WHEN age BETWEEN 20 AND 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 40 THEN 'Adult'
        ELSE 'Old'
    END AS age_grouping,
    COUNT(*) AS num_people
FROM hr
GROUP BY 
    CASE 
        WHEN age BETWEEN 20 AND 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 40 THEN 'Adult'
        ELSE 'Old'
    END;
-- 4. which job pays more

SELECT job_title, salary, COUNT(*) AS count_of_jobs
FROM hr
GROUP BY job_title, salary
ORDER BY salary DESC;

-- 5.Top earners in each job

WITH RankedSalaries AS (
    SELECT 
        job_title, 
        salary,
        RANK() OVER (PARTITION BY job_title ORDER BY salary DESC) AS rank
    FROM hr
)
SELECT job_title, salary
FROM RankedSalaries
WHERE rank <= 3
ORDER BY job_title, salary DESC;

--6.Employee count by starting letter

SELECT 
    LEFT(name, 1) AS starting_letter, 
    COUNT(*) AS num_employees
FROM hr
WHERE LEFT(name, 1) BETWEEN 'A' AND 'Z'
GROUP BY LEFT(name, 1)
ORDER BY starting_letter;

--7. Leave Balance analysis
select name,leave_balance from hr 
order by leave_balance desc 

