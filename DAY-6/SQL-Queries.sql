/*
Sample table: Salesman

salesman_id  name        city        commission
-----------  ----------  ----------  ----------
5001         James Hoog  New York    0.15
5002         Nail Knite  Paris       0.13
5005         Pit Alex    London      0.11
5006         Mc Lyon     Paris       0.14
5003         Lauson Hen  San Jose    0.12
5007         Paul Adam   Rome        0.13

Sample table: Orders Business & Productivity Software

ord_no      purch_amt   ord_date    customer_id  salesman_id
----------  ----------  ----------  -----------  -----------
70001       150.5       2012-10-05  3005         5002
70009       270.65      2012-09-10  3001         5005
70002       65.26       2012-10-05  3002         5001
70004       110.5       2012-08-17  3009         5003
70007       948.5       2012-09-10  3005         5002
70005       2400.6      2012-07-27  3007         5001
70008       5760        2012-09-10  3002         5001
70010       1983.43     2012-10-10  3004         5006
70003       2480.4      2012-10-10  3009         5003
70012       250.45      2012-06-27  3008         5002
70011       75.29       2012-08-17  3003         5007
70013       3045.6      2012-04-25  3002         5001

I. Write a SQL Query to find all the orders issued by salesman "Paul Adam".

II. Write a SQL Query to find all the orders issued by salesman from "London".

III. Write a SQL Query to find all the orders issued by salesman who has sold to customer with id 3007.

IV. Write a SQL Query to display all the orders exceeding average value of orders on 10 october 2012.

V. Write a SQL Query to display all the orders generated in New York city.
*/


/*
===============================================================================
I. FIND ALL ORDERS ISSUED BY SALESMAN "PAUL ADAM"
===============================================================================
*/

SELECT s.salesman_id, s.name, o.ord_no, o.purch_amt, o.ord_date 
FROM Salesman s
JOIN Orders o ON s.salesman_id = o.salesman_id
WHERE s.name = 'Paul Adam';


/*
===============================================================================
II. FIND ALL ORDERS ISSUED BY SALESMAN FROM "LONDON"
===============================================================================
*/

SELECT s.salesman_id, s.name, o.ord_no, o.purch_amt, o.ord_date 
FROM Salesman s
JOIN Orders o ON s.salesman_id = o.salesman_id
WHERE s.city = 'London';


/*
===============================================================================
III. FIND ALL ORDERS ISSUED BY SALESMAN WHO SOLD TO CUSTOMER 3007
===============================================================================
*/

SELECT s.salesman_id, s.name, o.ord_no, o.purch_amt, o.ord_date 
FROM Salesman s
JOIN Orders o ON s.salesman_id = o.salesman_id
WHERE s.salesman_id IN (
    SELECT salesman_id
    FROM orders
    WHERE customer_id = 3007
);


/*
===============================================================================
IV. FIND ALL ORDERS EXCEEDING THE AVERAGE VALUE OF ORDERS
    ON 10 OCTOBER 2012
===============================================================================
-- The average is calculated ONLY from orders placed on 2012-10-10.
*/

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE purch_amt > (
    SELECT AVG(purch_amt) 
    FROM Orders
    WHERE ord_date = '2012-10-10'
);


/*
===============================================================================
V. FIND ALL ORDERS GENERATED IN NEW YORK CITY
===============================================================================
*/

SELECT s.salessman_id, s.name, o.ord_no, o.purch_amt, o.ord_date 
FROM Salesman s
JOIN Orders o ON s.salesman_id = o.salesman_id
WHERE s.city = 'New York';