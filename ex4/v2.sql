-- step 2, fix datatypes in tables (float to int etc)
begin transaction;
update migrations set version = 2;

-- characters
alter table characters add column new_id integer not null default 0;
update characters set new_id = cast(id as int);
alter table characters drop column id;
alter table characters rename column new_id to id;

-- locations
alter table locations add column new_id integer not null default 0;
update locations set new_id = cast(id as int);
alter table locations drop column id;
alter table locations rename column new_id to id;

-- episodes
create table new_episodes (
    id integer not null,
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

insert into new_episodes select 
    cast(id as int),
    image_url,
    imdb_rating,
    cast(imdb_votes as int),
    cast(number_in_season as int),
    cast(number_in_series as int),
    original_air_date,
    cast(original_air_year as int),
    production_code,
    cast(season as int),
    title,
    us_viewers_in_millions,
    video_url,
    cast(views as int)
from episodes;

drop table episodes;
alter table new_episodes rename to episodes;

-- script lines
create table new_script_lines (
    id integer not null,
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

insert into new_script_lines select
    cast(id as int),
    cast(episode_id as int),
    cast(number as int),
    raw_text,
    cast(timestamp_in_ms as int),
    speaking_line,
    cast(character_id as int),
    cast(location_id as int),
    raw_character_text,
    raw_location_text,
    spoken_words,
    normalized_text,
    cast(word_count as int)
from script_lines;

drop table script_lines;
alter table new_script_lines rename to script_lines;

commit;