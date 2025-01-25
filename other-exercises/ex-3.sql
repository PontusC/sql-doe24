-- Make tables

create table [positions]
(
    [positon_id] integer primary key,
    [title] nvarchar not null,
    [date_applied] DATETIME not null,
    [contact_id] integer not null,
    foreign key (contact_id) references contact (contact_id)
);

create table [company]
(
    [company_id] integer primary key,
    [name] nvarchar not null
);

create table [office]
(
    [office_id] integer primary key,
    [adress] nvarchar not null
);

create table [contact]
(
    [contact_id] integer primary key,
    [first_name] nvarchar not null,
    [last_name] nvarchar not null,
    [phone] nvarchar not null,
    [email] nvarchar not null,
    [company_id] integer not null,
    [office_id] integer,
    foreign key (company_id) references company (company_id),
    foreign key (office_id) references office (office_id)
);

-- Insert

insert into company values
    (1, 'comp_1'),
    (2, 'comp_2'),
    (3, 'comp_3'),
    (4, 'comp_4');

insert into office values
    (1, 'street 1'),
    (2, 'street 2'),
    (3, 'street 3'),
    (4, 'street 4'),
    (5, 'street 5'),
    (6, 'street 6');

insert into contact values
    (1, 'person', 'one', '+123123123', 'mail@domain.com', 1, 1),
    (2, 'person', 'two', '+123123123', 'mail@domain.com', 1, 2),
    (3, 'person', 'three', '+123123123', 'mail@domain.com', 2, 3),
    (4, 'person', 'four', '+123123123', 'mail@domain.com', 3, 4),
    (5, 'person', 'five', '+123123123', 'mail@domain.com', 4, 5),
    (6, 'person', 'six', '+123123123', 'mail@domain.com', 4, 6),
    (7, 'person', 'seven', '+123123123', 'mail@domain.com', 4, null);

insert into positions values
    (1, 'DevOps', '2025-01-01 12:12:12', 1),
    (2, 'DevOpser', '2025-01-02 12:12:12', 2),
    (3, 'More DevOps', '2025-01-03 12:12:12', 3),
    (4, 'DB', '2025-01-04 12:12:12', 4),
    (5, 'More DB', '2025-01-05 12:12:12', 5),
    (6, 'Morer devops', '2025-01-06 12:12:12', 6),
    (7, 'Other devops', '2025-01-07 12:12:12', 7),
    (8, 'Dev', '2025-01-07 12:12:12', 3),
    (9, 'Ops', '2025-01-08 12:12:12', 5);