



## **Case Study 1 (Job Data)**
### ***Below is the structure of the table with the definition of each column that you must work on:***

## Table-1: job_data
- job_id: unique identifier of jobs
- actor_id: unique identifier of actor
- event: decision/skip/transfer
- language: language of the content
- time_spent: time spent to review the job in seconds
- org: organization of the actor
- ds: date in the yyyy/mm/dd format. It is stored in the form of text and we use presto to run. no need for date function

### Answer the Following
1. Number of jobs reviewed: Amount of jobs reviewed over time.
    - *Your task: Calculate the number of jobs reviewed per hour per day for November 2020?*
2. Throughput: It is the no. of events happening per second.
    - *Your task: Let’s say the above metric is called throughput. Calculate 7 day rolling average of throughput? For throughput, do you prefer daily metric or 7-day rolling and why?*
3. Percentage share of each language: Share of each language for different contents.
    - *Your task: Calculate the percentage share of each language in the last 30 days?*
4. Duplicate rows: Rows that have the same value present in them.
    - *Your task: Let’s say you see some duplicate rows in the data. How will you display duplicates from the table?*
   
