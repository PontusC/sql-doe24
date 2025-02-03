-- step 4, fix primary key for each table
begin transaction;
update migrations set version = 4;

-- characters
create table new_characters (
    character_id integer primary key not null,
    name varchar not null,
    normalized_name varchar not null,
    gender varchar);

insert into new_characters select
    character_id,
    name,
    normalized_name,
    gender
from characters;

drop table characters;
alter table new_characters rename to characters;

-- locations
create table new_locations (
    location_id integer primary key not null,
    name varchar not null,
    normalized_name varchar not null);

insert into new_locations select
    location_id,
    name,
    normalized_name
from locations;

drop table locations;
alter table new_locations rename to locations;

-- episodes
create table new_episodes (
    episode_id integer primary key not null,
    image_url varchar,
    imdb_rating float,
    imdb_votes integer,
    number_in_season integer not null,
    number_in_series integer not null,
    original_air_date date not null,
    original_air_year integer not null,
    production_code varchar not null,
    season integer not null,
    title varchar not null,
    us_viewers_in_millions float,
    video_url varchar,
    views integer
);

insert into new_episodes select * from episodes;
drop table episodes;
alter table new_episodes rename to episodes;

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
        word_count integer
);

insert into new_script_lines select * from script_lines;
drop table script_lines;
alter table new_script_lines rename to script_lines;


commit;