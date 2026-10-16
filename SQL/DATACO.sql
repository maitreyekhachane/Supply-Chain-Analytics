CREATE DATABASE DATACO;
USE DATACO;

SELECT * FROM DATACO_DATA;

SELECT COUNT(*) AS TOTAL_RECORDS
FROM dataco_data;
/*
TOTAL_RECORDS
180519
*/

SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM dataco_data;
/*
TOTAL_ORDERS
65752
*/

SELECT COUNT(DISTINCT CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM dataco_data;
/*
TOTAL_CUSTOMERS
20652
*/

SELECT SUM(SALES) AS TOTAL_SALES
FROM dataco_data;
/*
TOTAL_SALES
36784735.0130577
*/

SELECT SUM(ORDER_PROFIT_PER_ORDER) AS TOTAL_PROFIT
FROM DATACO_DATA;
/*
TOTAL_PROFIT
3966902.9739931
*/

SELECT AVG(SALES) AS AVERAGE_SALES_PER_RECORD
FROM dataco_data;
/*
AVERAGE_SALES_PER_RECORD
203.772096084388
*/

SELECT COUNT(Order_Zipcode) FROM dataco_data;

SELECT COUNT(CUSTOMER_ZIPCODE) FROM dataco_data;
/*
Only 3 values are missing, so we retain the column and leave them as null rather than replacing them with misleading values 
or deleting useful location data.
Missing values are retained as null because replacing them with arbitrary values could distort geographic analysis, 
while deleting the column could remove useful delivery-location information.
*/

--YEARLY SALES PER PROFIT
SELECT
    order_year,
    SUM(Sales) AS Total_Sales,
    SUM(Order_Profit_Per_Order) AS Total_Profit
FROM dataco_data
GROUP BY order_year
ORDER BY Order_Year;
/*
Order_Year	Total_Sales	    Total_Profit
2015	   12340831.4307594	1318856.90124704
2016	   12303817.3242435	1310119.07145388
2017	   11808436.1428852	1304085.11131451
2018	   331650.115169525	33841.8899776638
Sales and profit showed a gradual decline from 2015 to 2017.
2018 recorded substantially lower values, likely because the dataset contains fewer records for that year.
Therefore, it should be interpreted cautiously and not compared directly with complete years.
*/

SELECT ORDER_MONTH,SUM(SALES) AS TOTAL_SALES,SUM(ORDER_PROFIT_PER_ORDER) AS TOTAL_PROFIT
FROM dataco_data
GROUP BY order_month
ORDER BY order_month;
/*
ORDER_MONTH	TOTAL_SALES	        TOTAL_PROFIT
1	        3459246.46598244	367127.430613786
2	        2888087.64595604	301061.220929027
3	        3125111.59218407	333727.100646317
4	        3053996.48044014	339021.360053301
5	        3185363.96273613	337878.660261512
6	        3059152.21011162	324742.520718589
7	        3188170.1718998	    348592.480093122
8	        3187032.11297417	360210.470625505
9	        3164510.74751282	359315.040243223
10	        3171278.98986721	331987.009965383
11	        2703624.76533127	281757.810284019
12	        2599159.86806202	281481.869559318

* January recorded the highest sales (3.46M) and profit (367.13K).
* December recorded the lowest sales (2.60M), while December and November had the lowest monthly profits.
* Sales remained relatively stable between March and October, with some month-to-month variation.
*/

SELECT
    Order_Quarter,
    SUM(Sales) AS Total_Sales,
    SUM(Order_Profit_Per_Order) AS Total_Profit
FROM dataco_data
GROUP BY Order_Quarter
ORDER BY Order_Quarter;
/*
Order_Quarter	Total_Sales	        Total_Profit
1	            9472445.70412254	1001915.75218913
2	            9298512.65328789	1001642.5410334
3	            9539713.03238678	1068117.99096185
4	            8474063.6232605	    895226.689808719

* Q3 recorded the highest sales (9.54M) and profit (1.07M).
* Q4 recorded the lowest sales (8.47M) and profit (0.90M).
* Q1 and Q2 showed similar performance.
* The results indicate stronger performance in Q3 and weaker performance in Q4
*/

SELECT
    Market,
    SUM(Sales) AS Total_Sales,
    SUM(Order_Profit_Per_Order) AS Total_Profit,
    COUNT(DISTINCT Order_Id) AS Total_Orders
FROM dataco_data
GROUP BY Market
ORDER BY Total_Sales DESC;
/*
Market	      Total_Sales	    Total_Profit	    Total_Orders
Europe	      10872396.7955751	1169442.96097703	18561
LATAM	      10277612.8408318	1123321.61147487	17181
Pacific Asia  8273743.74056339	857753.441097483	17577
USCA	      5066528.7109108	564313.780372769	8579
Africa	      2294452.92517662	252071.180070952	3854

* Europe recorded the highest sales (10.87M) and profit (1.17M), followed by LATAM.
* Pacific Asia recorded more orders than LATAM despite generating lower total sales.
* Africa recorded the lowest sales, profit, and order count.
*/


SELECT
    Category_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Order_Profit_Per_Order) AS Total_Profit,
    COUNT(DISTINCT Order_Id) AS Total_Orders
