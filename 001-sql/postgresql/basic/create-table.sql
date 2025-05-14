CREATE TABLE public.books (
    id serial,
    title character varying, -- varchar is an aias for character varying
    PRIMARY KEY (id)
);

-- Estructura de la tabla
/*
SELECT table_name, column_name, udt_name, character_maximum_length
FROM information_schema.columns 
WHERE table_name = 'books';
*/
create table meteorite_landing (
	id_ml serial,
	name_ml varchar(500),
	id int,
	nametype varchar(200),
	recclass varchar(200),
	mass_g float,
	fall varchar(200),
	datetime_ml date,
	reclat varchar(200),
	reclong varchar(200),
	GeoLocation varchar(200)
);
'
"

^(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)$

INSERT INTO public.meteorite_landing\(name_ml, id, nametype, recclass, mass_g, fall, datetime_ml, reclat, reclong, geolocation\) VALUES \('$1', $2, '$3', '$4', $5, '$6', '$7-01-01', '$8', '$9', '$10'\);


SELECT * FROM public.meteorite_landing;

