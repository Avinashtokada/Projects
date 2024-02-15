Neo-Banks represent a modern evolution in the financial sector, functioning exclusively online. Recognizing the potential synergy between the digital realm, these innovative institutions, and cryptocurrencies, I embarked on a new venture: Data Bank. In this project, customers of Data Bank are allocated cloud data storage corresponding to their account balances. However, this innovative business model presents unique challenges. To address these, the Data Bank team seeks assistance in metrics calculations, business expansion strategies, and sophisticated data analysis. This case study is centered on leveraging insights from data analysis to refine estimations and strategize effectively for the future.


Schemas:

regions                                     customer_transactions                    customer_nodes                        
region_id	int                         customer_id	  int                        customer_id   int            
region_name	varchar                     txn_date	  date                       region_id	   int
                                            txn_type	  varchar                    node_id	   int
                                            txn_amount	  int                        start_date	   date
                                                                                     end_date	   date

Here are the questions you need to address in this case study:

1. What is the total number of nodes comprising the Data Bank network?
2. How many nodes are located in each region?
3. How are the customers distributed among the regions?
4. Calculate the total amount of transactions for each region.
5. What is the average duration required to transfer clients to a new node?
6. Determine the unique count and total amount for each transaction type.
7. What are the average number and size of previous deposits across all customers?
8. For each month, how many Data Bank customers initiate more than one deposit and either one purchase or one withdrawal within a single month?


