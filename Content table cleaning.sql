Use `socialbuzzdb`;
Select * from Content;
Select * from reactions;
select * from reactiontypes;

-- 1. DROP the MyUnknown  Column from content
alter table Content
drop MyUnknownColumn;

-- 2. Drop the URL column from content table
alter table content
drop URL;

-- 3. count of  null values  in each column of content table.
select 
	sum(case when 'Content ID' is null or 'Content ID' =' ' then 1 else 0 end) as BlankContentIDCount,
    sum(case when 'Type' is null or 'Type'=' ' then 1 else 0 end) as BlankTypeCount,
    SUM(CASE WHEN `Category` IS NULL OR `Category` = '' THEN 1 ELSE 0 END) AS BlankCategoryCount   
from  content;

-- Closer look of the Category Column
select distinct Category from content;

-- Let's remove the "" sign
SET SQL_SAFE_UPDATES = 0;

update content set Category = replace(Category, '"', ' ');

-- Let's change the capital case letter to small case letter
update content set Category= lower(Category);













