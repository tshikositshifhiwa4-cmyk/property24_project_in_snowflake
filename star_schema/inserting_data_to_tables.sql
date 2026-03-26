use database property24;
use schema project;

select * from housing;

--dim_location
insert into dim_location
select distinct
    row_number() over (order by city, province) as location_id,
    city,
    province
from housing;

--dim_property_features
insert into dim_property_features
select distinct
    row_number() over (order by bedrooms, parking) as feature_id,
    bedrooms,
    parking
from housing;

--dim_price_category
insert into dim_price_category
select 
    row_number() over (order by price_category) as price_category_id,
    price_category
from (
    select distinct
        case 
            when property_price < 1000000 then 'low'
            when property_price between 1000000 and 3000000 then 'medium'
            else 'high'
        end as price_category
    from housing
);

--fact_propertyinsert into fact_property
select 
    row_number() over (order by h.property_price) as property_id,
    
    l.location_id,
    f.feature_id,
    pc.price_category_id,

    h.property_price,
    h.floor_size,
    h.monthly_repayment

from housing h

join dim_location l
    on h.city = l.city
   and h.province = l.province

join dim_property_features f
    on h.bedrooms = f.bedrooms
   and h.parking = f.parking

join (
    select *,
        case 
            when property_price < 1000000 then 'low'
            when property_price between 1000000 and 3000000 then 'medium'
            else 'high'
        end as price_category
    from housing
) h2
    on h.property_price = h2.property_price

join dim_price_category pc
    on h2.price_category = pc.price_category;