FROM dataco_data
GROUP BY Category_Name
ORDER BY Total_Sales DESC;
/*

* Fishing generated the highest sales (6.93M) and profit (756.22K).
* Cleats recorded the highest number of distinct orders (20,386).
* Camping & Hiking and Cardio Equipment were also major contributors to sales and profit.
* Strength Training showed a comparatively low profit relative to its sales.
*/

SELECT
    Customer_Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Order_Profit_Per_Order) AS Total_Profit,
    COUNT(DISTINCT Order_Id) AS Total_Orders,
    COUNT(DISTINCT Customer_Id) AS Total_Customers
FROM dataco_data
GROUP BY Customer_Segment
ORDER BY Total_Sales DESC;
/*
Customer_Segment	Total_Sales	        Total_Profit	    Total_Orders	Total_Customers
Consumer	        19095790.1550055	2073487.67188986	34119	        10695
Corporate	        11168406.8428955	1202574.96148442	19856	        6239
Home Office	        6520538.01515675	690840.340618819	11777	        3718

* The Consumer segment generated the highest sales (19.10M) and profit (2.07M).
* Corporate ranked second, while Home Office contributed the lowest sales and profit.
* Consumer also had the highest number of distinct customers (10,695).
*/

SELECT
    Delivery_Status,
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Order_Id) AS Total_Orders
FROM dataco_data
GROUP BY Delivery_Status
ORDER BY Total_Records DESC;

SELECT
    Delivery_Status,
    COUNT(*) AS Total_Records,
    CAST(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER () AS DECIMAL(5,2)
    ) AS Percentage
FROM dataco_data
GROUP BY Delivery_Status
ORDER BY Total_Records DESC;
/*
Delivery_Status	Total_Records	Total_Orders  
Late delivery	    98977	    36048
Advance shipping	41592	    15127
Shipping on time	32196	    11722
Shipping canceled	7754	    2855

Percentage
54.83
23.04
17.84
4.30
* Late delivery was the most common status, representing approximately 54.8% of all records.
* Advance shipping represented approximately 23.0%, while on-time shipping represented approximately 17.8%.
* Shipping cancellations accounted for approximately 4.3% of records.
*/

