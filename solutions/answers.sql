-- 1. Display all properties in the database.
select * from property24.project.housing;

-- 2. Show only the CITY, PROVINCE, and PROPERTY_PRICE columns.
select city, province, property_price from property24.project.housing;

-- 3. List all distinct provinces in the table.
select distinct province from property24.project.housing;

-- 4. Find all properties located in Gauteng.
select * from property24.project.housing where province = 'Gauteng'

-- 5. Show properties priced under R1,500,000.
select * from property24.project.housing where property_price < 1500000;

-- 6. List properties with more than 3 bedrooms.
select * from property24.project.housing where bedrooms >3;

-- 7. Find properties with parking for at least 2 cars.
select * from property24.project.housing where parking >=2;

-- 8. Show properties where the monthly repayment is greater than R25,000.
select * from property24.project.housing where monthly_repayment > 25000;

-- 9. Show all properties ordered by property price from highest to lowest.
select * from property24.project.housing order by property_price desc;

-- 10. List properties ordered by floor size from smallest to largest.
select * from property24.project.housing order by floor_size asc;

-- 11. Show Gauteng properties ordered by monthly repayment.
select * from property24.project.housing where province = 'Gauteng' order by monthly_repayment asc;

-- 12. Find Western Cape properties priced below R3,000,000.
select * from property24.project.housing where province = 'Western Cape' and property_price < 3000000;

-- 13. Show KwaZulu-Natal properties with 3 or more bedrooms.
select * from property24.project.housing where province = 'KwaZulu-Natal' and bedrooms >= 3;

-- 14. Find properties in Limpopo or Free State ordered by property price.
select * from property24.project.housing where province in ('Limpopo', 'Free State') order by property_price;

-- 15. Show the 10 most expensive properties.
select * from property24.project.housing order by property_price desc limit 10;

-- 16. Show the 5 cheapest properties.
select * from property24.project.housing order by property_price asc limit 5;

-- 17. Show the top 10 properties with the largest floor size.
select * from property24.project.housing order by floor_size desc limit 10;

-- 18. Which province appears to have the highest priced properties?
select province, avg(property_price) as avg_price 
from property24.project.housing group by province order by avg_price desc limit 1;

-- 19. Which cities appear to have the most affordable housing?
select city, avg(property_price) as avg_price from property24.project.housing
group by city order by avg_price desc limit 5;

-- 20. What minimum income is typically required for properties priced above R4,000,000?
select min(min_gross_monthly_income) from property24.project.housing where property_price > 4000000;