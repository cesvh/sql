drop database db_universe;
create database db_universe;
use db_universe;

drop table tb_event;
create table tb_event(
    id int primary key not null identity(1,1),
    event_name varchar(200) unique not null,
    event_year bigint not null, -- De -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807 -- -2^63 a 2^63-1 -- 8 bytes;
    standard_deviation bigint null,
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);

insert into tb_event(event_name, event_year) values('La gran expanción', -13770000000);
insert into tb_event(event_name, event_year) values('Inicio de la Era Común', 0);
insert into tb_event(event_name, event_year) values('Inicio del proyecto "Historias"', 2025);
select * from tb_event;

drop table tb_stages;
create table tb_stages(
    id int primary key not null identity(1, 1),
    stage_name varchar(200) unique not null,
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);

insert into tb_stages(stage_name) values('Historia del universo');
insert into tb_stages(stage_name) values('Historia del mundo');
select * from tb_stages;

drop table tb_stages;
create table tb_stages_event(
	fk_id_event	int not null foreign key references tb_event(id),
	fk_id_stages int not null foreign key references tb_stages(id),
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);

drop table tb_event_description;
create table tb_event_description(
	id int primary key not null identity(1, 1),
	fk_id_event_description	int not null foreign key references tb_event(id),
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);
