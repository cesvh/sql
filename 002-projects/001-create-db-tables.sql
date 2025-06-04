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
insert into universe.tb_stages(stage_name) values('Historia de la humanidad');
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
	fk_id_event	int not null foreign key references universe.tb_event(id),
    item_description varchar(1000) null,
    active tinyint null default 1 check (active between 0 and 2),
    datetime_create datetime null default getdate(),
    timestamp_update datetime null default getdate()
);

insert into universe.tb_event_description (fk_id_event_description, item_description) values(1, '¿Qué es la Teoría del Big Bang?

La Teoría del Big Bang o Teoría de la Gran Explosión es el modelo cosmológico de mayor aceptación en la actualidad científica, o sea, la explicación más aceptada del origen del Universo en la actualidad. Su nombre, «big bang», significa en inglés «gran explosión».

Su nombre proviene de la explicación que propone del inicio de todas las cosas: un estado originario de altísima densidad y temperatura, concentrado en un punto mínimo. Sus enormes fuerzas interiores provocaron una gigantesca explosión que dio origen al universo, al tiempo y al espacio (o espacio-tiempo, como propone la física contemporánea).

Conforme a la Teoría del Big Bang, el universo se halla en una expansión constante, como han evidenciado numerosas observaciones astronómicas, que presentan evidencias de la explosión inicial que lo habría puesto en marcha, hace unos 13.800 millones de años.');

insert into universe.tb_event_description (fk_id_event_description, item_description) values(2, 'Año Cero

El año cero no existe en el calendario gregoriano ni en el juliano. El año 1 a. C. precede inmediatamente al año 1 d. C. Es decir que después del 31 de diciembre del año 1 a. C. comenzó el 1 de enero del año 1 d. C. Lo mismo acontecería con las décadas, empezando la primera de nuestra Era en el año 1 d. C. y hasta el año 10 d. C., para conformar así la década (diez años) lo que hace que el año 10 d. C. sea parte de la primera década y no de la siguiente.

Los historiadores adoptaron esta convención a partir de su utilización por Beda en su Historia ecclesiastica gentis Anglorum (Historia eclesiástica del pueblo inglés, de 731). Beda no utilizó el cero debido a que los años se cuentan a partir de uno y no de cero. Él conocía bien el número cero, dado que cero fue la primera epacta del ciclo de 11 años utilizado para calcular la fecha de la Pascua, tal como explicó en su obra De temporum ratione (Sobre el recuento del tiempo, de 725).');


use db_planck;

select * from universe.tb_event;
select * from universe.tb_stages;
select * from universe.tb_stages_event;
select * from universe.tb_event_description;
