-- These queries are queries I ran on Snowflake's warehouse.

use role accountadmin;

create warehouse if not exists house_warehouse with warehouse_size = 'x-small';
create database if not exists house_data;
create role if not exists admin_role;

grant usage, operate on warehouse house_warehouse to role admin_role;
show grants on warehouse house_warehouse;
grant role admin_role to user deecodes;
grant all on database house_data to role admin_role;

use role admin_role;
use warehouse house_warehouse;
show databases like 'house_data';
create schema if not exists house_data.for_sale;
create table for_sale.house_for_sale (
    id serial primary key,
    name varchar,
    price float,
    location varchar,
    description text
)

select * from house_for_sale where price > 10000000;