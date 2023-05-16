create database operation_analytics;

use operation_analytics;

/*Case Study 1 (Job Data)*/

create table job_data(
job_id int,
actors_id int,
event varchar(255),
language varchar(255),
time_spent int,
org varchar(255),
ds date);

select * from job_data;

INSERT INTO job_data (ds, job_id, actors_id, event, language, time_spent, org)
VALUES ('2020-11-30', 21, 1001, 'skip', 'English', 15, 'A'),
       ('2020-11-30', 22, 1006, 'transfer', 'Arabic', 25, 'B'),
       ('2020-11-29', 23, 1003, 'decision', 'Persian', 20, 'C'),
       ('2020-11-28', 23, 1005,'transfer', 'Persian', 22, 'D'),
       ('2020-11-28', 25, 1002, 'decision', 'Hindi', 11, 'B'),
       ('2020-11-27', 11, 1007, 'decision', 'French', 104, 'D'),
       ('2020-11-26', 23, 1004, 'skip', 'Persian', 56, 'A'),
       ('2020-11-25', 20, 1004, 'transfer', 'Italian', 45, 'C');
       
/* Ensure that all the data is being added.*/

select * from job_data;
    
/*Number of jobs reviewed: Amount of jobs reviewed over time.
 Task: Calculate the number of jobs reviewed per hour per day for November 2020?*/

select ds as Dates, 
round((count(job_id))/sum(time_spent)*3600) as num_jobs_reviewed
from job_data
where 
ds between '2020-11-01' and '2020-11-30'
group by ds;

	# insight: maximum number of jobs were reviewed on 28/11/2020

/*Throughput: It is the no. of events happening per second.
Task: Let’s say the above metric is called throughput. 
Calculate 7 day rolling average of throughput? 
For throughput, do you prefer daily metric or 7-day rolling and why?*/

# weekly throughput
	select round(count(event)/sum(time_spent),2) as " Weekly throughput"
	from job_data;
    
#daily throughput
	select ds as "Date", round(count(event)/sum(time_spent),2) as " Daily throughput"
	from job_data
	group by date
	order by date;

	# insight: Daily metrics would be preferred over weekly throughput, as the pattern of fluctuation would be more widely identified  in daily.

/*Percentage share of each language: Share of each language for different contents.
Your task: Calculate the percentage share of each language in the last 30 days?*/

select language as Languages,round( 100* count(*)/ total,2) as Perccentage
from job_data
cross join (select count(*) as total from job_data) sub
group by languages;

	# insight: Persian language has the highest share with 37.50%


/*Duplicate rows: Rows that have the same value present in them.
Your task: Let’s say you see some duplicate rows in the data. 
           How will you display duplicates from the table?*/

select actors_id, count(*) as Duplicates
from job_data
group by actors_id
having count(*)>1;

	# insight: Actor ID 1004 has duplicate rows