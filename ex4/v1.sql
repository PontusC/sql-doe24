-- Step 1. Rename tables, remove simpsons_ prefix
begin transaction;
update migrations set version = 1;

alter table simpsons_characters rename to characters;
alter table simpsons_locations rename to locations;
alter table simpsons_episodes rename to episodes;
alter table simpsons_script_lines rename to script_lines;

commit;