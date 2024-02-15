use case_study_1;

#Data Clensing solution

select *
from weekly_sales limit 10;

create table clean_weekly_sales as
select week_date, week(week_date) 'week_number', month(week_date) 'month_number', year(week_date) 'calender_year', region, platform, 
case 
	when segment = null then 'Unknown'
    else segment
    end as segment,
case 
	when right(segment, 1) = '1' then 'Young Adults'
    when right(segment, 1) = '2' then 'Middle Aged'
    when right(segment, 1) in ('3', '4') then 'Retirees'
    else 'Unknown'
    end as age_band,

case
	when left(segment, 1) = 'C' then 'Couples'
    when left(segment, 1) = 'F' then 'Family'
    else 'Unknown'
    end as demographic,
customer_type, transactions, sales, round(sales/transactions, 2) 'avg_transactions'
from weekly_sales;

select * from clean_weekly_sales limit 10;

#Data Exploration questions solutions

# 1. Which week numbers are missing from the dataset?

create table seq100(x int auto_increment primary key);

insert into seq100 values (), (), (), (), (), (), (), (), (), ();
insert into seq100 values (), (), (), (), (), (), (), (), (), ();
insert into seq100 values (), (), (), (), (), (), (), (), (), ();
insert into seq100 values (), (), (), (), (), (), (), (), (), ();
insert into seq100 values (), (), (), (), (), (), (), (), (), ();
insert into seq100 select x+50 from seq100;

select * from seq100;

create table seq52 as (select x 'weeks' from seq100 limit 52);

select * from seq52;

select distinct(weeks) 'week_day' 
from seq52
where weeks not in ( select distinct week_number from clean_weekly_sales);

select distinct week_number 
from clean_weekly_sales
order by week_number;

# 2. How many total transactions were there for each year in the dataset?

select calender_year, sum(transactions) 'Total_transactions' 
from clean_weekly_sales group by calender_year;

# 3. What are the total sales for each year and each month

select region, month_number, sum(sales) 'Total_sales'
from clean_weekly_sales
group by month_number, region;

# 4. What is the total of transactions for each platform

select platform, sum(transactions) 'Total_transactions'
from clean_weekly_sales
group by platform;

# 5. What is the percentange of sales for retail on each month
with cte_monthly_platform_sales as 
(select month_number, calender_year, platform, sum(sales) 'monthly_sales'
from clean_weekly_sales
group by month_number, calender_year, platform)

select month_number, calender_year, 
round(100*max(case when platform = 'Retail' then monthly_sales else null end)/sum(monthly_sales),2) 'Retail_percentage', 
round(100*max(case when platform = 'Shopify' then monthly_sales else null end)/sum(monthly_sales),2) 'Shopify_percentage'
from cte_monthly_platform_sales
group by month_number, calender_year;

# 6. What is the percentage of sales by demographic for each year in the dataset?

select calender_year, demographic, sum(sales) 'Yearly_sales', round(100*sum(sales)/sum(sum(sales)) over(partition by demographic),2) 'Percentage'
from clean_weekly_sales
group by calender_year, demographic;

# 7. Which age_band and demographic values contribute the most Reatil sales?

select age_band, demographic, sum(sales) 'Total_sales'
from clean_weekly_sales
where platform='Retail'
group by age_band, demographic
order by total_sales desc; 