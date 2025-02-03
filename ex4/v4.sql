-- Step 4, fix primary key for each table
begin transaction;
update migrations set version = 4;

-- characters
create table new_characters (
    character_id integer primary key not null,
    name VARCHAR NOT NULL,
    normalized_name VARCHAR NOT NULL,
    gender VARCHAR);

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
    name VARCHAR NOT NULL,
    normalized_name VARCHAR NOT NULL);

insert into new_locations select
    location_id,
    name,
    normalized_name
from locations;

drop table locations;
alter table new_locations rename to locations;

-- episodes
create table new_episodes (
    episode_id integer primary key NOT NULL,
    image_url VARCHAR,
    imdb_rating FLOAT,
    imdb_votes integer,
    number_in_season integer NOT NULL,
    number_in_series integer NOT NULL,
    original_air_date DATE NOT NULL,
    original_air_year integer NOT NULL,
    production_code VARCHAR NOT NULL,
    season integer NOT NULL,
    title VARCHAR NOT NULL,
    us_viewers_in_millions FLOAT,
    video_url VARCHAR,
    views integer
);

insert into new_episodes select * from episodes;
drop table episodes;
alter table new_episodes rename to episodes;

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
        word_count integer
);

insert into new_script_lines select * from script_lines;
drop table script_lines;
alter table new_script_lines rename to script_lines;


commit;