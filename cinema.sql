BEGIN;


CREATE TABLE IF NOT EXISTS public.cinema
(
    id integer NOT NULL,
    name character varying(70) NOT NULL,
    id_movie integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.movie
(
    id integer NOT NULL,
    title character varying(70) NOT NULL,
    description character varying(500) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.showtime
(
    id integer NOT NULL,
    timing double precision NOT NULL,
    id_movie integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.ticket
(
    id integer NOT NULL,
    name character varying(70) NOT NULL,
    date character varying(8) NOT NULL,
    price integer NOT NULL,
    id_showtime integer NOT NULL,
    "row" integer NOT NULL,
    place integer NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.cinema
    ADD FOREIGN KEY (id_movie)
    REFERENCES public.movie (id)
    NOT VALID;


ALTER TABLE public.showtime
    ADD FOREIGN KEY (id_movie)
    REFERENCES public.movie (id)
    NOT VALID;


ALTER TABLE public.ticket
    ADD FOREIGN KEY (id_showtime)
    REFERENCES public.showtime (id)
    NOT VALID;

END;