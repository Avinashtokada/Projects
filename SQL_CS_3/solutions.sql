create database case_study_3;

use case_study_3;

# 1. What was the total quantity sold for all products?

select pd.product_name, sum(s.qty) 'Sales_count'
from sales s 
inner join product_details pd on s.prod_id=pd.product_id
group by pd.product_name
order by Sales_count desc;

# 2. What is the total generated revenue for all products before discounts?

select sum(price*qty) 'Revenue Before Discount'
from sales;

# 3. What was the total discount amount for all products?

select sum(price*qty*discount)/100 'Total Discount'
from sales;

# 4. How many unique transactions were there?

select count(distinct txn_id) 'Unique txn'
from sales;

# 5. What are the average unique products purchased in each transaction?

with cte_txn_prod as 
(select txn_id, count(distinct prod_id) 'Prod_count'
from sales
group by txn_id)
select round(avg(Prod_count)) 'avg_uniqe_txn'
from cte_txn_prod;

# 6. What is the average discount value per transaction?

with cte_txn_discount as 
(select txn_id, sum(price*qty*discount)/100 'Total_discount'
from sales
group by txn_id)
select round(avg(Total_discount)) 'avg_discount'
from cte_txn_discount;

# 7. What is the average revenue for member transactions and non memeber transactions?

with cte_member_revenue as
(select member, txn_id, sum(price*qty) 'Revenue'
from sales
group by member, txn_id)

select member, round(avg(Revenue),2) 'avg_revenue'
from cte_member_revenue
group by member;

# 8. What are the top 3 products by total revenue before discount?

select pd.product_name, sum(qty*s.price) 'no_discount_revenue'
from sales s 
inner join product_details pd on s.prod_id = pd.product_id
group by pd.product_name
order by no_discount_revenue desc
limit 3;

# 9. What are the total quantity, revenue, and discount for each segment?

select pd.segment_id, pd.segment_name, sum(s.qty) 'Total_quantity', 
sum(s.qty*s.price) 'Total_revenue', sum(s.qty*s.price*s.discount)/100 'Total_discount'
from sales s 
inner join product_details pd on s.prod_id = pd.product_id
group by pd.segment_id, pd.segment_name;

# 10. What is the top selling product for each segment?

select pd.segment_id, pd.segment_name, pd.product_id, pd.product_name, 
sum(s.qty) 'Product_quantity'
from sales s 
inner join product_details pd on s.prod_id = pd.product_id
group by pd.segment_id, pd.segment_name, pd. product_id, pd.product_name
order by product_quantity desc 
limit 5;

# 11. What are the total quantity, revenue, and discount for each category?

select pd.category_id, pd.category_name, sum(s.qty) 'Total_quantity', 
sum(s.qty*s.price) 'Total_revenue', sum(s.qty*s.price*s.discount)/100 'Total_discount'
from sales s 
inner join product_details pd on s.prod_id = pd.product_id
group by pd.category_id, pd.category_name;

# 12. What is the top selling product for each category?

select pd.category_id, pd.category_name, pd.product_id, pd.product_name, 
sum(s.qty) 'Product_quantity'
from sales s 
inner join product_details pd on s.prod_id = pd.product_id
group by pd.category_id, pd.category_name, pd. product_id, pd.product_name
order by product_quantity desc 
limit 5;