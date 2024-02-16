Texture Tales Clothing Company takes pride in offering an optimized range of clothing and lifestyle wear tailored for the modern adventurer. The CEO of this trendy fashion company is seeking your assistance to help our merchandising teams analyze their sales performance and generate a basic financial report to share with the broader business.

Schemas:

product_details                sales                      product_prices            product_hierarchy
product_id     varchar         prod_id        varchar     id          int           id           int
price          int             qty            int         product_id  varchar       product_id   int
product_name   varchar         price          int         price       int           price        int
category_id    int             discount       int                                   start_date   date
segment_id     int             member         varchar                               end_date     date
style_id       int             txn_id         varchar
category_name  varchar         start_txn_time varchar
segment_name   varchar
style_name     varchar

Here are the questions you need to address in this case study:

1. What was the total quantity sold for all products?
2. What is the total generated revenue for all products before discounts?
3. What was the total discount amount for all products?
4. How many unique transactions were there?
5. What is the average number of unique products purchased in each transaction?
6. What is the average discount value per transaction?
7. What is the average revenue for member transactions and non-member transactions?
8. What are the top 3 products by total revenue before discount?
9. What are the total quantity, revenue, and discount for each segment?
10. What is the top-selling product for each segment?
11. What are the total quantity, revenue, and discount for each category?
12. What is the top-selling product for each category?