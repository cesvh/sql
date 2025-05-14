drop database db_planck;
create database db_planck;
use db_planck;

create schema universe;
go

drop table universe.tb_event;
create table universe.tb_event(
    id int primary key not null identity(1,1),
    event_name varchar(200) unique not null,
    event_year bigint not null, -- De -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807 -- -2^63 a 2^63-1 -- 8 bytes;
    standard_deviation bigint null,
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);

insert into universe.tb_event(event_name, event_year) values('La gran expansión', -13770000000);
insert into universe.tb_event(event_name, event_year) values('Inicio de la Era Común', 0);
insert into universe.tb_event(event_name, event_year) values('Inicio del proyecto "Historias"', 2025);
select * from universe.tb_event;

drop table universe.tb_stages;
create table universe.tb_stages(
    id int primary key not null identity(1, 1),
    stage_name varchar(200) unique not null,
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);

insert into universe.tb_stages(stage_name) values('Historia del universo');
insert into universe.tb_stages(stage_name) values('Historia del mundo');
select * from universe.tb_stages;

drop table universe.tb_stages_event;
create table universe.tb_stages_event(
	fk_id_event	int not null foreign key references universe.tb_event(id),
	fk_id_stages int not null foreign key references universe.tb_stages(id),
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);

drop table universe.tb_event_description;
create table universe.tb_event_description(
	id int primary key not null identity(1, 1),
	fk_id_event_description	int not null foreign key references universe.tb_event(id),
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);


use db_planck;

select * from universe.tb_event;
select * from universe.tb_stages;
select * from universe.tb_stages_event;
select * from universe.tb_event_description;
