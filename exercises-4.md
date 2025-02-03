# Exercises 4
Modify existing db in sqlite [the-simpsons.sql](/ex4/the-simpsons.sql) in 5 below steps following a version pattern.

1. [All tables have a simpsons_ prefix. It's redundant, remove the prefix from all tables.](/ex4/v1.sql)
2. [Some fields have been parsed as FLOAT when they should have been INTEGER. Things such as ids, episode number, season number, etc. Go through the schema and convert FLOAT to INT as needed.](/ex4/v2.sql)
3. [We need better naming across tables. Now each table has a field called id, I want you to rename to include the name of the table the id is for. So for example: characters_id, locations_id, etc..](/ex4/v3.sql)
4. [We don't have primary keys on our tables! Create a primary key for each table.](/ex4/v4.sql)
5. [Put in place FOREIGN KEY where needed. Some fields might also need to be converted to the right type (i.e., if they shall point to an id you previously converted to an INTEGER).](/ex4/v5.sql)
