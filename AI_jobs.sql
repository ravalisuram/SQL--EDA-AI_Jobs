--Sql AI Job Dataset--

create database sql_project1;

--create table

Create table ai_jobs
(
		job_id VARCHAR (50)PRIMARY KEY,
		job_title VARCHAR(100),	
		salary_usd INT,
		salary_currency	VARCHAR(100),
		experience_level VARCHAR(100),	
		employment_type	VARCHAR(100),
		company_location VARCHAR(100),	
		company_size VARCHAR(100),
		employee_residence VARCHAR(100),	
		remote_ratio INT,
		required_skills	VARCHAR(100),
		education_required	VARCHAR(100),
		years_experience INT,
		industry VARCHAR(100),
		posting_date DATE,
		application_deadline DATE,	
		job_description_length INT,
		benefits_score FLOAT,
		company_name VARCHAR(100)

);

select * from ai_jobs;

--Q1.Count of rows

select 
	count(*) 
from ai_jobs;

---Data Cleaning---

--Checking for NULL values

select * from ai_jobs
where job_id = NULL;

select * from ai_jobs
where 
	job_title = NULl
	or
	salary_usd =NULL
	or
	salary_currency	= NULL
	or 
	experience_level = NULl	
	or 
	employment_type	= NULL
	or 
	company_location = NULL	
	or 
	company_size = NULL
	or 
	employee_residence	= NULL
	or 
	remote_ratio= NULL
	or
	required_skills	= NULL
	or
	education_required =NULL
	or
	years_experience = NULL
	or
	industry = NULL
	or
	posting_date = NULL
	or
	application_deadline = NULL
	or
	job_description_length = NULL
	or 
	benefits_score= NULL
	or 
	company_name = NULL;

-- Data Analysis & Business Key Problems & Answers--

--1Q.Write a SQl Query to retrieve the ai jobs from the company location USA and Germany.
--2Q.Write a SQl Query to retrieve the ai jobs posted in the month of may 2025.
--3Q.Write a SQl Query to show the job_title,years_experience,required_skills for the job which has salary greater than 150000 in ascending order.
--4Q.Write a SQl Query to display the top 10 highest paid AI jobs and company locations.
--5Q.Write a SQl Query to retrive the count of AI jobs that require PHD as education.
--6Q.Write a SQL query to list the unique AI job titles.
--7Q.Write a SQl Query to display all the columns with has experience_level has Senior and has experience of more than 6 years.
--8Q.Write a SQl Query to show the columns which have application_deadline of 60 days.
--9Q.Write a sql query to display the number of AI jobs in different company location.
--10Q.Write a sql query to display the Average salary in different company locations.
--11Q. Write a SQL query to display the number of jobs availble for different education.
--12Q.Write a sql Query to show the Average salary for different experience level.
--13Q Write a SQL query to calculate the Average,minimum and maximum salary range for different education levels.
--14Q Write a SQl query to show which industry is hiring more AI talent.
--15Q.Write a sql query to show the top demand skills for AI jobs.
--16Q Write a SQL query to calculate the Average salary of each employment type.
--17Q Write a SQl query to display the AI job titles, required skils for Real Estate industry.
--18Q Write a SQL query to show the job titles,required skills,Maximum Salary of all AI jobs from all locations except from Germany, China, Ireland, Switzerland.



--1Q.Write a SQl Query to retrieve the ai jobs from the company location USA and Germany.

Select * from ai_jobs
where company_location in ('United States','Germany');


--2Q.Write a SQl Query to retrieve the ai jobs posted in the month of may 2025.

select * 
from ai_jobs
where posting_date between '2025-05-05' and '2025-05-31';
	

--3Q.Write a SQl Query to show the job_title,years_experience,required_skills for the job which has salary greater than 150000 in ascending order.

select job_title,
	required_skills,
	years_experience,
	salary_usd
from ai_jobs
where salary_usd > 150000
order by salary_usd ASC;


--4Q.Write a SQl Query to display the top 10 highest paid AI jobs and company locations.

select job_title,company_location,
	max(salary_usd) As highest_salary
from ai_jobs
group by job_title,company_location
order by highest_salary desc
limit 10;


--5Q.Write a SQl Query to retrive the count of AI jobs that require PHD as education.

select count(*)
from ai_jobs
where education_required = 'PhD';


--6Q.Write a SQL query to list the unique AI job titles.

select distinct(job_title)
from ai_jobs;


--7Q.Write a SQl Query to display all the columns with experience_level has Senior and has experience of more than 6 years.

select * from ai_jobs
where experience_level = 'Senior' 
	and 
	years_experience > 6;


--8Q.Write a SQl Query to show the columns which have application_deadline of 60 days.

select *
from ai_jobs
where (application_deadline - posting_date) > 60;


--9Q.Write a sql query to display the number of AI jobs in different company location.

select company_location,
		count(job_title) as AI_jobs
from ai_jobs
group by company_location
order by AI_jobs desc;


--10Q.Write a sql query to display the Average salary in different company locations.

select company_location, 
	Round(avg(salary_usd),2) as Average_salary
from ai_jobs
group by company_location
order by Average_salary desc;


--11Q. Write a SQL query to display the number of jobs availble for different education.

select education_required, 
		count(*) as Available_jobs
from ai_jobs
group by education_required


--12Q.Write a sql Query to show the Average salary for different experience level.

select experience_level,
	Round(avg(salary_usd)) AS Average_salary
from ai_jobs
group by experience_level;



--13Q Write a SQL query to calculate the Average,minimum and maximum salary range for different education levels.

select education_required, 
		concat(min(salary_usd),'-',max(salary_usd)) as Salary_Range, 
		Round(avg(salary_usd)) as Average_salary
from ai_jobs
group by education_required;


--14Q Write a SQl query to show which industry is hiring more AI talent.

select industry,count(*) As jobs
from ai_jobs
group by industry
order by jobs desc;


--15Q.Write a sql query to show the top demand skills for AI jobs.

select required_skills,max(salary_usd)
from ai_jobs
group by required_skills
limit 5;


--16Q Write a SQL query to calculate the Average salary of each employment type.

select employment_type,
		round(avg(salary_usd)) as salary
from ai_jobs
group by employment_type;


--17Q Write a SQl query to display the AI job titles, required skils for Real Estate industry.

select distinct(job_title),
		required_skills,industry
from ai_jobs
where industry like 'Re% E%';


--18Q Write a SQL query to show the job titles,required skills,Maximum Salary of all AI jobs from all locations except from Germany, China, Ireland, Switzerland.

select job_title,
	required_skills,
	company_location,
	max(salary_usd)as Maximum_salary
from ai_jobs
where company_location not in ('Germany','Ireland','China','Switzerland')
group by job_title,required_skills,company_location
order by company_location asc;



---** End Project **---
		