SELECT
    Shipping_Mode,
    COUNT(*) AS Total_Records,
    SUM(CASE
        WHEN Delivery_Status = 'Late delivery' THEN 1
        ELSE 0
    END) AS Late_Delivery_Records,
    CAST(
        100.0 * SUM(CASE
            WHEN Delivery_Status = 'Late delivery' THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS Late_Delivery_Percentage
FROM dataco_data
GROUP BY Shipping_Mode
ORDER BY Late_Delivery_Percentage DESC;
/*
Shipping_Mode	Total_Records	Late_Delivery_Records	Late_Delivery_Percentage
First Class	    27814	        26513	                95.32
Second Class	35216	        26987	                76.63
Same Day	    9737	        4454	                45.74
Standard Class	107752	        41023	                38.07

* First Class recorded the highest late-delivery rate (95.32%), followed by Second Class (76.63%).
* Standard Class had the lowest late-delivery rate (38.07%) and the highest record volume.
*/

SELECT
    Order_Status,
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Order_Id) AS Total_Orders
FROM dataco_data
GROUP BY Order_Status
ORDER BY Total_Records DESC;
/*
Order_Status	Total_Records	Total_Orders
COMPLETE	        59491	    21716
PENDING_PAYMENT 	39832	    14382
PROCESSING	        21902	    7901
PENDING	            20227	    7321
CLOSED	            19616	    7249
ON_HOLD	            9804	    3624
SUSPECTED_FRAUD	    4062	    1488
CANCELED	        3692	    1367
PAYMENT_REVIEW	    1893	    704

* COMPLETE was the most common status, with 21,716 distinct orders, followed by PENDING_PAYMENT with 14,382.
* The dataset also contained canceled orders and orders marked as suspected fraud.
* Orders in pending, processing, and on-hold states may require further investigation.
* Record counts and distinct order counts differ because an order can contain multiple item records.
*/

SELECT
    COUNT(*) AS Total_Records,
    SUM(CASE
        WHEN Order_Profit_Per_Order < 0 THEN 1
        ELSE 0
    END) AS Negative_Profit_Records,
    CAST(
        100.0 * SUM(CASE
            WHEN Order_Profit_Per_Order < 0 THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS Negative_Profit_Percentage
FROM dataco_data;
/*
Total_Records	Negative_Profit_Records	Negative_Profit_Percentage
180519	                33784	                18.71

* Out of 180,519 records, 33,784 (18.71%) had negative profit.
* This indicates that a notable share of records is loss-making.
*/

SELECT
    Category_Name,
    COUNT(*) AS Negative_Profit_Records,
    SUM(Order_Profit_Per_Order) AS Total_Profit
FROM dataco_data
WHERE Order_Profit_Per_Order < 0
GROUP BY Category_Name
ORDER BY Negative_Profit_Records DESC;
/*
Cleats	4590	-452594.210420907
* Cleats had the highest number of negative-profit records (4,590).
* Fishing had the largest combined loss among negative-profit records, approximately 728.57K.
* Camping & Hiking and Cardio Equipment also showed substantial combined losses among negative-profit records.
*/

SELECT
    Shipping_Mode,
    AVG([Days_for_shipping_real]) AS Avg_Actual_Shipping_Days,
    AVG([Days_for_shipment_scheduled]) AS Avg_Scheduled_Shipping_Days
FROM dataco_data
GROUP BY Shipping_Mode
ORDER BY Avg_Actual_Shipping_Days DESC;
/*
Shipping_Mode	Avg_Actual_Shipping_Days	Avg_Scheduled_Shipping_Days
Standard Class	3	                        4
Second Class	3	                        2
First Class	    2	                        1
Same Day	    0	                        0
First Class and Second Class take approximately one day longer than their scheduled shipping times on average.
Standard Class takes approximately one day less than its scheduled time, on average.
*/

SELECT
    Shipping_Mode,
    AVG([Shipping_delay_days]) AS Avg_Shipping_Delay_Days
FROM dataco_data
GROUP BY Shipping_Mode
ORDER BY Avg_Shipping_Delay_Days DESC;
/*
Shipping_Mode	Avg_Shipping_Delay_Days
First Class	    1
Second Class	1
Same Day	    0
Standard Class	0
First Class and Second Class have the highest average shipping delay, at approximately one day.
Same Day and Standard Class average zero delay days.
These results are consistent with the earlier finding that First Class and Second Class have higher late-delivery percentages.
Because the averages are rounded to whole days, a reported zero does not necessarily mean there were no delays.
*/

SELECT
    Category_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Order_Profit_Per_Order) AS Total_Profit,
    CAST(
        100.0 * SUM(Order_Profit_Per_Order)
        / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage
FROM dataco_data
GROUP BY Category_Name
ORDER BY Profit_Margin_Percentage DESC;
/*
Golf Bags & Carts has the highest profit margin at 17.46%, but its sales are relatively low at approximately 10.37K.
A high margin doesn't automatically mean a high overall profit contribution.
Fishing generates the highest total sales and profit among categories, with a profit margin of 10.91%.
Strength Training has a very low margin of 0.61% despite generating approximately 54.90K in sales.
This category deserves further investigation into discounts, costs, and pricing.
As Seen on TV! also has a relatively low margin of 3.47%.
*/

SELECT TOP 10
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Order_Profit_Per_Order) AS Total_Profit
FROM dataco_data
GROUP BY Product_Name
ORDER BY Total_Sales DESC;
/*
Field & Stream Sportsman 16 Gun Fire Safe leads the results in both total sales and total profit.
Several other products also contribute substantial sales and profit.
*/

SELECT
    Order_Item_Discount_Rate,
    COUNT(*) AS Total_Records
FROM dataco_data
GROUP BY Order_Item_Discount_Rate
ORDER BY Order_Item_Discount_Rate;
SELECT
    Order_Item_Discount_Rate,
    SUM(Sales) AS Total_Sales,
    SUM(Order_Profit_Per_Order) AS Total_Profit
FROM dataco_data
GROUP BY Order_Item_Discount_Rate
ORDER BY Order_Item_Discount_Rate;

SELECT
    ROUND(Order_Item_Discount_Rate * 100, 0)
        AS Discount_Percentage,

    ROUND(
        SUM(Order_Profit_Per_Order) * 100.0
        / NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percentage

FROM dataco_data

GROUP BY Order_Item_Discount_Rate

ORDER BY Order_Item_Discount_Rate;
/*
The 0% discount group recorded the highest profit margin at 13.09%.
The 20% discount group recorded the lowest profit margin at 8.67%.
Profit margins generally decreased as discount rates increased, although some fluctuations occurred.
*/


WITH MonthlySales AS (
    SELECT
        Order_Year,
        Order_Month,
        SUM(Sales) AS Total_Sales
    FROM dataco_data
    GROUP BY
        Order_Year,
        Order_Month
),
PreviousMonth AS (
    SELECT
        Order_Year,
        Order_Month,
        Total_Sales,
        LAG(Total_Sales) OVER (
            ORDER BY Order_Year, Order_Month
        ) AS Previous_Month_Sales
    FROM MonthlySales
)
SELECT
    Order_Year,
    Order_Month,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(Previous_Month_Sales, 2) AS Previous_Month_Sales,
    ROUND(
        (Total_Sales - Previous_Month_Sales) * 100.0
        / NULLIF(Previous_Month_Sales, 0),
        2
    ) AS Growth_Percentage
FROM PreviousMonth
ORDER BY Order_Year, Order_Month;
/*
The largest monthly sales increase was 13.40% in March 2015.
The largest monthly decrease was 41.63% in November 2017.
Sales continued to decline in December 2017.
*/

--count of late delivery market wise
SELECT
    Market,
    Delivery_Status,
    COUNT(DISTINCT Order_Id) AS Total_Orders
FROM dataco_data
GROUP BY
    Market,
    Delivery_Status
ORDER BY
    Market,
    Delivery_Status;



SELECT
    Market,
    COUNT(DISTINCT Order_Id) AS Total_Orders,
    COUNT(DISTINCT CASE
        WHEN Delivery_Status = 'Late delivery'
        THEN Order_Id
    END) AS Late_Orders,
    CAST(
        100.0 * COUNT(DISTINCT CASE
            WHEN Delivery_Status = 'Late delivery'
            THEN Order_Id
        END)
        / COUNT(DISTINCT Order_Id)
        AS DECIMAL(5,2)
    ) AS Late_Delivery_Percentage
FROM dataco_data
GROUP BY Market
ORDER BY Late_Delivery_Percentage DESC;

--customer purchasing frequency

SELECT
    Customer_Id,
    COUNT(DISTINCT Order_Id) AS Total_Orders
FROM dataco_data
GROUP BY Customer_Id;

WITH CustomerOrders AS (
    SELECT
        Customer_Id,
        COUNT(DISTINCT Order_Id) AS Total_Orders
    FROM dataco_data
    GROUP BY Customer_Id
)
SELECT
    CASE
        WHEN Total_Orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers
FROM CustomerOrders
GROUP BY
    CASE
        WHEN Total_Orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END;

WITH ProductSales AS (
    SELECT
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM dataco_data
    GROUP BY Product_Name
),
ProductRanking AS (
    SELECT
        Product_Name,
        Total_Sales,
        SUM(Total_Sales) OVER (
            ORDER BY Total_Sales DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS Cumulative_Sales,
        SUM(Total_Sales) OVER () AS Overall_Sales
    FROM ProductSales
)
SELECT
    Product_Name,
    Total_Sales,
    ROUND(
        Total_Sales * 100.0 / Overall_Sales, 2
    ) AS Sales_Percentage,
    ROUND(
        Cumulative_Sales * 100.0 / Overall_Sales, 2
    ) AS Cumulative_Sales_Percentage
FROM ProductRanking
ORDER BY Total_Sales DESC;
/*
Sales concentration: A relatively small group of products contributes a large share of sales.
Top product: The Field & Stream Sportsman 16 Gun Fire Safe contributes 18.84% of total sales,
making it the leading product in this result.
*/
