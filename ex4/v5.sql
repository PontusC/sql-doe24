-- step 5, fix foreign keys and their datatypes
begin transaction;
update migrations set version = 5;

-- script lines
create table new_script_lines (
        script_line_id integer primary key not null,
        episode_id integer not null,
        number integer not null,
        raw_text varchar not null,
        timestamp_in_ms integer not null,
        speaking_line varchar not null,
        character_id integer,
        location_id integer,
        raw_character_text varchar,
        raw_location_text varchar,
        spoken_words varchar,
        normalized_text varchar,
        word_count integer,
        foreign key(episode_id) references episodes(episode_id),
        foreign key(character_id) references characters(character_id),
        foreign key(location_id) references locations(location_id)
);

insert into new_script_lines select * from script_lines;
drop table script_lines;
alter table new_script_lines rename to script_lines;

commit;