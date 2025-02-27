/*## Question 13 (LEAD/LAG Analysis)
Analyze inventory changes by comparing:
- Current quantity with previous month
- Current quantity with next month
- Percentage change from previous
- Projected next month change
For each product in a specific warehouse.

Expected Output:
```
product_name    | current_qty | prev_month_qty | next_month_qty | pct_change | projected_change
----------------|-------------|----------------|----------------|------------|------------------
Wireless Earbuds| 150         | 120            | 180            | +25%       | +20%
Gaming Mouse    | 200         | 180            | 220            | +11%       | +10%
Smart Watch     | 175         | NULL           | 160            | NULL       | -8.5%
```
*/