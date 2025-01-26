-- Day 3
-- Find a person born between June 21-July 22 (cancer zodiac sign)
-- and on the year of the Rabbit (1963,1975,1987,1999,2011,2023), divide by 12 remainder 7
-- and lives in the same neighbourhood as answer from last exercise (11435 zip code)

select name, birthdate, phone
from customers
where like('%11435', citystatezip) and -- check neighbourhood
mod(substr(birthdate, 0, 5), 12) = 7 and -- check year
-- Check month and date
((cast(substr(birthdate, 7, 1) as int) = 6  and cast(substr(birthdate, 9, 2) as int) >= 21 ) or
(cast(substr(birthdate, 7, 1) as int) = 7  and cast(substr(birthdate, 9, 2) as int) < 22 ));
