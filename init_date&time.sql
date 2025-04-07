-- SQL DATE AND TIME FUNCTIONS 

-- Part Extraction 

SELECT 
  YEAR(order_date) AS order_year,
  MONTH(order_date) AS order_month,
  DAY(order_date) AS order_day,
  HOUR(order_date) AS order_hour,
  MINUTE(order_date) AS order_minute,
  SECOND(order_date) AS order_second,
  QUARTER(order_date) AS order_quarter,
  WEEK(order_date) AS order_week
FROM orders;

DATEPART 
