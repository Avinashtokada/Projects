Using this dummy dataset, let's assume that your manager has tasked you with the following:

You have been assigned the task of analyzing sales and performance data for our latest venture, Data Mart. In June 2020, Data Mart underwent significant supply changes, transitioning all products to sustainable packaging methods across the entire supply chain, from farm to customer. Your objective is to evaluate the impact of this change on Data Mart's sales performance across various business segments.

Schema:

Column name	Data type
week_date	date
region	        varchar(20)
platform	varchar(20)
segment	        varchar(10)
customer	varchar(20)
transactions	int
sales	        int

Perform the following Data Cleansing operations in a single query to generate a new table in the data_mart schema named clean_weekly_sales:

1) Add a week_number as the second column for each week_date value. For example, any value from the 1st of January to the 7th of January will be assigned 1, while the 8th to 14th will be assigned 2, and so forth.
2) Include a month_number column representing the calendar month for each week_date value as the third column.
3) Introduce a calendar_year column as the fourth column, containing values of 2018, 2019, or 2020.
4) Append a new column called age_band after the original segment column, applying the following mapping to the number inside the segment value.
segment	age_band
1	Young Adults
2	Middle Aged
3 or 4	Retirees

5) Incorporate a new demographic column using the following mapping for the first letter in the segment values:
segment | demographic |
C       | Couples |
F       | Families |
6) Replace all null string values in the original segment column, as well as the new age_band and demographic columns, with the string value "unknown".
7) Create a new column named avg_transaction, calculated as the sales value divided by transactions, rounded to 2 decimal places, for each record.

Write queries for the following questions:

1) Determine the week numbers missing from the dataset.
2) Calculate the total number of transactions for each year in the dataset.
3) Aggregate the total sales for each region for each month.
4) Calculate the total count of transactions for each platform.
5) Compute the percentage of sales for Retail vs Shopify for each month.
6) Determine the percentage of sales by demographic for each year in the dataset.
7) Identify the age_band and demographic values that contribute the most to Retail sales.