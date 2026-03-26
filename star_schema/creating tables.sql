use database property24;
use schema project;

select * from housing;


--creating dim_location table
create table dim_location (
    location_id int,
    city string,
    province string
);

-- dim_property_features
create table dim_property_features (
    feature_id int,
    bedrooms int,
    parking int
);

-- dim_price_category
create table dim_price_category (
    price_category_id int,
    price_category string
);

-- fact_property
create table fact_property (
    property_id int,
    location_id int,
    feature_id int,
    price_category_id int,
    property_price float,
    floor_size float,
    monthly_repayment float
);