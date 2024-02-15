create database case_study_2;

use case_study_2;

# 1. How many different nodes make up the Data Bank network?

select count(distinct node_id) 'Unique_nodes'
from customer_nodes;

# 2. How many nodes are there in each regions?

select region_id, count(node_id) 'Node_count'
from customer_nodes
inner join regions using (region_id)
group by region_id;

# 3. How many customers are divided amoung the regions?

select region_id, count(distinct customer_id) 'Cutomers'
from customer_nodes
inner join regions using (region_id)
group by region_id;

# 4. Determine the total amount of transactions for each region name.

select r.region_name, sum(ct.txn_amount) 'Total Transaction Amount'
from regions r, customer_nodes cn, customer_transactions ct
where r.region_id = cn.region_id and cn.customer_id = ct.customer_id
group by region_name;

# 5. How long does it take on an average to move clients to a new node?

select round(avg(datediff(end_date, start_date)),2) 'Avg_days'
from customer_nodes
where end_date != '9999-12-31';

# 6. What is the unique count and total amount for each transaction type?

select txn_type, count(*) 'Unique_count', sum(txn_amount) 'Total_amount'
from customer_transactions
group by txn_type;

# 7. What is the average number and size of past deposits across all customers?

select round(count(customer_id)/(select count(distinct customer_id)
from customer_transactions)) 'Average Deposite Amount'
from customer_transactions
where txn_type = 'deposit';

-- 8. For each month - how many Data Bank customers make more than 1 deposit and at least either 1 purchase or 1 
--   withdrawal in a single month?

with transaction_count_per_month as(select customer_id, month(txn_date) 'Transaction_month',
sum(if(txn_type='deposit',1,0)) 'Deposite_Count', sum(if(txn_type='withdrawal',1,0)) 'Withdrawal_Count', 
sum(if(txn_type='purchase',1,0)) 'Purchase_Count'
from customer_transactions
group by customer_id, month(txn_date))

select Transaction_month, count(distinct customer_id) 'Coustomer Count'
from transaction_count_per_month
where Deposite_Count > 1 and Purchase_Count = 1 or Withdrawal_Count = 1
group by Transaction_month;