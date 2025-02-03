-- Step 3, fix naming, e.g. id to customer_id, location_id
begin transaction;
update migrations set version = 3;

alter table characters rename column id to character_id;
alter table locations rename column id to location_id;
alter table episodes rename column id to episode_id;
alter table script_lines rename column id to script_line_id;

commit;