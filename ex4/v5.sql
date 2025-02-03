-- Step 5, fix foreign keys and their datatypes
begin transaction;
update migrations set version = 5;

-- script lines
create table new_script_lines (
        script_line_id integer primary key NOT NULL,
        episode_id integer NOT NULL,
        number integer NOT NULL,
        raw_text VARCHAR NOT NULL,
        timestamp_in_ms integer NOT NULL,
        speaking_line VARCHAR NOT NULL,
        character_id integer,
        location_id integer,
        raw_character_text VARCHAR,
        raw_location_text VARCHAR,
        spoken_words VARCHAR,
        normalized_text VARCHAR,
        word_count integer,
        foreign key(episode_id) references episodes(episode_id),
        foreign key(character_id) references characters(character_id),
        foreign key(location_id) references locations(location_id)
);

insert into new_script_lines select * from script_lines;
drop table script_lines;
alter table new_script_lines rename to script_lines;

commit;