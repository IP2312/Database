drop table regions;
drop table countries;

create table regions
(
    region_id Number(11) constraint regions_primary_key primary key,
    region_name varchar2(25)
);

create table countries
(
    country_id Number(2) constraint countries_primary_key primary key,
    country_name varchar2(40),
    region_id number(11)
);