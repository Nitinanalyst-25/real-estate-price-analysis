create database real_estate_db;
use real_estate_db;
describe train;
alter table train rename as training_dataset;
select count(*) as total_records from training_dataset;

select * from training_dataset
limit 10;

select id, Neighborhood, OverallQual, YearBuilt, GrLivArea, TotalBsmtSF, BedroomAbvGr, FullBath, GarageArea, SalePrice
from training_dataset
limit 10;

describe training_dataset;

select
sum(case when LotFrontage is null then 1 else 0 end) as LotFrontage_missing,
sum(case when Alley is null then 1 else 0 end) as Alley_missing,
sum(case when MasVnrType is null then 1 else 0 end) as MasVnrType_missing,
sum(case when FireplaceQu is null then 1 else 0 end) as FireplaceQu_missing,
sum(case when PoolQC is null then 1 else 0 end) as PoolQC_missing
from training_dataset;

select 
count(*)-count(LotFrontage) as LotFrontage_missing,
count(*)-count(Alley) as Alley_missing,
count(*)-count(MasVnrType) as MasVnrType_missing,
count(*)-count(FireplaceQu) as FireplaceQu_missing,
count(*)-count(PoolQC) as PoolQC_missing
from training_dataset;

# Business Segementation Queries

# Query 1 — Neighbourhood Price Analysis
# Which neighbourhoods command the highest average property prices and 
# how does each neighbourhood compare to the overall market average
select 
Neighborhood, 
round(avg(SalePrice)) as Avg_saleprice,
count(*) as total_properties
from training_dataset
group by Neighborhood
order by Avg_saleprice desc;

# Query 2- Overall Quality vs Sale Price Analysis
# Does a higher quality rating always translate to a higher sale price — 
# and how much does each quality grade impact property value?

select
OverallQual,
round(avg(SalePrice)) as Avg_saleprice,
min(SalePrice) as min_saleprice,
max(SalePrice) as max_saleprice,
count(*) as total_properties
from training_dataset
group by OverallQual
order by OverallQual desc;

# Query 3 — Property Age vs Sale Price Analysis
# How does the age of a property impact its sale price — do newer properties 
# consistently command higher prices than older ones

select min(YearBuilt) as minimum_year, max(YearBuilt) as max_year from training_dataset;

select 
case 
when YearBuilt between 1872 and 1891 then '1872-1891'
when YearBuilt between 1892 and 1911 then '1892-1911'
when YearBuilt between 1912 and 1931 then '1912-1931'
when YearBuilt between 1932 and 1951 then '1932-1951'
when YearBuilt between 1952 and 1971 then '1952-1971'
when YearBuilt between 1972 and 1991 then '1972-1991'
when YearBuilt between 1992 and 2010 then '1992-2010'
else 'Other'
end as time_frame_built,
round(avg(SalePrice),0) as Avg_saleprice,
count(*) as total_properties
from training_dataset
group by time_frame_built
order by avg_saleprice desc;

# Query 4 — Property Size vs Sale Price Analysis
# How does the living area size of a property impact its sale price — and can we 
# identify clear size segments that command different price premiums

select min(GrLivArea) as min_GrLivArea, max(GrLivArea) as max_GrLivArea, round(avg(GrLivArea),0) as avg_GrLivArea from training_dataset;

select
case
when GrLivArea < 1000 then "Small"
when GrLivArea between 1000 and 1999 then "Medium"
when GrLivArea between 2000 and 2999 then "Large"
when GrLivArea >=3000 then "Very Large"
else "Others" 
end as size_category,
round(avg(saleprice),0) as avg_salesprice,
round(avg(saleprice/GrLivArea),2) as avg_saleprice_per_sqft,
count(*) as total_properties
from training_dataset
group by size_category
order by avg_salesprice ;

# Query 5 — Bedroom & Bathroom Configuration vs Sale Price Analysis
# Which bedroom and bathroom configuration commands the highest sale price — 
# and what is the optimal property configuration for maximum value

select
concat(BedroomAbvGr,' BedAvGr/ ',FullBath,' FullBath') as property_config,
round(avg(saleprice),0) as avg_sale_price,
count(*) as total_properties
from training_dataset
group by property_config
having total_properties >=20
order by avg_sale_price desc;

# Advance SQL-CTEs and Window Function
# Advanced query
# Query 1 — Property Valuation Intelligence
# For every individual property — how does its price compare to its 
# neighbourhood average, and where does it rank within its neighbourhood

with neighborhood_avg as (
select
neighborhood,
round(avg(saleprice),0) as avg_neighborhood_price
from training_dataset
group by neighborhood
)

select
t.id,
t.Neighborhood,
t.Saleprice,
n.avg_neighborhood_price,
t.Saleprice-n.avg_neighborhood_price as price_vs_neighborhood,
case
when t.saleprice>n.avg_neighborhood_price then 'Above average'
when t.saleprice<n.avg_neighborhood_price then 'Below average'
when t.saleprice=n.avg_neighborhood_price then 'At average'
end as valuation_status,
rank() over(partition by t.neighborhood order by t.saleprice desc) as neighborhood_rank
from training_dataset as t
join neighborhood_avg as n
on t.neighborhood=n.neighborhood
order by t.neighborhood, neighborhood_rank;










































































